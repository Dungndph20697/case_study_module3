package com.example.case_study.controller.nguoidung;

import com.example.case_study.dao.nguoidung.UserDAO;
import com.example.case_study.model.nguoidung.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class ControllerLogin extends HttpServlet {
    private final UserDAO userDAO =  new UserDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Điều hướng đến trang login.jsp khi có request GET
        req.getRequestDispatcher("login.jsp").forward(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        User user = userDAO.checkLogin(email, password);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);

            if ("ADMIN".equals(user.getRole())) {
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/nguoidung/index.jsp");
            }
        } else {
            req.setAttribute("errorMessage", "Sai email hoặc mật khẩu!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
