package com.example.case_study.dao;

import com.example.case_study.model.DungLuong;
import com.example.case_study.model.Hang;

import java.util.List;

public interface IDungLuong<D> {

    List<D> findAll();

    D findById(int id);

    boolean save(D d);

    boolean update(int id,D d);

    boolean delete(int id);

    List<DungLuong> searchByName(String keyword);

}
