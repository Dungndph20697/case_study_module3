package com.example.case_study.service;

import com.example.case_study.model.HoaDonChiTiet;
import org.omg.PortableInterceptor.HOLDING;

import java.util.List;

public interface IGioHangService {
    List<HoaDonChiTiet> getGioHangByIdUser(int idUser, int idHd);
}
