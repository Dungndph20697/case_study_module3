package com.example.case_study.dao;

import java.util.List;

public interface IChucVu<C> {

    List<C> findAll();

    C findById(int id);

    boolean save(C c);

    boolean update( C c);

    boolean delete(int c);
}
