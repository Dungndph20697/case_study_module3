package com.example.case_study.service.impl;

import com.example.case_study.dao.impl.NguoiDungDAOImpl;
import com.example.case_study.model.NguoiDung;
import com.example.case_study.service.INguoiDungService;

import java.util.Collections;
import java.util.List;

public class NguoiDungServiceImpl implements INguoiDungService<NguoiDung> {
    NguoiDungDAOImpl nguoiDungDAO = new NguoiDungDAOImpl();


    @Override
    public List<NguoiDung> findAll() {
        return nguoiDungDAO.findAll();
    }

    @Override
    public NguoiDung findById(int id) {
        return nguoiDungDAO.findById(id);
    }

    @Override
    public boolean save(NguoiDung nguoiDung) {
        return nguoiDungDAO.save(nguoiDung);
    }

    @Override
    public boolean update(NguoiDung nguoiDung) {
        NguoiDung n = findById(nguoiDung.getId());
        if(n != null){
            n.setTenNguoiDung(nguoiDung.getTenNguoiDung());
            n.setSdt(nguoiDung.getSdt());
            n.setEmail(nguoiDung.getEmail());
            n.setDiaChi(nguoiDung.getDiaChi());
            n.setMatKhau(nguoiDung.getMatKhau());
            n.setIdChucVu(nguoiDung.getIdChucVu());
            return nguoiDungDAO.update(n);
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        return nguoiDungDAO.delete(id);
    }
}
