package com.example.case_study.controller.admin;

import com.example.case_study.model.ChucVu;
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
        RequestDispatcher dispatcher = null;
        switch (action) {
            case "create":
                req.setAttribute("message", "");
                dispatcher = req.getRequestDispatcher("/admin/chuc-vu.jsp");
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                ChucVu chucVu = (ChucVu) chucVuService.findById(id);
                req.setAttribute("chucVu", chucVu);
                req.setAttribute("message", "");
                dispatcher = req.getRequestDispatcher("/admin/chuc-vu.jsp");
                break;
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                if(chucVuService.delete(idDelete)) {
                    resp.sendRedirect("/admin/chuc-vu");
                    return;
                }else {
                    dispatcher = req.getRequestDispatcher("/admin/chuc-vu.jsp");
                    req.setAttribute("message", "ID nhân viên không tồn tại");
                    req.setAttribute("success", false);
                }
                break;
            default:
                listChucVu(req, resp);
        }
    }

    private void listChucVu(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ChucVu> chucVus = chucVuService.findAll();
        req.setAttribute("chucVus", chucVus);
        req.getRequestDispatcher("/admin/quanlychucvu.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) {
    }
}
