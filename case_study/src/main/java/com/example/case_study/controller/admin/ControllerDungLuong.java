package com.example.case_study.controller.admin;

import com.example.case_study.model.DungLuong;
import com.example.case_study.service.IDungLuongService;
import com.example.case_study.service.impl.DungLuongServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "dungLuongServlet", value = "/admin/dung-luong")
public class ControllerDungLuong extends HttpServlet {
    private IDungLuongService dungLuongService;

    @Override
    public void init() throws ServletException {
        dungLuongService = new DungLuongServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            default:
                listDungLuongs(req, resp);
                break;
        }
    }

    private void listDungLuongs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DungLuong> dungLuongs = dungLuongService.findAll();
        req.setAttribute("dungLuongs", dungLuongs);
        req.getRequestDispatcher("/admin/quanlydungluong.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {

    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
