package com.eat.model;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

public class Restaurant {
    private int restaurantId;
    private String name;
    private String description;
    private String cuisineType;
    private String address;
    private String phone;
    private String email;
    private String imageUrl;
    private double rating;
    private int reviewCount;
    private String priceRange;
    private boolean isActive;
    private boolean isTrending;
    private boolean isStudentFriendly;
    private boolean isFamilySpecial;
    private boolean isCoupleSpecial;
    private LocalTime openingTime;
    private LocalTime closingTime;
    private double deliveryFee;
    private double minimumOrderAmount;
    private int estimatedDeliveryTime;
    private boolean isPureVeg;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    private List<Integer> categoryIds;
    private List<Integer> bestForIds;

    public Restaurant() {}

    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getReviewCount() {
        return reviewCount;
    }

    public void setReviewCount(int reviewCount) {
        this.reviewCount = reviewCount;
    }

    public String getPriceRange() {
        return priceRange;
    }

    public void setPriceRange(String priceRange) {
        this.priceRange = priceRange;
    }

    public boolean isActive() {
        return isActive;
    }

    public void setActive(boolean active) {
        isActive = active;
    }

    public boolean isTrending() {
        return isTrending;
    }

    public void setTrending(boolean trending) {
        isTrending = trending;
    }

    public boolean isStudentFriendly() {
        return isStudentFriendly;
    }

    public void setStudentFriendly(boolean studentFriendly) {
        isStudentFriendly = studentFriendly;
    }

    public boolean isFamilySpecial() {
        return isFamilySpecial;
    }

    public void setFamilySpecial(boolean familySpecial) {
        isFamilySpecial = familySpecial;
    }

    public boolean isCoupleSpecial() {
        return isCoupleSpecial;
    }

    public void setCoupleSpecial(boolean coupleSpecial) {
        isCoupleSpecial = coupleSpecial;
    }

    public LocalTime getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(LocalTime openingTime) {
        this.openingTime = openingTime;
    }

    public LocalTime getClosingTime() {
        return closingTime;
    }

    public void setClosingTime(LocalTime closingTime) {
        this.closingTime = closingTime;
    }

    public double getDeliveryFee() {
        return deliveryFee;
    }

    public void setDeliveryFee(double deliveryFee) {
        this.deliveryFee = deliveryFee;
    }

    public double getMinimumOrderAmount() {
        return minimumOrderAmount;
    }

    public void setMinimumOrderAmount(double minimumOrderAmount) {
        this.minimumOrderAmount = minimumOrderAmount;
    }

    public int getEstimatedDeliveryTime() {
        return estimatedDeliveryTime;
    }

    public void setEstimatedDeliveryTime(int estimatedDeliveryTime) {
        this.estimatedDeliveryTime = estimatedDeliveryTime;
    }

    public boolean isPureVeg() {
        return isPureVeg;
    }

    public void setPureVeg(boolean pureVeg) {
        isPureVeg = pureVeg;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public LocalDateTime getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(LocalDateTime updatedAt) {
        this.updatedAt = updatedAt;
    }

    public List<Integer> getCategoryIds() {
        return categoryIds;
    }

    public void setCategoryIds(List<Integer> categoryIds) {
        this.categoryIds = categoryIds;
    }

    public List<Integer> getBestForIds() {
        return bestForIds;
    }

    public void setBestForIds(List<Integer> bestForIds) {
        this.bestForIds = bestForIds;
    }
}
