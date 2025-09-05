package com.example.case_study.controller.admin;

import com.example.case_study.model.ChucVu;
import com.example.case_study.model.DungLuong;
import com.example.case_study.service.IChucVuService;
import com.example.case_study.service.impl.ChucVuServiecImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;




@WebServlet(name = "chucVuServlet", value = "/admin/chuc-vu")
public class ControllerChucVu extends HttpServlet {

    private IChucVuService chucVuService;

    @Override
    public void init() throws ServletException {
        chucVuService = new ChucVuServiecImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher dispatcher;
        switch (action) {
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                if(chucVuService.delete(idDelete)) {
                    resp.sendRedirect("/admin/chuc-vu");
                    return;
                }else {
                    dispatcher = req.getRequestDispatcher("/admin/chucvu/quanlychucvu.jsp");
                    req.setAttribute("message", "ID nhân viên không tồn tại");
                    req.setAttribute("success", false);
                }
                break;
            default:
               listChucVu(req, resp);
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
                updetee(req, resp);
                break;
            default:
                listChucVu(req, resp);
                break;
        }
    }

    private void updetee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String tenChucVu = req.getParameter("tenChucVu");
        ChucVu chucVu = new ChucVu(id, tenChucVu);
        chucVuService.update(chucVu);
        try {
            resp.sendRedirect("/admin/chuc-vu");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void insert(HttpServletRequest req, HttpServletResponse resp) {
        String tenChucVu = req.getParameter("tenChucVu");
        ChucVu chucVu = new ChucVu(tenChucVu);
        chucVuService.save(chucVu);
        try {
            resp.sendRedirect("/admin/chuc-vu");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        ChucVu chucVu = (ChucVu) chucVuService.findById(id);
        req.setAttribute("chucVu", chucVu);
        try {
            req.getRequestDispatcher("/admin/chucvu/editchucvu.jsp").forward(req, resp);
        } catch (ServletException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/chucvu/createquanlychucvu.jsp").forward(req, resp);
    }

    private void listChucVu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ChucVu> chucVus = chucVuService.findAll();
        req.setAttribute("chucVus", chucVus);
        req.getRequestDispatcher("/admin/chucvu/quanlychucvu.jsp").forward(req, resp);
    }
}
