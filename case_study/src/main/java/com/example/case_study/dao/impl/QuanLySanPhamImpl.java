package com.example.case_study.dao.impl;

import com.example.case_study.dao.IQuanLySanPham;
import com.example.case_study.model.SanPham;
import com.example.case_study.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;

import java.util.List;

public class QuanLySanPhamImpl implements IQuanLySanPham {
    private static final String SELECT_ALL_SANPHAM = "SELECT * FROM san_pham order by id desc";
    private static final String SELECT_SANPHAM_BY_ID = "SELECT * FROM san_pham where id = ?";
    private static final String INSERT_SANPHAM = "INSERT INTO san_pham(ten_sp) VALUES(?)";
    private static final String UPDATE_SANPHAM = "UPDATE san_pham SET ten_sp = ? WHERE id = ?";
    private static final String SEARCH_SANPHAM = "SELECT * FROM san_pham WHERE ten_sp LIKE ?";

    @Override
    public List<SanPham> findAll() {
        List<SanPham> hangs = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(SELECT_ALL_SANPHAM);
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenSanPham = rs.getString("ten_sp");
                hangs.add(new SanPham(id, tenSanPham));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hangs;
    }

    @Override
    public Object findById(int id) {
        SanPham sanPham = null;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_SANPHAM_BY_ID)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                sanPham = new SanPham();
                sanPham.setId(rs.getInt("id"));
                sanPham.setTenSanPham(rs.getString("ten_sp"));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return sanPham;
    }

    @Override
    public boolean save(SanPham sanPham) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_SANPHAM)) {
            pstmt.setString(1, sanPham.getTenSanPham());
            pstmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean update(SanPham sanPham) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_SANPHAM)){
            pstmt.setString(1, sanPham.getTenSanPham());
            pstmt.setInt(2, sanPham.getId());
            pstmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public List<SanPham> searchByName(String keyword) {
        List<SanPham> list = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SEARCH_SANPHAM)) {
            pstmt.setString(1, "%"+keyword+"%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenSanPham = rs.getString("ten_sp");
                list.add(new SanPham(id, tenSanPham));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }
}
