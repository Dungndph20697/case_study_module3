package com.example.case_study.service;

import com.example.case_study.model.Hang;

import java.util.List;

public interface HangService {
    List<Hang> findAll();

    Hang findById(int id);

    boolean save(Hang hang);

    boolean update(Hang hang);

    List<Hang> searchByName(String keyword);
}
