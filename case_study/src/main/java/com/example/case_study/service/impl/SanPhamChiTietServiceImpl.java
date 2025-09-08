package com.example.case_study.service.impl;

import com.example.case_study.dao.ICRUDAO;
import com.example.case_study.dao.impl.SanPhamChiTietDAOImpl;
import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.service.ICRUService;

import java.util.List;

public class SanPhamChiTietServiceImpl implements ICRUService<SanPhamChiTiet> {
    private ICRUDAO sanPhamChiTietDAO;

    public SanPhamChiTietServiceImpl() {
        this.sanPhamChiTietDAO = new SanPhamChiTietDAOImpl();
    }

    @Override
    public List<SanPhamChiTiet> findAll() {
        return sanPhamChiTietDAO.findAll();
    }

    @Override
    public SanPhamChiTiet findById(int id) {
        return (SanPhamChiTiet) sanPhamChiTietDAO.findById(id);
    }

    @Override
    public boolean save(SanPhamChiTiet d) {
        return sanPhamChiTietDAO.save(d);
    }

    @Override
    public boolean update(int id, SanPhamChiTiet d) {
        return sanPhamChiTietDAO.update(id, d);
    }
}
