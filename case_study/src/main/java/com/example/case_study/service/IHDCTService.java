package com.example.case_study.service;

import com.example.case_study.model.HoaDonChiTiet;

public interface IHDCTService {
    void addSpctToGioHang(HoaDonChiTiet hoaDonChiTiet);

    void updateSoLuongHdct(int idHdct, int soLuong);
}
