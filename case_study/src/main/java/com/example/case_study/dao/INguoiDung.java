package com.example.case_study.dao;

import java.util.List;

public interface INguoiDung<NguoiDung> {
    List<NguoiDung> findAll();

    NguoiDung findById(int id);

    boolean save(NguoiDung nguoiDung);

    boolean update(NguoiDung nguoiDung);

    boolean delete(int id);

}
