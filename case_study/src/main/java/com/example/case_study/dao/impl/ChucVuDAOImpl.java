package com.example.case_study.dao.impl;

import com.example.case_study.dao.IChucVu;
import com.example.case_study.model.ChucVu;
import com.example.case_study.utils.DBConnection;

import java.sql.*;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import java.util.List;

public class ChucVuDAOImpl implements IChucVu<ChucVu> {

    public static final String SQL_DELETE = "delete from customers where id = ?";
    public static final String SQL_UPDATE = "update chuc_vu set name = ?, phone = ?, email = ? where id = ?";
    public static final String SQL_SELECT_BY_ID = "SELECT * FROM chuc_vu where id = ?";
    public static final String SQL_INSERT = "insert into chuc_vu (name, muc_luong, trang_thai) values (?, ?, ?)";
    public static final String SQL_SELECT_ALL = "SELECT * FROM chuc_vu ORDER BY id desc";

    @Override
    public List findAll() {
        List<ChucVu> chucVus = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement();
        ){
            ResultSet rs = stmt.executeQuery(SQL_SELECT_ALL);
            while(rs.next()){
                int id = rs.getInt("id");
                String tenChuVu = rs.getString("ten_chuc_vu");
                String mucLuong = rs.getString("muc_luong");
                String trangThai = rs.getString("trang_thai");
                chucVus.add(new ChucVu(id, tenChuVu, mucLuong, trangThai));
            }
        }catch (SQLException e){
            throw  new RuntimeException(e);
        }
        return chucVus;
    }


    @Override
    public ChucVu findById(int id) {
        ChucVu chucVu = null;
        try(Connection conn = new DBConnection().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);){
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                chucVu = new ChucVu();
                chucVu.setTenChuVu(rs.getString("ten_chuc_vu"));
                chucVu.setMucLuong(rs.getString("muc_luong"));
                chucVu.setTrangThai(rs.getString("trang_thai"));
            }
        }catch (SQLException e){
            throw  new RuntimeException(e);
        }
        return chucVu;
    }

    @Override
    public boolean save(ChucVu chucvu) {
        int rowAffected = 0;
        try(Connection conn = new DBConnection().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL_INSERT);){
            pstmt.setString(1, chucvu.getTenChuVu());
            pstmt.setString(2, chucvu.getMucLuong());
            pstmt.setString(3, chucvu.getTrangThai());
            rowAffected = pstmt.executeUpdate();
        }catch (SQLException e){
            throw  new RuntimeException(e);
        }
        return rowAffected > 0;
    }


    public boolean update(ChucVu chucVu) {
        int rowAffected = 0;
        try(Connection conn = new DBConnection().getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL_UPDATE);){
            pstmt.setString(1, chucVu.getTenChuVu());
            pstmt.setString(2, chucVu.getMucLuong());
            pstmt.setString(3, chucVu.getTrangThai());
            pstmt.setInt(4, chucVu.getId());
            rowAffected = pstmt.executeUpdate();
        }catch (SQLException e){
            throw  new RuntimeException(e);
        }
        return rowAffected > 0;
    }

    @Override
    public boolean delete(int id) {
        ChucVu chucVu = findById(id);
        if(chucVu == null){
            return false;
        }else {
            Connection conn = new DBConnection().getConnection();
            int rowAffected = 0;
            try{
                PreparedStatement pstmt = conn.prepareStatement(SQL_DELETE);
                pstmt.setInt(1, id);
                rowAffected = pstmt.executeUpdate();
            }catch (SQLException e){
                e.printStackTrace();
            }
            return rowAffected > 0;
        }
    }

}
