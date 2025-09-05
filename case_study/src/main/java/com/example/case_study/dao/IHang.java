package com.example.case_study.dao;

import com.example.case_study.model.Hang;

import java.util.List;

public interface IHang <D> {
    List<D> findAll();

    D findById(int id);

    boolean save(Hang hang);

    boolean update(Hang hang);

    List<Hang> searchByName(String keyword);
}
