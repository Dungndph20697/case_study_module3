package com.example.case_study.service.impl;

import com.example.case_study.dao.IHoaDonDAO;
import com.example.case_study.model.HoaDonChiTiet;
import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.model.nguoidung.ProductUser;
import com.example.case_study.service.*;
import com.example.case_study.model.HoaDon;

import java.util.List;

public class TrangChuImpl implements ITrangChu {
    private IHoaDonService hoaDonService;
    private IHDCTService hdctService;
    private ICRUService sanPhamChiTietService;
    private IGioHangService gioHangService;

    public TrangChuImpl() {
        hoaDonService = new HoaDonServicrImpl();
        hdctService = new HDCTServiceImpm();
        sanPhamChiTietService = new SanPhamChiTietServiceImpl();
        gioHangService = new GioHangServiceImpl();
    }

    @Override
    public void addSpctToGioHang(int idSpct, int idUser) {
        HoaDon hd = hoaDonService.getHoaDonTrangThaiByIdUser(idUser, 0);
        List<HoaDonChiTiet> hdctList = gioHangService.getGioHangByIdUser(idUser, hd.getId());
        boolean check = false;

        SanPhamChiTiet spct = (SanPhamChiTiet) sanPhamChiTietService.findById(idSpct);

        if (hd == null) {
            hoaDonService.insertHoaDon(idUser);
            HoaDon hd1 = hoaDonService.getHoaDonTrangThaiByIdUser(idUser, 0);
            HoaDonChiTiet hdct = new HoaDonChiTiet();
            hdct.setHd(hd1);
            hdct.setSpct(spct);
            hdct.setSoLuong(1);
            hdct.setDonGia(spct.getGia());
            hdctService.addSpctToGioHang(hdct);
        } else {
            for (HoaDonChiTiet hdct : hdctList) {
                if (hdct.getSpct().getId() == idSpct) {
                    //update so luong hdct
                    hdctService.updateSoLuongHdct(hdct.getId(), hdct.getSoLuong() + 1);
                    return;
                }
            }
            HoaDonChiTiet hdct2 = new HoaDonChiTiet();
            hdct2.setHd(hd);
            hdct2.setSpct(spct);
            hdct2.setSoLuong(1);
            hdct2.setDonGia(spct.getGia());
            hdctService.addSpctToGioHang(hdct2);
        }
    }

}
