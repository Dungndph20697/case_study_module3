package com.example.case_study.dao.nguoidung;

import com.example.case_study.model.User;
//import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import static com.example.case_study.utils.DBConnection.getConnection;

public class UserDAO {

    private static final String INSERT_SQL =
            "INSERT INTO nguoi_dung(ten_nguoi_dung, sdt, email, dia_chi, mat_khau, id_chuc_vu) VALUES (?, ?, ?, ?, ?, ?)";

    private static final String SELECT_BY_EMAIL_SQL =
            "SELECT * FROM nguoi_dung WHERE email = ?";

    // Thêm user (hash mật khẩu trước khi lưu) -> trả về id mới (hoặc -1 nếu thất bại)
    public int insertUser(User user) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(INSERT_SQL, Statement.RETURN_GENERATED_KEYS)) {

            System.out.println("👉 DB URL: " + conn.getMetaData().getURL());
            System.out.println("👉 Insert user: " + user.getEmail() + " role=" + user.getRoleId());

            // Lấy password trực tiếp, không hash
            String password = user.getPassword();

            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getAddress());
            ps.setString(5, password);   // lưu mật khẩu gốc
            ps.setInt(6, user.getRoleId());

            int rows = ps.executeUpdate();
            System.out.println("👉 Rows affected = " + rows);

            if (rows > 0) {
                try (ResultSet rs = ps.getGeneratedKeys()) {
                    if (rs.next()) {
                        int id = rs.getInt(1);
                        System.out.println("👉 Insert thành công, id=" + id);
                        return id;
                    }
                }
                return 1;
            }
        } catch (SQLException e) {
            System.err.println("❌ SQL Error code: " + e.getErrorCode());
            System.err.println("❌ SQL State: " + e.getSQLState());
            System.err.println("❌ Message: " + e.getMessage());
            e.printStackTrace();
        }
        return -1;
    }






    // Kiểm tra login: lấy user theo email, so sánh password với DB
    public User checkLogin(String email, String password) {
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(SELECT_BY_EMAIL_SQL)) {

            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedPass = rs.getString("mat_khau");
                    // So sánh trực tiếp (plain text)
                    if (storedPass != null && password.equals(storedPass)) {
                        User u = new User();
                        u.setId(rs.getInt("id"));
                        u.setFullName(rs.getString("ten_nguoi_dung"));
                        u.setPhone(rs.getString("sdt"));
                        u.setEmail(rs.getString("email"));
                        u.setAddress(rs.getString("dia_chi"));
                        u.setPassword(null); // không set password thô
                        u.setRoleId(rs.getInt("id_chuc_vu"));
                        return u;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Kiểm tra số điện thoại đã tồn tại chưa
    public boolean existsByPhone(String phone) {
        String sql = "SELECT 1 FROM nguoi_dung WHERE sdt = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); // nếu có bản ghi -> true
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Kiểm tra email đã tồn tại chưa
    public boolean existsByEmail(String email) {
        String sql = "SELECT 1 FROM nguoi_dung WHERE email = ?";
        try (Connection conn = getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, email);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
