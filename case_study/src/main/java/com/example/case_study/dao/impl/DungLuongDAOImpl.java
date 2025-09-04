package com.example.case_study.dao.impl;

import com.example.case_study.dao.IDungLuong;
import com.example.case_study.model.DungLuong;
import com.example.case_study.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DungLuongDAOImpl implements IDungLuong<DungLuong> {

    private static final String SELECT_ALL_DUNGLUONG = "SELECT * FROM dung_luong order by id desc;";
    private static final String SELECT_DUNGLUONG_BY_ID = "SELECT * FROM dung_luong WHERE id = ?;";
    private static final String INSERT_DUNGLUONG = "INSERT INTO dung_luong(ten_dung_luong) VALUES (?);";
    private static final String UPDATE_DUNGLUONG = "UPDATE dung_luong SET ten_dung_luong = ? WHERE id = ?;";


    @Override
    public List findAll() {
        List<DungLuong> dungLuongs = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement();) {
            ResultSet rs = stmt.executeQuery(SELECT_ALL_DUNGLUONG);
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenDungLuong = rs.getString("ten_dung_luong");
                dungLuongs.add(new DungLuong(id, tenDungLuong));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return dungLuongs;
    }

    @Override
    public DungLuong findById(int id) {
        DungLuong dungLuong = null;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_DUNGLUONG_BY_ID);) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                dungLuong = new DungLuong();
                int idResult = rs.getInt("id");
                String tenDungLuong = rs.getString("ten_dung_luong");
                dungLuong.setTenDungLuong(tenDungLuong);
                dungLuong.setId(idResult);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);

        }
        return dungLuong;
    }

    @Override
    public boolean save(DungLuong dungLuong) {
        int rowAffected = 0;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_DUNGLUONG);) {
            pstmt.setString(1, dungLuong.getTenDungLuong());
            rowAffected = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowAffected > 0;
    }

    @Override
    public boolean update(int id,DungLuong dungLuong) {
        int rowAffected = 0;
        try(Connection conn = new DBConnection().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(UPDATE_DUNGLUONG);) {
            pstmt.setString(1, dungLuong.getTenDungLuong());
            pstmt.setInt(2, id);
            rowAffected = pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return rowAffected > 0;
    }

    @Override
    public boolean delete(int id) {
        return false;
    }


}
