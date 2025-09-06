package com.example.case_study.model;

import lombok.ToString;

@ToString
public class Hang {
    private int id;
    private String tenHang;

    public Hang() {
    }

    public Hang(int id) {
        this.id = id;
    }

    public Hang(int id, String tenHang) {
        this.id = id;
        this.tenHang = tenHang;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenHang() {
        return tenHang;
    }

    public void setTenHang(String tenHang) {
        this.tenHang = tenHang;
    }
}