package com.example.case_study.controller.admin;

import com.example.case_study.model.SanPham;
import com.example.case_study.service.ISanPhamService;
import com.example.case_study.service.impl.SanPhamServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@WebServlet(name = "sanPhamServlet", value = "/admin/san-pham")
public class ControllerSanPham extends HttpServlet {
    private ISanPhamService sanPhamService =  new SanPhamServiceImpl();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 3 dong UTF sửa lỗi tiếng việt
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String action =  req.getParameter("action");
        if(action==null) action="listSanPham";
        switch (action){
            case"create":
                // tạm thời để ở file quanlysanpham.jsp
                req.getRequestDispatcher("/admin/quanlysanpham/addsanpham.jsp").forward(req,resp);
                break;
            case "edit":
                int id = Integer.parseInt(req.getParameter("id"));
                SanPham sanPham = sanPhamService.findById(id);
                req.setAttribute("sanPham",sanPham); // chi mot san pham
                // tạm thời để ở file quanlysanpham.jsp
                req.getRequestDispatcher("/admin/quanlysanpham/editsanpham.jsp").forward(req,resp);
                break;
            case"search":
                String keyword = req.getParameter("keyword");
                List<SanPham> result;
                if (keyword == null || keyword.isEmpty()){
                    result = sanPhamService.findAll();
                }else {
                    result = sanPhamService.searchByName(keyword);
                }
                req.setAttribute("listSanPham",result); // danh sach
                req.getRequestDispatcher("/admin/quanlysanpham.jsp").forward(req,resp);
                break;
            default:
                List<SanPham> list = sanPhamService.findAll();
                req.setAttribute("listSanPham",list); // danh sach
                req.getRequestDispatcher("/admin/quanlysanpham.jsp").forward(req,resp);
        }
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");
        String id = req.getParameter("id");
        String tenSanPham = req.getParameter("tenSanPham");

        if (id == null || id.isEmpty()){
            // them moi
            SanPham sanPham = new SanPham();
            sanPham.setTenSanPham(tenSanPham);
            sanPhamService.save(sanPham);
        }else {
            // cap nhap
            SanPham sanPham = sanPhamService.findById(Integer.parseInt(id));
            sanPham.setTenSanPham(tenSanPham);
            sanPhamService.update(sanPham);
        }
        resp.sendRedirect(req.getContextPath()+"/admin/san-pham");
    }
}
