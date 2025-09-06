package com.example.case_study.service.impl;

import com.example.case_study.dao.IQuanLySanPham;
import com.example.case_study.dao.impl.QuanLySanPhamImpl;
import com.example.case_study.model.SanPham;
import com.example.case_study.service.ISanPhamService;

import java.util.Collections;
import java.util.List;

public class SanPhamServiceImpl implements ISanPhamService {
    private IQuanLySanPham sanPhamDAO;
    public SanPhamServiceImpl() {
        this.sanPhamDAO = new QuanLySanPhamImpl();
    }
    @Override
    public List<SanPham> findAll() {
        return sanPhamDAO.findAll();
    }

    @Override
    public SanPham findById(int id) {
        return (SanPham) sanPhamDAO.findById(id);
    }

    @Override
    public boolean save(SanPham sanPham) {
        return sanPhamDAO.save(sanPham);
    }

    @Override
    public boolean update(SanPham sanPham) {
        return sanPhamDAO.update(sanPham);
    }

    @Override
    public List<SanPham> searchByName(String keyword) {
        return sanPhamDAO.searchByName(keyword);
    }
}
