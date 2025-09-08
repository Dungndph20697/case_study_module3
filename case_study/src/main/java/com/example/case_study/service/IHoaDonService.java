package com.example.case_study.service;

import com.example.case_study.model.HoaDon;

public interface IHoaDonService {

    void insertHoaDon(int idUser);

    HoaDon getHoaDonTrangThaiByIdUser(int idUser,int trangThai);

}
