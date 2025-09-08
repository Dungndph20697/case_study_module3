package com.example.case_study.service.impl;

import com.example.case_study.dao.IHoaDonChiTietDAO;
import com.example.case_study.dao.impl.HoaDonChiTietDAOImpl;
import com.example.case_study.model.HoaDonChiTiet;
import com.example.case_study.service.IGioHangService;

import java.util.List;

public class GioHangServiceImpl implements IGioHangService {
    private IHoaDonChiTietDAO hoaDonChiTietDAO;

    public GioHangServiceImpl() {
        hoaDonChiTietDAO = new HoaDonChiTietDAOImpl();
    }

    @Override
    public List<HoaDonChiTiet> getGioHangByIdUser(int idUser, int idHd) {
        return hoaDonChiTietDAO.getAllSpctInHoaDon(idHd,idUser);
    }
}
