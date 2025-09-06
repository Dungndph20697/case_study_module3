package com.example.case_study.dao;

import java.util.List;

public interface ICRUDAO<SPCT> {
    List<SPCT> findAll();

    SPCT findById(int id);

    boolean save(SPCT d);

    boolean update(int id,SPCT d);
}
