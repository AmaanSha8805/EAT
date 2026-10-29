package com.eat.model;

import java.time.LocalDateTime;

public class BestForCategory {
    private int bestForId;
    private String name;
    private String description;
    private LocalDateTime createdAt;

    public BestForCategory() {}

    public int getBestForId() {
        return bestForId;
    }

    public void setBestForId(int bestForId) {
        this.bestForId = bestForId;
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

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
