package com.example.case_study.controller.admin;

import com.example.case_study.model.DungLuong;
import com.example.case_study.service.ICRUService;
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
    private ICRUService dungLuongService;

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

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add":
                insert(req, resp);
                break;
            case "edit":
                update(req, resp);
                break;
            default:
                listDungLuongs(req, resp);
                break;
        }
    }

    private void update(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String tenDungLuong = req.getParameter("tenDungLuong");
        DungLuong dungLuong = new DungLuong(id, tenDungLuong);
        dungLuongService.update(id, dungLuong);
        try {
            resp.sendRedirect("/admin/dung-luong");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insert(HttpServletRequest req, HttpServletResponse resp) {
        String tenDungLuong = req.getParameter("tenDungLuong");
        DungLuong dungLuong = new DungLuong(tenDungLuong);
        dungLuongService.save(dungLuong);
        try {
            resp.sendRedirect("/admin/dung-luong");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listDungLuongs(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<DungLuong> dungLuongs = dungLuongService.findAll();
        req.setAttribute("dungLuongs", dungLuongs);
        req.getRequestDispatcher("/admin/dungluong/quanlydungluong.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        DungLuong dungLuong = (DungLuong) dungLuongService.findById(id);
        req.setAttribute("dungLuong", dungLuong);
        try {
            req.getRequestDispatcher("/admin/dungluong/editquanlydungluong.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/dungluong/createquanlydungluong.jsp").forward(req, resp);
    }
}
