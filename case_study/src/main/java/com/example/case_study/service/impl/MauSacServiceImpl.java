package com.example.case_study.service.impl;

import com.example.case_study.dao.IMauSac;
import com.example.case_study.dao.impl.MauSacDAOImpl;
import com.example.case_study.model.MauSac;
import com.example.case_study.service.MauSacService;

import java.util.List;

public class MauSacServiceImpl implements MauSacService {
    private IMauSac mauSacDAO;

    public MauSacServiceImpl() {
        this.mauSacDAO = new MauSacDAOImpl();
    }

    @Override
    public List<MauSac> findAll() {
        return mauSacDAO.findAll();
    }

    @Override
    public MauSac findById(int id) {
        return (MauSac) mauSacDAO.findById(id);
    }

    @Override
    public boolean save(MauSac mauSac) {
        return mauSacDAO.save(mauSac);
    }

    @Override
    public boolean update(MauSac mauSac) {
        return mauSacDAO.update(mauSac);
    }

}
