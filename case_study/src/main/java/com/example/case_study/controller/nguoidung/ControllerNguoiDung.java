package com.example.case_study.controller.nguoidung;

import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.service.ICRUService;
import com.example.case_study.service.impl.SanPhamChiTietServiceImpl;

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

    @Override
    public void init() throws ServletException {
        sanPhamChiTietService = new SanPhamChiTietServiceImpl();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietService.findAll();

        request.setAttribute("sanPhamChiTiets", sanPhamChiTietList);
        request.getRequestDispatcher("/nguoidung/index.jsp").forward(request, response);
    }

}
