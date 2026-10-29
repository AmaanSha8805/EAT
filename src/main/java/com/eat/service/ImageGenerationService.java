package com.eat.service;

import com.eat.dao.FoodItemDAO;
import com.eat.model.FoodItem;
import com.eat.util.EnvironmentUtil;
import okhttp3.*;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Service for generating food images using Google Gemini Imagen API.
 * Handles API calls, retry logic, rate limiting, and file storage.
 */
public class ImageGenerationService {
    private static final Logger logger = Logger.getLogger(ImageGenerationService.class.getName());
    
    private static final String GEMINI_API_KEY_ENV = "GEMINI_API_KEY";
    private static final String API_URL = "https://generativelanguage.googleapis.com/v1beta/models/imagen-4:predictImage";
    private static final int MAX_RETRIES = 3;
    private static final long[] RETRY_DELAYS_MS = {1000, 2000, 4000}; // Exponential backoff
    private static final long RATE_LIMIT_DELAY_MS = 1000; // 1 second between requests
    
    private final FoodItemDAO foodItemDAO;
    private final OkHttpClient httpClient;
    private final String imagesDirectory;
    
    public ImageGenerationService() {
        this.foodItemDAO = new FoodItemDAO();
        
        // Configure OkHttp with timeout settings
        this.httpClient = new OkHttpClient.Builder()
                .connectTimeout(30, TimeUnit.SECONDS)
                .readTimeout(60, TimeUnit.SECONDS)
                .writeTimeout(30, TimeUnit.SECONDS)
                .build();
        
        // Set images directory path
        String webappPath = System.getProperty("catalina.base");
        if (webappPath != null) {
            this.imagesDirectory = webappPath + "/webapps/eat/images/foods";
        } else {
            // Fallback for development
            this.imagesDirectory = "src/main/webapp/images/foods";
        }
        
        // Ensure directory exists
        try {
            Files.createDirectories(Paths.get(imagesDirectory));
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Failed to create images directory: " + imagesDirectory, e);
        }
    }
    
    /**
     * Generates images for food items that don't have images.
     * 
     * @param limit Maximum number of items to process (for testing)
     * @return List of generation results with success/failure status
     */
    public List<GenerationResult> generateImagesForFoodItems(int limit) {
        List<GenerationResult> results = new ArrayList<>();
        
        // Check API key
        String apiKey = EnvironmentUtil.getEnv(GEMINI_API_KEY_ENV);
        if (apiKey == null || apiKey.trim().isEmpty()) {
            logger.severe("GEMINI_API_KEY environment variable is not set");
            GenerationResult errorResult = new GenerationResult();
            errorResult.success = false;
            errorResult.errorMessage = "GEMINI_API_KEY environment variable is not set";
            results.add(errorResult);
            return results;
        }
        
        // Get food items without images
        List<FoodItem> foodItems = foodItemDAO.findWithoutImages(limit);
        logger.info("Found " + foodItems.size() + " food items without images");
        
        if (foodItems.isEmpty()) {
            GenerationResult infoResult = new GenerationResult();
            infoResult.success = true;
            infoResult.infoMessage = "No food items found without images";
            results.add(infoResult);
            return results;
        }
        
        // Process each food item
        for (FoodItem foodItem : foodItems) {
            GenerationResult result = generateImageForFoodItem(foodItem, apiKey);
            results.add(result);
            
            // Rate limiting: wait between requests
            if (results.size() < foodItems.size()) {
                try {
                    Thread.sleep(RATE_LIMIT_DELAY_MS);
                } catch (InterruptedException e) {
                    Thread.currentThread().interrupt();
                    logger.warning("Rate limit sleep interrupted");
                    break;
                }
            }
        }
        
        return results;
    }
    
    /**
     * Generates an image for a single food item with retry logic.
     */
    private GenerationResult generateImageForFoodItem(FoodItem foodItem, String apiKey) {
        GenerationResult result = new GenerationResult();
        result.foodId = foodItem.getFoodId();
        result.foodName = foodItem.getName();
        
        // Construct prompt
        String cuisineType = foodItem.getCategory(); // We stored cuisine_type in category temporarily
        String prompt = String.format(
            "Photorealistic food photography of %s, %s cuisine, professional lighting, restaurant quality presentation, high detail, appetizing",
            foodItem.getName(),
            cuisineType != null && !cuisineType.isEmpty() ? cuisineType : "authentic"
        );
        
        logger.info("Generating image for food ID " + foodItem.getFoodId() + ": " + foodItem.getName());
        
        // Try with retries
        for (int attempt = 0; attempt < MAX_RETRIES; attempt++) {
            try {
                String imageUrl = callGeminiAPI(prompt, apiKey);
                
                if (imageUrl != null && !imageUrl.isEmpty()) {
                    // Download and save the image
                    String savedPath = downloadAndSaveImage(imageUrl, foodItem.getFoodId());
                    
                    if (savedPath != null) {
                        // Update database
                        boolean updated = foodItemDAO.updateImageUrl(foodItem.getFoodId(), savedPath);
                        
                        if (updated) {
                            result.success = true;
                            result.imageUrl = savedPath;
                            result.infoMessage = "Successfully generated and saved image";
                            logger.info("Successfully generated image for food ID " + foodItem.getFoodId());
                            return result;
                        } else {
                            result.success = false;
                            result.errorMessage = "Failed to update database with image URL";
                            logger.warning("Failed to update database for food ID " + foodItem.getFoodId());
                            return result;
                        }
                    } else {
                        result.success = false;
                        result.errorMessage = "Failed to download/save image";
                        logger.warning("Failed to download image for food ID " + foodItem.getFoodId());
                    }
                }
            } catch (Exception e) {
                logger.log(Level.WARNING, "Attempt " + (attempt + 1) + " failed for food ID " + foodItem.getFoodId(), e);
                
                if (attempt < MAX_RETRIES - 1) {
                    try {
                        Thread.sleep(RETRY_DELAYS_MS[attempt]);
                    } catch (InterruptedException ie) {
                        Thread.currentThread().interrupt();
                        break;
                    }
                }
            }
        }
        
        result.success = false;
        result.errorMessage = "Failed after " + MAX_RETRIES + " attempts";
        return result;
    }
    
    /**
     * Calls the Gemini Imagen API to generate an image.
     */
    private String callGeminiAPI(String prompt, String apiKey) throws IOException {
        JSONObject requestBody = new JSONObject();
        requestBody.put("prompt", prompt);
        requestBody.put("numberOfImages", 1);
        requestBody.put("aspectRatio", "1:1");
        requestBody.put("personGeneration", "ALLOW_ADULT");
        
        Request request = new Request.Builder()
                .url(API_URL + "?key=" + apiKey)
                .post(RequestBody.create(requestBody.toString(), MediaType.parse("application/json")))
                .build();
        
        try (Response response = httpClient.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("API request failed with code: " + response.code());
            }
            
            String responseBody = response.body().string();
            JSONObject jsonResponse = new JSONObject(responseBody);
            
            JSONArray images = jsonResponse.optJSONArray("images");
            if (images != null && images.length() > 0) {
                JSONObject image = images.getJSONObject(0);
                return image.optString("imageUri");
            }
            
            return null;
        }
    }
    
    /**
     * Downloads the generated image and saves it locally.
     */
    private String downloadAndSaveImage(String imageUrl, int foodId) throws IOException {
        Request request = new Request.Builder()
                .url(imageUrl)
                .build();
        
        try (Response response = httpClient.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Image download failed with code: " + response.code());
            }
            
            byte[] imageBytes = response.body().bytes();
            if (imageBytes.length == 0) {
                throw new IOException("Downloaded image is empty");
            }
            
            // Generate filename
            String timestamp = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyyMMdd_HHmmss"));
            String filename = "food_" + foodId + "_" + timestamp + ".jpg";
            String filepath = imagesDirectory + File.separator + filename;
            
            // Save file
            try (FileOutputStream fos = new FileOutputStream(filepath)) {
                fos.write(imageBytes);
            }
            
            // Return relative path for database storage
            return "images/foods/" + filename;
        }
    }
    
    /**
     * Result class for image generation operations.
     */
    public static class GenerationResult {
        public int foodId;
        public String foodName;
        public boolean success;
        public String imageUrl;
        public String errorMessage;
        public String infoMessage;
    }
}
