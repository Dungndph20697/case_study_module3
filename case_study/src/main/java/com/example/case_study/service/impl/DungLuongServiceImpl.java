package com.example.case_study.service.impl;

import com.example.case_study.dao.IDungLuong;
import com.example.case_study.dao.impl.DungLuongDAOImpl;
import com.example.case_study.model.DungLuong;
import com.example.case_study.service.ICRUService;
import com.example.case_study.service.IDungLuongServiceSerchByName;

import java.util.List;

public class DungLuongServiceImpl implements ICRUService<DungLuong>, IDungLuongServiceSerchByName {
    private IDungLuong dungLuongDAO;

    public DungLuongServiceImpl() {
        this.dungLuongDAO = new DungLuongDAOImpl();
    }

    @Override
    public List<DungLuong> findAll() {
        return dungLuongDAO.findAll();
    }

    @Override
    public DungLuong findById(int id) {
        return (DungLuong) dungLuongDAO.findById(id);
    }

    @Override
    public boolean save(DungLuong dungLuong) {
        return dungLuongDAO.save(dungLuong);
    }

    @Override
    public boolean update(int id, DungLuong d) {
        return dungLuongDAO.update(id, d);
    }

    @Override
    public List<DungLuong> searchByName(String keyword) {
        return dungLuongDAO.searchByName(keyword);
    }

}
