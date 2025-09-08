package com.example.case_study.controller.nguoidung;

import com.example.case_study.model.HoaDon;
import com.example.case_study.model.HoaDonChiTiet;
import com.example.case_study.service.IGioHangService;
import com.example.case_study.service.IHoaDonService;
import com.example.case_study.service.impl.GioHangServiceImpl;
import com.example.case_study.service.impl.HoaDonServicrImpl;
import com.example.case_study.service.impl.SanPhamChiTietServiceImpl;
import com.example.case_study.service.impl.TrangChuImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "gioHangServlet", value = "/giohang")
public class ControllerGioHang extends HttpServlet {
    private IGioHangService gioHangService;
    private IHoaDonService hoaDonService;

    @Override
    public void init() throws ServletException {
        gioHangService = new GioHangServiceImpl();
        hoaDonService = new HoaDonServicrImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        HoaDon hd = hoaDonService.getHoaDonTrangThaiByIdUser(3, 0);
        List<HoaDonChiTiet> hoaDonChiTietList = gioHangService.getGioHangByIdUser(3, hd.getId());
        req.setAttribute("hoaDonChiTietList", hoaDonChiTietList);
        req.getRequestDispatcher("/giohang/giohanguser.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
