package com.example.case_study.service.impl;

import com.example.case_study.dao.IChucVu;
import com.example.case_study.dao.impl.ChucVuDAOImpl;
import com.example.case_study.model.ChucVu;
import com.example.case_study.service.IChucVuService;

import java.util.Collections;
import java.util.List;

public class ChucVuServiecImpl implements IChucVuService<ChucVu> {
    ChucVuDAOImpl chucVuDAO = new ChucVuDAOImpl();

    @Override
    public List<ChucVu> findAll() {
        return chucVuDAO.findAll();
    }

    @Override
    public ChucVu findById(int id) {
        return (ChucVu)  chucVuDAO.findById(id);
    }

    @Override
    public boolean save(ChucVu chucVu) {
        return chucVuDAO.save(chucVu)   ;
    }

    @Override
    public boolean delete(int id) {
        return chucVuDAO.delete(id);
    }

    @Override
    public boolean update(ChucVu chucVu) {
        ChucVu c = findById(chucVu.getId());
        if(c != null){
            c.setTenChuVu(chucVu.getTenChuVu());
            return chucVuDAO.update(c);
        }
        return false;
    }


}
