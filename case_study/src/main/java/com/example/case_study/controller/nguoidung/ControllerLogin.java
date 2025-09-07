package com.example.case_study.controller.nguoidung;

import com.example.case_study.dao.nguoidung.UserDAO;
import com.example.case_study.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "loginServlet", value = "/login")
public class ControllerLogin extends HttpServlet {
    private final UserDAO userDAO =  new UserDAO();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Kiểm tra cookie nếu có (remember me)
        Cookie[] cookies = req.getCookies();
        String email = null;
        String password = null;

        if (cookies != null) {
            for (Cookie c : cookies) {
                if ("userEmail".equals(c.getName())) {
                    email = c.getValue();
                }
            }
        }

        // Nếu có cookie thì gán sẵn vào form
        req.setAttribute("emailCookie", email);
        req.setAttribute("passwordCookie", password);

        req.getRequestDispatcher("/login/dangnhap.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String remember = req.getParameter("remember"); // checkbox "Remember me"

        User user = userDAO.checkLogin(email, password);

        if (user != null) {
            // Lưu user vào session
            HttpSession session = req.getSession();
            session.setAttribute("currentUser", user);

            // Nếu chọn "Ghi nhớ đăng nhập"
            remember = req.getParameter("remember");
            if ("on".equals(remember)) {
                Cookie cookie = new Cookie("userEmail", user.getEmail());
                cookie.setMaxAge(7 * 24 * 60 * 60); // cookie tồn tại 7 ngày
                resp.addCookie(cookie);
            }

            // Điều hướng
            if (user.getRoleId() == 1) {
                resp.sendRedirect(req.getContextPath() + "/admin/dashboard");
            } else {
                resp.sendRedirect(req.getContextPath() + "/trang-chu");
            }
        } else {
            req.setAttribute("error", "Sai email hoặc mật khẩu!");
            req.getRequestDispatcher("/login/dangnhap.jsp").forward(req, resp);
        }
    }
}
