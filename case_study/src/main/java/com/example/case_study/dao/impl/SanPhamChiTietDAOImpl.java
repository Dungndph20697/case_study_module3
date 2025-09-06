package com.example.case_study.dao.impl;

import com.example.case_study.dao.ICRUDAO;
import com.example.case_study.model.*;
import com.example.case_study.utils.DBConnection;

import java.math.BigDecimal;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SanPhamChiTietDAOImpl implements ICRUDAO<SanPhamChiTiet> {
    private static final String SELECT_ALL_SPCT = "select spct.id, spct.mo_ta, spct.gia, spct.so_luong, spct.trang_thai, spct.anh, th.id as 'id_dung_luong', th.ten_dung_luong, \n" +
            "ms.id as 'id_mau_sac',ms.ten_mau_sac, sp.id as 'id_san_pham',sp.ten_sp, h.id as 'id_hang', h.ten_hang from san_pham_chi_tiet spct \n" +
            "join dung_luong th on spct.id_dung_luong = th.id\n" +
            "join san_pham sp on sp.id = spct.id_san_pham\n" +
            "join hang h on h.id = spct.id_hang\n" +
            "join mau_sac ms on ms.id = spct.id_mau\n" +
            "order by spct.id desc;";
    private static final String SELECT_SPCT_BY_ID = "select spct.id, spct.mo_ta, spct.gia, spct.so_luong, spct.trang_thai, spct.anh, th.id as 'id_dung_luong', th.ten_dung_luong, \n" +
            "ms.id as 'id_mau_sac',ms.ten_mau_sac, sp.id as 'id_san_pham',sp.ten_sp, h.id as 'id_hang', h.ten_hang from san_pham_chi_tiet spct \n" +
            "join dung_luong th on spct.id_dung_luong = th.id\n" +
            "join san_pham sp on sp.id = spct.id_san_pham\n" +
            "join hang h on h.id = spct.id_hang\n" +
            "join mau_sac ms on ms.id = spct.id_mau\n" +
            "where spct.id = ?\n" +
            "order by spct.id desc;";
    private static final String INSERT_SPCT = "INSERT INTO `san_pham_chi_tiet` (`id_hang`, `id_san_pham`, `id_dung_luong`, `id_mau`, `mo_ta`, `gia`, `so_luong`, `trang_thai`, `anh`) VALUES\n" +
            "(?, ?, ?, ?, ?, ?, ?, ?, ?);";
    private static final String UPDATE_SPCT = "UPDATE `san_pham_chi_tiet`\n" +
            "SET `id_hang` = ?,\n" +
            "    `id_san_pham` = ?,\n" +
            "    `id_dung_luong` = ?,\n" +
            "    `id_mau` = ?,\n" +
            "    `mo_ta` = ?,\n" +
            "    `gia` = ?,\n" +
            "    `so_luong` = ?,\n" +
            "    `trang_thai` = ?,\n" +
            "    `anh` = ?\n" +
            "WHERE `id` = ?;";

    @Override
    public List<SanPhamChiTiet> findAll() {
        List<SanPhamChiTiet> sanPhamChiTiets = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement();) {
            ResultSet rs = stmt.executeQuery(SELECT_ALL_SPCT);
            while (rs.next()) {
                int id = rs.getInt("id");
                String moTa = rs.getString("mo_ta");
                BigDecimal gia = rs.getBigDecimal("gia");
                int soLuong = rs.getInt("so_luong");
                int trangThai = rs.getInt("trang_thai");
                String anh = rs.getString("anh");
                int idDungLuong = rs.getInt("id_dung_luong");
                String tenDungLuong = rs.getString("ten_dung_luong");
                int idMauSac = rs.getInt("id_mau_sac");
                String tenMauSac = rs.getString("ten_mau_sac");
                int idSanPham = rs.getInt("id_san_pham");
                String tenSanPham = rs.getString("ten_sp");
                int idHang = rs.getInt("id_hang");
                String tenHang = rs.getString("ten_hang");
                SanPham sanPham = new SanPham(idSanPham, tenSanPham);
                Hang hang = new Hang(idHang, tenHang);
                MauSac mauSac = new MauSac(idMauSac, tenMauSac);
                DungLuong dungLuong = new DungLuong(idDungLuong, tenDungLuong);
                sanPhamChiTiets.add(new SanPhamChiTiet().builder().id(id).anh(anh).moTa(moTa).soLuong(soLuong).trangThai(trangThai).gia(gia).dungLuong(dungLuong).sanPham(sanPham).hang(hang).mauSac(mauSac).build());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sanPhamChiTiets;
    }

    @Override
    public SanPhamChiTiet findById(int id) {
        SanPhamChiTiet sanPhamChiTiet = null;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_SPCT_BY_ID);) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                int idSpct = rs.getInt("id");
                String moTa = rs.getString("mo_ta");
                BigDecimal gia = rs.getBigDecimal("gia");
                int soLuong = rs.getInt("so_luong");
                int trangThai = rs.getInt("trang_thai");
                String anh = rs.getString("anh");
                int idDungLuong = rs.getInt("id_dung_luong");
                String tenDungLuong = rs.getString("ten_dung_luong");
                int idMauSac = rs.getInt("id_mau_sac");
                String tenMauSac = rs.getString("ten_mau_sac");
                int idSanPham = rs.getInt("id_san_pham");
                String tenSanPham = rs.getString("ten_sp");
                int idHang = rs.getInt("id_hang");
                String tenHang = rs.getString("ten_hang");
                SanPham sanPham = new SanPham(idSanPham, tenSanPham);
                Hang hang = new Hang(idHang, tenHang);
                MauSac mauSac = new MauSac(idMauSac, tenMauSac);
                DungLuong dungLuong = new DungLuong(idDungLuong, tenDungLuong);
                sanPhamChiTiet = new SanPhamChiTiet().builder().id(idSpct).anh(anh).moTa(moTa).soLuong(soLuong).trangThai(trangThai).gia(gia).dungLuong(dungLuong).sanPham(sanPham).hang(hang).mauSac(mauSac).build();
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return sanPhamChiTiet;
    }

    @Override
    public boolean save(SanPhamChiTiet d) {
        int rowAffected = 0;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_SPCT);) {
            pstmt.setInt(1, d.getHang().getId());
            pstmt.setInt(2, d.getSanPham().getId());
            pstmt.setInt(3, d.getDungLuong().getId());
            pstmt.setInt(4, d.getMauSac().getId());
            pstmt.setString(5, d.getMoTa());
            pstmt.setBigDecimal(6, d.getGia());
            pstmt.setInt(7, d.getSoLuong());
            pstmt.setInt(8, d.getTrangThai());
            pstmt.setString(9, d.getAnh());
            rowAffected = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowAffected > 0;
    }

    @Override
    public boolean update(int id, SanPhamChiTiet d) {
        int rowAffected = 0;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_SPCT);) {
            pstmt.setInt(1, d.getHang().getId());
            pstmt.setInt(2, d.getSanPham().getId());
            pstmt.setInt(3, d.getDungLuong().getId());
            pstmt.setInt(4, d.getMauSac().getId());
            pstmt.setString(5, d.getMoTa());
            pstmt.setBigDecimal(6, d.getGia());
            pstmt.setInt(7, d.getSoLuong());
            pstmt.setInt(8, d.getTrangThai());
            pstmt.setString(9, d.getAnh());
            pstmt.setInt(10, id);
            rowAffected = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowAffected > 0;
    }
}
