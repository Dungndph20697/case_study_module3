package com.example.case_study.model;

public class ChucVu {
    private int id;
    private String tenChuVu;
    private String mucLuong;
    private String trangThai;

    public ChucVu(int id, String tenChuVu, String mucLuong, String trangThai) {
        this.id = id;
        this.tenChuVu = tenChuVu;
        this.mucLuong = mucLuong;
        this.trangThai = trangThai;
    }

    public ChucVu(){

    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTenChuVu() {
        return tenChuVu;
    }

    public void setTenChuVu(String tenChuVu) {
        this.tenChuVu = tenChuVu;
    }

    public String getMucLuong() {
        return mucLuong;
    }

    public void setMucLuong(String mucLuong) {
        this.mucLuong = mucLuong;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }
}
