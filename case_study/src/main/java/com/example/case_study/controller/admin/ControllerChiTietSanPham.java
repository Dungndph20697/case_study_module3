package com.example.case_study.controller.admin;

import com.example.case_study.model.*;
import com.example.case_study.service.HangService;
import com.example.case_study.service.ICRUService;
import com.example.case_study.service.ISanPhamService;
import com.example.case_study.service.MauSacService;
import com.example.case_study.service.impl.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "chiTietSanPhamServlet", value = "/admin/chi-tiet-san-pham")
public class ControllerChiTietSanPham extends HttpServlet {
    private ICRUService sanPhamChiTietService;
    private MauSacService mauSacService;
    private ICRUService dungLuongService;
    private HangService hangService;
    private ISanPhamService sanPhamService;

    @Override
    public void init() throws ServletException {
        mauSacService = new MauSacServiceImpl();
        dungLuongService = new DungLuongServiceImpl();
        sanPhamChiTietService = new SanPhamChiTietServiceImpl();
        hangService = new HangServiceImpl();
        sanPhamService = new SanPhamServiceImpl();
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

            case "detail":
                showDetailForm(req, resp);
                break;
            default:
                listDungLuongs(req, resp);
                break;
        }
    }

    private void showDetailForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        SanPhamChiTiet spct = (SanPhamChiTiet) sanPhamChiTietService.findById(id);
        req.setAttribute("spct", spct);
        try {
            req.getRequestDispatcher("/admin/sanphamchitiet/detailspct.jsp").forward(req, resp);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
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

    private void update(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.valueOf(req.getParameter("idCtspUpdate"));
        int idHang = Integer.valueOf(req.getParameter("idHang"));
        int idSanPham = Integer.valueOf(req.getParameter("idSanPham"));
        int idDungLuong = Integer.valueOf(req.getParameter("idDungLuong"));
        int idMauSac = Integer.valueOf(req.getParameter("idMauSac"));
        String moTa = req.getParameter("moTa");
        String gia = req.getParameter("gia");
        BigDecimal giaB = BigDecimal.valueOf(Double.valueOf(req.getParameter("gia")));
        int soLuong = Integer.valueOf(req.getParameter("soLuong"));
        int trangThai = Integer.valueOf(req.getParameter("trangThai"));
        String anh = req.getParameter("anh");
        SanPhamChiTiet spct = new SanPhamChiTiet().builder()
                .moTa(moTa)
                .gia(giaB)
                .soLuong(soLuong)
                .trangThai(trangThai)
                .anh(anh)
                .sanPham(new SanPham().builder().id(idSanPham).build())
                .hang(new Hang(Integer.valueOf(idHang)))
                .dungLuong(new DungLuong().builder().id(idDungLuong).build())
                .mauSac(new MauSac(Integer.valueOf(idMauSac)))
                .build();
        sanPhamChiTietService.update(id, spct);
        resp.sendRedirect("/admin/chi-tiet-san-pham");
    }

    private void insert(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idHang = Integer.valueOf(req.getParameter("idHang"));
        int idSanPham = Integer.valueOf(req.getParameter("idSanPham"));
        int idDungLuong = Integer.valueOf(req.getParameter("idDungLuong"));
        int idMauSac = Integer.valueOf(req.getParameter("idMauSac"));
        String moTa = req.getParameter("moTa");
        String gia = req.getParameter("gia");
        BigDecimal giaB = BigDecimal.valueOf(Double.valueOf(req.getParameter("gia")));
        int soLuong = Integer.valueOf(req.getParameter("soLuong"));
        int trangThai = 0;
        String anh = req.getParameter("anh");
        SanPhamChiTiet spct = new SanPhamChiTiet().builder()
                .moTa(moTa)
                .gia(giaB)
                .soLuong(soLuong)
                .trangThai(trangThai)
                .anh(anh)
                .sanPham(new SanPham().builder().id(idSanPham).build())
                .hang(new Hang(Integer.valueOf(idHang)))
                .dungLuong(new DungLuong().builder().id(idDungLuong).build())
                .mauSac(new MauSac(Integer.valueOf(idMauSac)))
                .build();
        sanPhamChiTietService.save(spct);
        resp.sendRedirect("/admin/chi-tiet-san-pham");
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
        int id = Integer.parseInt(req.getParameter("id"));
        SanPhamChiTiet spct = (SanPhamChiTiet) sanPhamChiTietService.findById(id);
        List<MauSac> mauSacs = mauSacService.findAll();
        List<DungLuong> dungLuongs = dungLuongService.findAll();
        List<Hang> hangs = hangService.findAll();
        List<SanPham> sanPhams = sanPhamService.findAll();
        req.setAttribute("mauSacs", mauSacs);
        req.setAttribute("sanPhams", sanPhams);
        req.setAttribute("hangs", hangs);
        req.setAttribute("dungLuongs", dungLuongs);
        req.setAttribute("spct", spct);
        req.getRequestDispatcher("/admin/sanphamchitiet/editquanlyctsp.jsp").forward(req, resp);
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<MauSac> mauSacs = mauSacService.findAll();
        List<DungLuong> dungLuongs = dungLuongService.findAll();
        List<Hang> hangs = hangService.findAll();
        List<SanPham> sanPhams = sanPhamService.findAll();
        req.setAttribute("mauSacs", mauSacs);
        req.setAttribute("sanPhams", sanPhams);
        req.setAttribute("hangs", hangs);
        req.setAttribute("dungLuongs", dungLuongs);
        req.getRequestDispatcher("/admin/sanphamchitiet/createquanlyctsp.jsp").forward(req, resp);
    }
}
