package com.example.case_study.dao.impl;

import com.example.case_study.dao.ISanPhamChiTiet;
import com.example.case_study.model.DungLuong;
import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.utils.DBConnection;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class SanPhamChiTietDAOImpl implements ISanPhamChiTiet<SanPhamChiTiet> {
    private static final String SELECT_ALL_DUNGLUONG = "select spct.id, spct.mo_ta, spct.gia, spct.so_luong, spct.trang_thai, spct.anh, th.id as 'id_dung_luong', th.ten_dung_luong from san_pham_chi_tiet spct \n" +
            "join dung_luong th on spct.id_dung_luong = th.id order by spct.id desc;";
    private static final String SELECT_DUNGLUONG_BY_ID = "SELECT * FROM dung_luong WHERE id = ?;";
    private static final String INSERT_DUNGLUONG = "INSERT INTO dung_luong(ten_dung_luong) VALUES (?);";
    private static final String UPDATE_DUNGLUONG = "UPDATE dung_luong SET ten_dung_luong = ? WHERE id = ?;";

    @Override
    public List<SanPhamChiTiet> findAll() {
        List<SanPhamChiTiet> sanPhamChiTiets = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement();) {
            ResultSet rs = stmt.executeQuery(SELECT_ALL_DUNGLUONG);
            while (rs.next()) {
                int id = rs.getInt("id");
                String moTa = rs.getString("mo_ta");
                BigDecimal gia = rs.getBigDecimal("gia");
                int soLuong = rs.getInt("so_luong");
                int trangThai = rs.getInt("trang_thai");
                String anh = rs.getString("anh");
                int idDungLuong = rs.getInt("id_dung_luong");
                String tenDungLuong = rs.getString("ten_dung_luong");
                DungLuong dungLuong = new DungLuong(idDungLuong, tenDungLuong);
                sanPhamChiTiets.add(new SanPhamChiTiet().builder().id(id).anh(anh).moTa(moTa).soLuong(soLuong).trangThai(trangThai).gia(gia).dungLuong(dungLuong).build());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sanPhamChiTiets;
    }

    @Override
    public SanPhamChiTiet findById(int id) {
        return null;
    }

    @Override
    public boolean save(SanPhamChiTiet d) {
        return false;
    }

    @Override
    public boolean update(int id, SanPhamChiTiet d) {
        return false;
    }
}
