package com.example.case_study.controller.nguoidung;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "phuongThucThanhToanServlet", value = "/giohang/phuong-thuc-thanh-toan")
public class ControllerPhuongThucThanhToan extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Gửi request sang file JSP để hiển thị
        req.getRequestDispatcher("/giohang/phuongthucthanhtoan.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
