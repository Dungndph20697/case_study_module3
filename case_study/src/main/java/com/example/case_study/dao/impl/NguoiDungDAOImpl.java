package com.example.case_study.dao.impl;

import com.example.case_study.dao.INguoiDung;
import com.example.case_study.model.ChucVu;
import com.example.case_study.model.NguoiDung;
import com.example.case_study.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class NguoiDungDAOImpl implements INguoiDung<NguoiDung> {

    public static final String SQL_DELETE = "delete from nguoi_dung where id = ?";
    public static final String SQL_UPDATE = "update nguoi_dung set ten_nguoi_dung = ?, sdt = ?, email = ?, dia_chi = ?, mat_khau = ?, id_chuc_vu = ? where id = ?";
    public static final String SQL_SELECT_BY_ID = "SELECT * FROM nguoi_dung where id = ?";
    public static final String SQL_INSERT = "insert into nguoi_dung (ten_nguoi_dung, sdt, email, dia_chi, mat_khau, id_chuc_vu) values (?, ?, ?, ?, ?, ?)";
    public static final String SQL_ALL = "SELECT * " +
            "FROM nguoi_dung nd " +
            "LEFT JOIN chuc_vu cv ON nd.id_chuc_vu = cv.id " +
            "ORDER BY nd.id DESC";

    @Override
    public List<NguoiDung> findAll() {
        List<NguoiDung> nguoiDungs = new ArrayList<>();

        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(SQL_ALL)) {

            while (rs.next()) {
                // Tạo đối tượng NguoiDung
                NguoiDung nd = new NguoiDung();
                nd.setId(rs.getInt("id"));
                nd.setTenNguoiDung(rs.getString("ten_nguoi_dung"));
                nd.setSdt(rs.getString("sdt"));
                nd.setEmail(rs.getString("email"));
                nd.setDiaChi(rs.getString("dia_chi"));
                nd.setMatKhau(rs.getString("mat_khau"));

                // Tạo đối tượng ChucVu từ id
                int idChucVu = rs.getInt("id_chuc_vu");
                ChucVu chucVu = new ChucVu(idChucVu);
                chucVu.setTenChuVu(rs.getString("ten_chuc_vu"));
                nd.setIdChucVu(chucVu);

                // Thêm vào danh sách
                nguoiDungs.add(nd);
            }

        } catch (SQLException e) {
            throw new RuntimeException("Lỗi khi truy vấn danh sách người dùng", e);
        }

        return nguoiDungs;
    }

    @Override
    public NguoiDung findById(int id) {
        NguoiDung nguoiDung = null;
        try(Connection conn = DBConnection.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(SQL_SELECT_BY_ID);){
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if(rs.next()){
                nguoiDung = new NguoiDung();
                nguoiDung.setId(rs.getInt("id"));
                nguoiDung.setTenNguoiDung(rs.getString("ten_nguoi_dung"));
                nguoiDung.setSdt(rs.getString("sdt"));
                nguoiDung.setEmail(rs.getString("email"));
                nguoiDung.setDiaChi(rs.getString("dia_chi"));
                nguoiDung.setMatKhau(rs.getString("mat_khau"));
                nguoiDung.setIdChucVu(new ChucVu(rs.getInt("id_chuc_vu")));

            }

        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return nguoiDung;
    }

    @Override
    public boolean save(NguoiDung nguoiDung) {
        int rowAffected = 0;
        try(Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(SQL_INSERT);){
            pstmt.setString(1, nguoiDung.getTenNguoiDung());
            pstmt.setString(2, nguoiDung.getSdt());
            pstmt.setString(3, nguoiDung.getEmail());
            pstmt.setString(4, nguoiDung.getDiaChi());
            pstmt.setString(5, nguoiDung.getMatKhau());
            pstmt.setInt(6, nguoiDung.getIdChucVu().getId()); //  lấy id của đối tượng ChucVu
            rowAffected = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowAffected > 0;
    }

    @Override
    public boolean update(NguoiDung nguoiDung) {
        int rowAffected = 0;
        try(Connection conn = DBConnection.getConnection();
        PreparedStatement pstmt = conn.prepareStatement(SQL_UPDATE);){
            pstmt.setString(1, nguoiDung.getTenNguoiDung());
            pstmt.setString(2, nguoiDung.getSdt());
            pstmt.setString(3, nguoiDung.getEmail());
            pstmt.setString(4, nguoiDung.getDiaChi());
            pstmt.setString(5, nguoiDung.getMatKhau());
            pstmt.setInt(6, nguoiDung.getIdChucVu().getId());
            pstmt.setInt(7, nguoiDung.getId());
            rowAffected = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowAffected > 0;
    }
    @Override
    public boolean delete(int id) {
       NguoiDung nguoiDung = findById(id);
       if (nguoiDung == null){
           return false;
       }else {
           int rowAffected = 0;
           try(Connection conn = DBConnection.getConnection();
               PreparedStatement pstmt = conn.prepareStatement(SQL_DELETE);){
               pstmt.setInt(1, id);
               rowAffected = pstmt.executeUpdate();
           } catch (SQLException e) {
               throw new RuntimeException(e);
           }
           return rowAffected > 0;
       }
    }
}
