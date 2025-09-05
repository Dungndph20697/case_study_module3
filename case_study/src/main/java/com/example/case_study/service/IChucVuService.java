package com.example.case_study.service;

import java.util.List;

public interface IChucVuService<C>  {

    List<C>  findAll();

    C findById(int id);

    boolean save(C c);

    boolean update(C c);

    boolean delete(int id);
}
