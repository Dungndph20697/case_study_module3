package com.example.case_study.service.impl;

import com.example.case_study.dao.IHang;
import com.example.case_study.dao.impl.HangDAOImpl;
import com.example.case_study.model.Hang;
import com.example.case_study.service.HangService;

import java.util.Collections;
import java.util.List;

public class HangServiceImpl implements HangService {
    private IHang hangDAO;

    public HangServiceImpl() {
        this.hangDAO = new HangDAOImpl();
    }

    @Override
    public List<Hang> findAll() {
        return hangDAO.findAll();
    }

    @Override
    public Hang findById(int id) {
        return (Hang) hangDAO.findById(id);
    }

    @Override
    public boolean save(Hang hang) {
        return hangDAO.save(hang);
    }

    @Override
    public boolean update(Hang hang) {
        return hangDAO.update(hang);
    }

    @Override
    public List<Hang> searchByName(String keyword) {
        return hangDAO.searchByName(keyword);
    }
}
