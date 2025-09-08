package com.example.case_study.service;

import com.example.case_study.model.DungLuong;

import java.util.List;

public interface ICRUService<O> {
    List<O> findAll();

    O findById(int id);

    boolean save(O c);

    boolean update(int id, O o);

    List<DungLuong> searchByName(String keyword);
}
