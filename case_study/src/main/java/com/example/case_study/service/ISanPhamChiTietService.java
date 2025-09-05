package com.example.case_study.service;

import java.util.List;

public interface ISanPhamChiTietService<SPCT> {
    List<SPCT> findAll();

    SPCT findById(int id);

    boolean save(SPCT d);

    boolean update(int id,SPCT d);
}
