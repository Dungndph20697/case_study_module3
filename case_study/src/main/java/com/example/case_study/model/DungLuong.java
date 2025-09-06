package com.example.case_study.model;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class DungLuong {
    private int id;
    private String tenDungLuong;

    public DungLuong(String tenDungLuong) {
        this.tenDungLuong = tenDungLuong;
    }
}
