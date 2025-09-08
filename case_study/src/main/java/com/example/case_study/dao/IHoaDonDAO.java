package com.example.case_study.dao;

import com.example.case_study.model.HoaDon;

public interface IHoaDonDAO {

    void insertHoaDon(HoaDon hd);

    HoaDon getHoaDonTrangThaiByIdUser(int idUser,int trangThai);
}
