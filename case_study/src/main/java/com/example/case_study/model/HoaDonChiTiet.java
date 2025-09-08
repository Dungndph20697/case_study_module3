package com.example.case_study.model;

import lombok.*;

import java.math.BigDecimal;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class HoaDonChiTiet {
    private int id;
    private SanPhamChiTiet spct;
    private HoaDon hd;
    private int soLuong;
    private BigDecimal donGia;
}
