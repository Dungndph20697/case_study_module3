package com.example.case_study.dao.impl;

import com.example.case_study.dao.IHoaDonDAO;
import com.example.case_study.model.DungLuong;
import com.example.case_study.model.HoaDon;
import com.example.case_study.model.nguoidung.ProductUser;
import com.example.case_study.utils.DBConnection;

import java.sql.*;

public class HoaDonDaoImpl implements IHoaDonDAO {

    private String INSERT_HD = "INSERT INTO `hoa_don` (`id_nguoi_dung`, `ma_hoa_don`, `ngay_tao`,  `trang_thai`) VALUES\n" +
            "(?, ?, ?, ?)";

    private String SELECT_HD_TRANG_THAI_0_BY_IDUSER = "select hd.id, nd.id, hd.ma_hoa_don, hd.ngay_tao,hd.ngay_thanh_toan, hd.trang_thai,nd.ten_nguoi_dung, hd.id_nguoi_dung from hoa_don hd\n" +
            "join nguoi_dung nd on hd.id_nguoi_dung = nd.id where id_nguoi_dung = ? and trang_thai = ?;";

    @Override
    public void insertHoaDon(HoaDon hd) {
        System.out.println(hd.getNgayTao());
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_HD);) {
            pstmt.setInt(1, hd.getUser().getId());
            pstmt.setString(2, hd.getMaHoaDon());
            pstmt.setString(3, hd.getNgayTao());
            pstmt.setInt(4, hd.getTrangThai());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public HoaDon getHoaDonTrangThaiByIdUser(int idUser, int trangThai) {
        HoaDon hd = null;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_HD_TRANG_THAI_0_BY_IDUSER);) {
            pstmt.setInt(1, idUser);
            pstmt.setInt(2, trangThai);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                hd = new HoaDon();
                int id = rs.getInt("id");
                int idNguoiDung = rs.getInt("id_nguoi_dung");
                String maHoaDon = rs.getString("ma_hoa_don");
                String ngayTao = rs.getString("ngay_tao");
                String ngayThanhToan = rs.getString("ngay_thanh_toan");
                int trangThaiResult = rs.getInt("trang_thai");
                hd.setId(id);
                hd.setMaHoaDon(maHoaDon);
                hd.setNgayTao(ngayTao);
                hd.setNgayThanhToan(ngayThanhToan);
                hd.setTrangThai(trangThaiResult);
                ProductUser user = new ProductUser();
                user.setId(idNguoiDung);
                hd.setUser(user);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return hd;
    }

//    public static void main(String[] args) {
//        HoaDon hd = new HoaDonDaoImpl().getHoaDonTrangThaiByIdUser(3,0);
//        System.out.println(hd);
//    }
}
