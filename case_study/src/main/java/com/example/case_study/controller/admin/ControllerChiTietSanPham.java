package com.example.case_study.controller.admin;

import com.example.case_study.model.DungLuong;
import com.example.case_study.model.MauSac;
import com.example.case_study.model.SanPhamChiTiet;
import com.example.case_study.service.IDungLuongService;
import com.example.case_study.service.ISanPhamChiTietService;
import com.example.case_study.service.MauSacService;
import com.example.case_study.service.impl.DungLuongServiceImpl;
import com.example.case_study.service.impl.MauSacServiceImpl;
import com.example.case_study.service.impl.SanPhamChiTietServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "chiTietSanPhamServlet", value = "/admin/chi-tiet-san-pham")
public class ControllerChiTietSanPham extends HttpServlet {
    private ISanPhamChiTietService sanPhamChiTietService;
    private MauSacService mauSacService;
    private IDungLuongService dungLuongService;

    @Override
    public void init() throws ServletException {
        mauSacService = new MauSacServiceImpl();
        dungLuongService = new DungLuongServiceImpl();
        sanPhamChiTietService = new SanPhamChiTietServiceImpl();
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

    private void listDungLuongs(HttpServletRequest req, HttpServletResponse resp) {
        List<SanPhamChiTiet> sanPhamChiTietList = sanPhamChiTietService.findAll();
        req.setAttribute("sanPhamChiTietList", sanPhamChiTietList);
        try {
            req.getRequestDispatcher("/admin/sanphamchitiet/quanlychitietsanpham.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.getRequestDispatcher("/admin/sanphamchitiet/editquanlyctsp.jsp").forward(req, resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MauSac> mauSacs = mauSacService.findAll();
        List<DungLuong> dungLuongs = dungLuongService.findAll();
        req.setAttribute("mauSacs", mauSacs);
        req.setAttribute("dungLuongs", dungLuongs);
        req.getRequestDispatcher("/admin/sanphamchitiet/createquanlyctsp.jsp").forward(req, resp);
    }
}
