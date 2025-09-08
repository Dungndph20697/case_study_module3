package com.example.case_study.model;

import com.example.case_study.model.nguoidung.ProductUser;
import lombok.*;

import java.util.Date;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@ToString
public class HoaDon {
    private int id;
    private ProductUser user;
    private String maHoaDon;
    private String ngayTao;
    private String ngayThanhToan;
    private int trangThai;
}
