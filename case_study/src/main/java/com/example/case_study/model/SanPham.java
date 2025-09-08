package com.example.case_study.model;

import lombok.*;

@Builder

public class SanPham {
    private int id;
    private String tenSanPham;

    public SanPham() {
    }

    public SanPham(int id, String tenSanPham) {
        this.id = id;
        this.tenSanPham = tenSanPham;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }
}
