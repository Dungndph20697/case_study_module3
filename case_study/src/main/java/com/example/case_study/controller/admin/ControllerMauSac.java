package com.example.case_study.controller.admin;

import com.example.case_study.model.MauSac;
import com.example.case_study.service.MauSacService;
import com.example.case_study.service.impl.MauSacServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "mauSacServlet", value = "/admin/mau-sac")
public class ControllerMauSac extends HttpServlet {

    private MauSacService mauSacService = new MauSacServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Lấy danh sách màu từ service
        List<MauSac> list = mauSacService.findAll();

        // Gắn vào request để JSP sử dụng
        req.setAttribute("listMauSac", list);

        // Chuyển sang trang JSP
        req.getRequestDispatcher("/admin/quanlymausac.jsp").forward(req, resp);
    }
}
