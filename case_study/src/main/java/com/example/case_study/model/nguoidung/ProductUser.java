package com.example.case_study.model.nguoidung;

public class ProductUser {
    private int id;
    private String name;
    private String specs;
    private double price;
    private double oldPrice;
    private String image;
    private double rating;
    public ProductUser() {
    }

    public ProductUser(int id, String name, String specs, double price, double oldPrice, String image, double rating) {
        this.id = id;
        this.name = name;
        this.specs = specs;
        this.price = price;
        this.oldPrice = oldPrice;
        this.image = image;
        this.rating = rating;
    }

    // getter/setter

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSpecs() {
        return specs;
    }

    public void setSpecs(String specs) {
        this.specs = specs;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getOldPrice() {
        return oldPrice;
    }

    public void setOldPrice(double oldPrice) {
        this.oldPrice = oldPrice;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }
}
