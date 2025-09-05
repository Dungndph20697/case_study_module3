package com.example.case_study.service;

import com.example.case_study.model.Hang;
import com.example.case_study.model.SanPham;

import java.util.List;

public interface ISanPhamService {
    List<SanPham> findAll();

    SanPham findById(int id);

    boolean save(SanPham sanPham);

    boolean update(SanPham sanPham);

    List<SanPham> searchByName(String keyword);
}
