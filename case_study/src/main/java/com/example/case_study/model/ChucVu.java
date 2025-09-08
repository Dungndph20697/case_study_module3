package com.example.case_study.model;

import lombok.ToString;

@ToString
public class ChucVu {
    private int id;
    private String tenChuVu;

    public ChucVu(int id, String tenChuVu) {
        this.id = id;
        this.tenChuVu = tenChuVu;
    }

    public ChucVu(){

    }

    public ChucVu(String tenChuVu) {
        this.tenChuVu = tenChuVu;
    }
    public ChucVu(int id){
        this.id = id;
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

}
