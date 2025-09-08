package com.example.case_study.service.impl;

import com.example.case_study.dao.IHoaDonChiTietDAO;
import com.example.case_study.dao.impl.HoaDonChiTietDAOImpl;
import com.example.case_study.model.HoaDonChiTiet;
import com.example.case_study.service.IHDCTService;

public class HDCTServiceImpm implements IHDCTService {
    private IHoaDonChiTietDAO hoaDonChiTietDAO;

    public HDCTServiceImpm() {

        hoaDonChiTietDAO = new HoaDonChiTietDAOImpl();
    }

    @Override
    public void addSpctToGioHang(HoaDonChiTiet hoaDonChiTiet) {
        hoaDonChiTietDAO.addSpctToHoaDon(hoaDonChiTiet);
    }

    @Override
    public void updateSoLuongHdct(int idHdct, int soLuong) {
        hoaDonChiTietDAO.updateSoLuongHdct(idHdct, soLuong);
    }
}
