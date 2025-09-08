package com.example.case_study.service.impl;

import com.example.case_study.dao.IHoaDonDAO;
import com.example.case_study.dao.impl.HoaDonDaoImpl;
import com.example.case_study.model.HoaDon;
import com.example.case_study.model.nguoidung.ProductUser;
import com.example.case_study.service.IHoaDonService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class HoaDonServicrImpl implements IHoaDonService {
    private IHoaDonDAO hoaDonDAO;

    public HoaDonServicrImpl() {
        hoaDonDAO = new HoaDonDaoImpl();
    }

    @Override
    public void insertHoaDon(int idUser) {
        HoaDon hd = new HoaDon();
        Date ngayTao = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH/mm/ss");
        String formattedDate = sdf.format(ngayTao);
        hd.setMaHoaDon("HD001");
        hd.setUser(new ProductUser(idUser));
        hd.setNgayTao(formattedDate);
        hd.setTrangThai(0);
        hoaDonDAO.insertHoaDon(hd);

    }

    @Override
    public HoaDon getHoaDonTrangThaiByIdUser(int idUser, int trangThai) {
        HoaDon hoaDon = hoaDonDAO.getHoaDonTrangThaiByIdUser(idUser, trangThai);
        return hoaDon;
    }

}
