package com.eat.model;

public class CartItem {
    private int foodId;
    private String foodName;
    private String foodImageUrl;
    private double price;
    private int quantity;
    private int restaurantId;
    private String restaurantName;

    public CartItem() {}

    public CartItem(int foodId, String foodName, String foodImageUrl, double price, int quantity, int restaurantId, String restaurantName) {
        this.foodId = foodId;
        this.foodName = foodName;
        this.foodImageUrl = foodImageUrl;
        this.price = price;
        this.quantity = quantity;
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
    }

    public int getFoodId() {
        return foodId;
    }

    public void setFoodId(int foodId) {
        this.foodId = foodId;
    }

    public String getFoodName() {
        return foodName;
    }

    public void setFoodName(String foodName) {
        this.foodName = foodName;
    }

    public String getFoodImageUrl() {
        return foodImageUrl;
    }

    public void setFoodImageUrl(String foodImageUrl) {
        this.foodImageUrl = foodImageUrl;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public double getSubtotal() {
        return price * quantity;
    }
}
