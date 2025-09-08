package com.example.case_study.dao.impl;

import com.example.case_study.dao.IHoaDonChiTietDAO;
import com.example.case_study.model.*;
import com.example.case_study.utils.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class HoaDonChiTietDAOImpl implements IHoaDonChiTietDAO {

    private String INSERT_HDCT_SQL = "INSERT INTO `hoa_don_chi_tiet` (`id_san_pham_chi_tiet`, `id_hoa_don`, `gia`, `so_luong`) VALUE\n" +
            "(?, ?, ?, ?);";

    private String SELECT_ALL_SPCT_IN_HD_BY_ID_HD = "select hdct.id as 'id_hoa_don_chi_tiet', hdct.so_luong, hdct.gia, hd.id as 'id_hoa_don', hd.trang_thai, spct.id as 'id_san_pham_chi_tiet',spct.anh,sp.ten_sp,dl.ten_dung_luong,ms.ten_mau_sac from hoa_don_chi_tiet hdct \n" +
            "join hoa_don hd on hd.id = hdct.id_hoa_don\n" +
            "join san_pham_chi_tiet spct on spct.id = hdct.id_san_pham_chi_tiet\n" +
            "join san_pham sp on sp.id = spct.id_san_pham\n" +
            "join mau_sac ms on ms.id = spct.id_mau\n" +
            "join dung_luong dl on dl.id = spct.id_dung_luong where hdct.id_hoa_don = ? and hd.id_nguoi_dung = ? and hd.trang_thai = 0;\n";

    private String UPDATE_SO_LUONG_HDCT = "update hoa_don_chi_tiet set so_luong = ? where id = ?;";

    private String FIND_HDCT_BY_ID_HD_AND_ID_SPCT = "select * from hoa_don_chi_tiet where id_hoa_don = ? and id_san_pham_chi_tiet = ?;";

    @Override
    public void addSpctToHoaDon(HoaDonChiTiet hoaDonChiTiet) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_HDCT_SQL);) {
            pstmt.setInt(1, hoaDonChiTiet.getSpct().getId());
            pstmt.setInt(2, hoaDonChiTiet.getHd().getId());
            pstmt.setBigDecimal(3, hoaDonChiTiet.getDonGia());
            pstmt.setInt(4, hoaDonChiTiet.getSoLuong());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<HoaDonChiTiet> getAllSpctInHoaDon(int idHoaDon, int idNguoiDung) {
        System.out.println("idHoaDon: " + idHoaDon);
        System.out.println("idNguoiDung: " + idNguoiDung);
        List<HoaDonChiTiet> hoaDonChiTiets = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_ALL_SPCT_IN_HD_BY_ID_HD);) {
            pstmt.setInt(1, idHoaDon);
            pstmt.setInt(2, idNguoiDung);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int idHdct = rs.getInt("id_hoa_don_chi_tiet");
                int soLuong = rs.getInt("so_luong");
                BigDecimal gia = rs.getBigDecimal("gia");
                int idHd = rs.getInt("id_hoa_don");
                int trangThai = rs.getInt("trang_thai");
                int idSpct = rs.getInt("id_san_pham_chi_tiet");
                String anh = rs.getString("anh");
                String tenSp = rs.getString("ten_sp");
                String tenDungLuong = rs.getString("ten_dung_luong");
                String tenMauSac = rs.getString("ten_mau_sac");
                HoaDonChiTiet hdct = new HoaDonChiTiet().builder()
                        .id(idHdct)
                        .soLuong(soLuong)
                        .donGia(gia)
                        .hd(new HoaDon().builder().id(idHd).build())
                        .spct(new SanPhamChiTiet().builder().id(idSpct).anh(anh)
                                .sanPham(new SanPham().builder().tenSanPham(tenSp).build())
                                .mauSac(new MauSac().builder().mauSac(tenMauSac).build())
                                .dungLuong(new DungLuong().builder().tenDungLuong(tenDungLuong).build())
                                .build())
                        .build();
                hoaDonChiTiets.add(hdct);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hoaDonChiTiets;
    }

    @Override
    public HoaDonChiTiet getHdctByIdHdAndIdSpct(int idHd, int idSpct) {
        HoaDonChiTiet hdct = null;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(FIND_HDCT_BY_ID_HD_AND_ID_SPCT);) {
            pstmt.setInt(1, idHd);
            pstmt.setInt(2, idSpct);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                hdct = new HoaDonChiTiet();
                int id = rs.getInt("id");
                int idSpctResult = rs.getInt("id_san_pham_chi_tiet");
                int idHoaDon = rs.getInt("id_hoa_don");
                BigDecimal donGia = rs.getBigDecimal("gia");
                int soLuong = rs.getInt("so_luong");
                hdct.setId(id);
                hdct.setSpct(new SanPhamChiTiet().builder().id(idSpctResult).build());
                hdct.setHd(new HoaDon().builder().id(idHoaDon).build());
                hdct.setDonGia(donGia);
                hdct.setSoLuong(soLuong);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return hdct;
    }

    @Override
    public void updateSoLuongHdct(int idHdct, int soLuong) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_SO_LUONG_HDCT);) {
            pstmt.setInt(1, idHdct);
            pstmt.setInt(2, soLuong);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
