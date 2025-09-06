package com.example.case_study.controller.nguoidung;

import com.example.case_study.dao.nguoidung.UserDAO;
import com.example.case_study.model.nguoidung.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "registerServlet", value = "/dang-ky")
public class ControllerDangKy extends HttpServlet {
    private UserDAO userDAO =  new UserDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login/dangky.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String password = req.getParameter("password");

        // TODO: validate dữ liệu, hash password bằng BCrypt

        User user = new User(firstName, lastName, email, phone, password);
        userDAO.insertUser(user);

        // Redirect sau khi đăng ký thành công
        resp.sendRedirect(req.getContextPath() + "/login/dangnhap.jsp");
    }

}
