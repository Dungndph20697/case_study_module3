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
        // 3 dong UTF sửa lỗi tiếng việt
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "list";
        switch (action) {
            case "create":
                req.getRequestDispatcher("/admin/mausac/addmausac.jsp").forward(req, resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                MauSac mau = mauSacService.findById(id);
                req.setAttribute("mauSac", mau);
                req.getRequestDispatcher("/admin/mausac/editmausac.jsp").forward(req, resp);
                break;
            case "delete":
                int deleteId = Integer.parseInt(req.getParameter("id"));
                mauSacService.deleteById(deleteId);
                resp.sendRedirect(req.getContextPath() + "/admin/mau-sac");
                break;
            case "search":
                String keyword = req.getParameter("keyword");
                if (keyword == null || keyword.isEmpty()) {
                    List<MauSac> list = mauSacService.findAll();
                    req.setAttribute("listMauSac", list);
                } else {
                    List<MauSac> result = mauSacService.searchByName(keyword);
                    req.setAttribute("listMauSac", result);
                }
                req.getRequestDispatcher("/admin/quanlymausac.jsp").forward(req, resp);
                break;
            default:
                List<MauSac> list = mauSacService.findAll();
                req.setAttribute("listMauSac", list);
                req.getRequestDispatcher("/admin/quanlymausac.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String id = req.getParameter("id");
        String tenMauSac = req.getParameter("tenMauSac");

        if (id == null || id.isEmpty()) {
            // thêm mới
            MauSac mauSac = new MauSac();
            mauSac.setMauSac(tenMauSac);
            mauSacService.save(mauSac);
        } else {
            // cập nhập
            MauSac mauSac = mauSacService.findById(Integer.parseInt(id));
            mauSac.setMauSac(tenMauSac);
            mauSacService.update(mauSac);
        }
        resp.sendRedirect(req.getContextPath() + "/admin/mau-sac");
    }
}
