package com.example.case_study.dao.impl;

import com.example.case_study.dao.IMauSac;
import com.example.case_study.model.MauSac;
import com.example.case_study.utils.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MauSacDAOImpl implements IMauSac {
    private static final String SELECT_ALL_MAUSAC = "SELECT * FROM mau_sac order by id desc;";
    private static final String SELECT_MAUSAC_BY_ID = "SELECT * FROM mau_sac WHERE id = ?";
    private static final String INSERT_MAUSAC = "INSERT INTO mau_sac(ten_mau_sac) VALUES(?)";
    private static final String UPDATE_MAUSAC = "UPDATE mau_sac SET ten_mau_sac = ? WHERE id = ?";
    private static final String DELELE_MAUSAC = "DELETE FROM mau_sac WHERE id = ?";
    private static final String SEARCH_MAUSAC = "SELECT * FROM mau_sac WHERE ten_mau_sac LIKE ?";
    @Override
    public List<MauSac> findAll() {
        List<MauSac> mauSacs = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(SELECT_ALL_MAUSAC);
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenMauSac = rs.getString("ten_mau_sac");
                mauSacs.add(new MauSac(id, tenMauSac));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return mauSacs;
    }

    @Override
    public MauSac findById(int id) {
        MauSac mauSac = null;
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SELECT_MAUSAC_BY_ID)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                mauSac = new MauSac();
                mauSac.setId(rs.getInt("id"));
                mauSac.setMauSac(rs.getString("ten_mau_sac"));
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return mauSac;
    }


    @Override
    public boolean save(MauSac mauSac) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(INSERT_MAUSAC)) {
            pstmt.setString(1, mauSac.getMauSac());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }

    @Override
    public boolean update(MauSac mauSac) {
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(UPDATE_MAUSAC)) {
            pstmt.setString(1, mauSac.getMauSac());
            pstmt.setInt(2, mauSac.getId());
            pstmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    @Override
    public boolean deleteById(int id){
        try (Connection conn = new DBConnection().getConnection();
        PreparedStatement pstmt = conn.prepareStatement(DELELE_MAUSAC)){
            pstmt.setInt(1, id);
            return pstmt.executeUpdate() > 0;
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<MauSac> searchByName(String keyword){
        List<MauSac> list = new ArrayList<>();
        try (Connection conn = new DBConnection().getConnection();
             PreparedStatement pstmt = conn.prepareStatement(SEARCH_MAUSAC)){
            pstmt.setString(1, "%"+keyword+"%");
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String tenMauSac = rs.getString("ten_mau_sac");
                list.add(new MauSac(id, tenMauSac));
            }
        }catch (SQLException e){
            throw new RuntimeException(e);
        }
        return list;
    }

}
