package com.example.case_study.dao.impl;

import com.example.case_study.dao.IHang;
import com.example.case_study.model.Hang;
import com.example.case_study.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class HangDAOImpl implements IHang {
    private static final String SECLECT_ALL_HANG = "SELECT * FROM hang order by id ";
    private static final String SECLECT_HANG_BY_ID = "SELECT * FROM hang WHERE id = ?";
    private static final String INSERT_HANG = "INSERT INTO hang(ten_hang) VALUES (?)";
    private static final String UPDATE_HANG = "UPDATE hang SET ten_hang = ? WHERE id = ?";
    private static final String SEARCH_MAUSAC = "SELECT * FROM hang WHERE ten_hang LIKE ?";


    @Override
    public List<Hang> findAll() {
        List<Hang> hangs = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement()) {

            ResultSet rs = stmt.executeQuery(SECLECT_ALL_HANG);
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenHang = rs.getString("ten_hang");
                hangs.add(new Hang(id, tenHang));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hangs;
    }


    @Override
    public Object findById(int id) {
        Hang hang = null;
        try (Connection conn = new DBConnection().getConnection();
        PreparedStatement pstmt = conn.prepareStatement(SECLECT_HANG_BY_ID)){
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                hang = new Hang();
                hang.setId(rs.getInt("id"));
                hang.setTenHang(rs.getString("ten_hang"));
            }
        }catch (SQLException e){
        throw new RuntimeException(e);
        }
        return hang;
    }

    @Override
    public boolean save(Hang hang) {
        try (Connection conn = new DBConnection().getConnection();
        PreparedStatement pstmt = conn.prepareStatement(INSERT_HANG)){
            pstmt.setString(1, hang.getTenHang());
            pstmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean update(Hang hang) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_HANG)){
            pstmt.setString(1, hang.getTenHang());
            pstmt.setInt(2, hang.getId());
            pstmt.executeUpdate();
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public List<Hang> searchByName(String keyword) {
        List<Hang> list = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SEARCH_MAUSAC)){
            pstmt.setString(1, "%"+keyword+"%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenHang = rs.getString("ten_hang");
                list.add(new Hang(id, tenHang));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }
}
