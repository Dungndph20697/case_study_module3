package com.example.case_study.controller.admin;

import com.example.case_study.model.Hang;
import com.example.case_study.service.HangService;
import com.example.case_study.service.impl.HangServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "hangServlet", value = "/admin/hang")
public class ControllerHang extends HttpServlet {
    private HangService hangService = new HangServiceImpl();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 3 dong UTF sửa lỗi tiếng việt
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action = req.getParameter("action");
        if (action == null) action = "list";
        switch (action) {
            case "create":
                req.getRequestDispatcher("/admin/hang/addhang.jsp").forward(req, resp);
                break;
            case "edit":
                int id =  Integer.parseInt(req.getParameter("id"));
                Hang hang = hangService.findById(id);
                req.setAttribute("hang", hang);
                req.getRequestDispatcher("/admin/hang/edithang.jsp").forward(req, resp);
                break;
            case "search":
                String keyword = req.getParameter("keyword");
                if (keyword == null || keyword.isEmpty()){
                    List<Hang> list = hangService.findAll();
                    req.setAttribute("listHang", list);
                }else {
                    List<Hang> result = hangService.searchByName(keyword);
                    req.setAttribute("listHang", result);
                }
                req.getRequestDispatcher("/admin/quanlyhang.jsp").forward(req, resp);
                break;
            default:
                List<Hang> list = hangService.findAll();
                req.setAttribute("listHang", list);
                req.getRequestDispatcher("/admin/quanlyhang.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String id = req.getParameter("id");
        String tenHang =  req.getParameter("tenHang");

        if (id == null || id.isEmpty()){
            // thêm mới
            Hang hang = new Hang();
            hang.setTenHang(tenHang);
            hangService.save(hang);
        }else {
            // cập nhập
            Hang hang = new Hang(Integer.parseInt(id), tenHang);
            hangService.update(hang);
        }
        resp.sendRedirect(req.getContextPath() + "/admin/hang");
    }
}
