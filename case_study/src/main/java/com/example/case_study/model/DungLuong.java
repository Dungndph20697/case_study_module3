package com.example.case_study.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class DungLuong {
    private int id;
    private String tenDungLuong;

    public DungLuong(String tenDungLuong) {
        this.tenDungLuong = tenDungLuong;
    }
}
