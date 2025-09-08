package com.example.case_study.controller.nguoidung;

import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.service.ICRUService;
import com.example.case_study.service.ITrangChu;
import com.example.case_study.service.impl.SanPhamChiTietServiceImpl;
import com.example.case_study.service.impl.TrangChuImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "trangchu", value = "/trang-chu")
public class ControllerNguoiDung extends HttpServlet {

    private ICRUService sanPhamChiTietService;
    private ITrangChu trangChuService;

    @Override
    public void init() throws ServletException {
        sanPhamChiTietService = new SanPhamChiTietServiceImpl();
        trangChuService = new TrangChuImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idSpct = Integer.valueOf(request.getParameter("idSpct"));
        int idUser = 3;
        trangChuService.addSpctToGioHang(idSpct, idUser);
        response.sendRedirect("/trang-chu");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietService.findAll();

        request.setAttribute("sanPhamChiTiets", sanPhamChiTietList);
        request.getRequestDispatcher("/nguoidung/index.jsp").forward(request, response);
    }

}
