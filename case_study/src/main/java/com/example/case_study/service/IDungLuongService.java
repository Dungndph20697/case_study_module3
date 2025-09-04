package com.example.case_study.service;

import java.util.List;

public interface IDungLuongService<D> {

    List<D> findAll();

    D findById(int id);

    boolean save(D d);

    boolean update(int id,D d);

}
