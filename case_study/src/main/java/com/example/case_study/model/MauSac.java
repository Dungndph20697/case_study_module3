package com.example.case_study.model;

import lombok.Builder;
import lombok.ToString;

@Builder
@ToString
public class MauSac {
    private int id;
    private String mauSac; // đổi từ mau_sac -> mauSac

    public MauSac() {
    }

    public MauSac(int id, String mauSac) {
        this.id = id;
        this.mauSac = mauSac;
    }

    public MauSac(int id) {
        this.id = id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMauSac() {
        return mauSac;
    }

    public void setMauSac(String mauSac) {
        this.mauSac = mauSac;
    }
}
