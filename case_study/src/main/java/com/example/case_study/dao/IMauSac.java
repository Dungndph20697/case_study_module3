package com.example.case_study.dao;

import com.example.case_study.model.MauSac;

import java.util.List;

public interface IMauSac <D> {
    List<D> findAll();

    D findById(int id);

    boolean save(MauSac mauSac);

    boolean update(MauSac mauSac);

    boolean deleteById(int id);

    List<MauSac> searchByName(String keyword);
}
