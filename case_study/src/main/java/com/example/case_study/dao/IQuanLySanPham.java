package com.example.case_study.dao;

import com.example.case_study.model.SanPham;

import java.util.List;

public interface IQuanLySanPham<D> {
    List<D> findAll();

    D findById(int id);

    boolean save(SanPham sanPham);

    boolean update(SanPham sanPham);


    List<SanPham> searchByName(String keyword);
}
