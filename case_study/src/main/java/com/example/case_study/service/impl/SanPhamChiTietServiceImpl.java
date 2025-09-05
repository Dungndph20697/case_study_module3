package com.example.case_study.service.impl;

import com.example.case_study.dao.ISanPhamChiTiet;
import com.example.case_study.dao.impl.SanPhamChiTietDAOImpl;
import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.service.ISanPhamChiTietService;

import java.util.Collections;
import java.util.List;

public class SanPhamChiTietServiceImpl implements ISanPhamChiTietService<SanPhamChiTiet> {
    private ISanPhamChiTiet sanPhamChiTietDAO;

    public SanPhamChiTietServiceImpl() {
        this.sanPhamChiTietDAO = new SanPhamChiTietDAOImpl();
    }

    @Override
    public List<SanPhamChiTiet> findAll() {
        return sanPhamChiTietDAO.findAll();
    }

    @Override
    public SanPhamChiTiet findById(int id) {
        return null;
    }

    @Override
    public boolean save(SanPhamChiTiet d) {
        return false;
    }

    @Override
    public boolean update(int id, SanPhamChiTiet d) {
        return false;
    }
}
