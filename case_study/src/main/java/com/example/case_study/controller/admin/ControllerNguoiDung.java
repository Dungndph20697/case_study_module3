package com.example.case_study.controller.admin;

import com.example.case_study.dao.IChucVu;
import com.example.case_study.dao.impl.ChucVuDAOImpl;
import com.example.case_study.model.ChucVu;
import com.example.case_study.model.NguoiDung;
import com.example.case_study.service.IChucVuService;
import com.example.case_study.service.INguoiDungService;
import com.example.case_study.service.impl.ChucVuServiecImpl;
import com.example.case_study.service.impl.NguoiDungServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "nguoiDungServlet", value = "/admin/nguoi-dung")
public class ControllerNguoiDung extends HttpServlet {

    private INguoiDungService nguoiDungService;
    private IChucVuService chucVuService;

    @Override
    public void init() throws ServletException {
        nguoiDungService = new NguoiDungServiceImpl();
        chucVuService = new ChucVuServiecImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        RequestDispatcher dispatcher = null;
        switch (action){
            case "create":
                showCreateForm(req, resp);
                break;
            case "edit":
                showEditForm(req, resp);
                break;
            case "delete":
                int idDelete = Integer.parseInt(req.getParameter("id"));
                if(nguoiDungService.delete(idDelete)) {
                    resp.sendRedirect("/admin/nguoi-dung");
                    return;
                }else {
                    dispatcher = req.getRequestDispatcher("/admin/nguoidung/quanlynguoidung.jsp");
                    req.setAttribute("message", "ID nhân viên không tồn tại");
                    req.setAttribute("success", false);
                }
                break;
            default:
                listNguoiDung(req, resp);
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
                inser(req, resp);
                break;
            case "edit":
                updetee(req, resp);
                break;
            default:
                listNguoiDung(req, resp);
                break;
        }
    }

    private void updetee(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        String tenNguoiDung = req.getParameter("tenNguoiDung");
        String sdt =  req.getParameter("sdt");
        String email = req.getParameter("email");
        String diaChi = req.getParameter("diaChi");
        String matKhau =  req.getParameter("matKhau");
        int idChucVu = Integer.parseInt(req.getParameter("idChucVu"));
        NguoiDung nguoiDung = new NguoiDung(id, tenNguoiDung, sdt, email, diaChi, matKhau, new ChucVu(idChucVu));
        nguoiDungService.update(nguoiDung);
        try{
            resp.sendRedirect("/admin/nguoi-dung");
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void inser(HttpServletRequest req, HttpServletResponse resp) {
        String tenNguoiDung = req.getParameter("tenNguoiDung");
        String sdt = req.getParameter("sdt");
        String email = req.getParameter("email");
        String diaChi = req.getParameter("diaChi");
        String matKhau = req.getParameter("matKhau");
        int idChucVu = Integer.parseInt(req.getParameter("idChucVu"));
        ChucVu chucVu = new ChucVu(idChucVu);

        NguoiDung nguoiDung = new NguoiDung(0, tenNguoiDung, sdt, email, diaChi, matKhau, chucVu);

        nguoiDungService.save(nguoiDung);
        try{
            resp.sendRedirect("/admin/nguoi-dung");
        }catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    private void listNguoiDung(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<NguoiDung> nguoiDungs = nguoiDungService.findAll();
        req.setAttribute("nguoiDungs", nguoiDungs);
        req.getRequestDispatcher("/admin/nguoidung/quanlynguoidung.jsp").forward(req, resp);
    }

    private void showEditForm(HttpServletRequest req, HttpServletResponse resp) {
        int id = Integer.parseInt(req.getParameter("id"));
        List<ChucVu> chucVuList = chucVuService.findAll();
        NguoiDung nguoiDung = (NguoiDung) nguoiDungService.findById(id);
        req.setAttribute("chucVuList",chucVuList);
        req.setAttribute("nguoiDung", nguoiDung);
        try{
            req.getRequestDispatcher("/admin/nguoidung/editnguoidung.jsp").forward(req, resp);
        }catch (ServletException | IOException e) {
            throw  new RuntimeException(e);
        }
    }

    private void showCreateForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<ChucVu> chucVuList = chucVuService.findAll();
        req.setAttribute("chucVuList",chucVuList);
        req.getRequestDispatcher("/admin/nguoidung/createnguoidung.jsp").forward(req, resp);
    }
}

