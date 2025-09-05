package com.example.case_study.service;

import com.example.case_study.model.MauSac;
import java.util.List;

public interface MauSacService {
    List<MauSac> findAll();

    MauSac findById(int id);

    boolean save(MauSac mauSac);

    boolean update(MauSac mauSac);


}
