package com.example.case_study.service;

import java.util.List;

public interface INguoiDungService<NguoiDung> {

    List<NguoiDung> findAll();

    NguoiDung findById(int id);

    boolean save(NguoiDung nguoiDung);

    boolean update(NguoiDung nguoiDung);

    boolean delete(int id);

}
