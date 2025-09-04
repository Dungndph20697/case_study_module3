package com.example.case_study.model;


import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class SanPhamChiTiet {
    private int id;
    private String moTa;
    private double gia;
    private int soLuong;
    private String anh;
    private int trangThai;
    private DungLuong dungLuong;
}
