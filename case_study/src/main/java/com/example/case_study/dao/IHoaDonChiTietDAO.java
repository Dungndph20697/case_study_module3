package com.example.case_study.dao;

import com.example.case_study.model.HoaDonChiTiet;

import java.util.List;

public interface IHoaDonChiTietDAO {
    void addSpctToHoaDon(HoaDonChiTiet hoaDonChiTiet);

    List<HoaDonChiTiet> getAllSpctInHoaDon(int idHoaDon,int idNguoiDung);

    HoaDonChiTiet getHdctByIdHdAndIdSpct(int idHd, int idSpct);

    void updateSoLuongHdct(int idHdct, int soLuong);
}
