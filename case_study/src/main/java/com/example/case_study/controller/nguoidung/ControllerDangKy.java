package com.example.case_study.controller.nguoidung;

import com.example.case_study.dao.nguoidung.UserDAO;
import com.example.case_study.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "registerServlet", value = "/dang-ky")
public class ControllerDangKy extends HttpServlet {
    private final UserDAO userDAO = new UserDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.getRequestDispatcher("/login/dangky.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        // Lấy dữ liệu từ form
        String fullName = request.getParameter("fullName");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        String password = request.getParameter("password");

        // Kiểm tra mật khẩu >= 6 ký tự
        if (password == null || password.length() < 6) {
            request.setAttribute("error", "Mật khẩu phải có ít nhất 6 ký tự!");
            request.getRequestDispatcher("/login/dangky.jsp").forward(request, response);
            return;
        }

        // Email đã tồn tại
        if (userDAO.existsByEmail(email)) {
            request.setAttribute("error", " Email đã tồn tại, vui lòng nhập lại!");
            request.setAttribute("fullName", fullName);
            request.setAttribute("phone", phone);
            request.setAttribute("address", address);
            //  Không set lại email để user nhập lại
            request.getRequestDispatcher("/login/dangky.jsp").forward(request, response);
            return;
        }

//  Số điện thoại đã tồn tại
        if (userDAO.existsByPhone(phone)) {
            request.setAttribute("error", " Số điện thoại đã tồn tại, vui lòng nhập lại!");
            request.setAttribute("fullName", fullName);
            request.setAttribute("email", email);
            request.setAttribute("address", address);
            //  Không set lại phone để user nhập lại
            request.getRequestDispatcher("/login/dangky.jsp").forward(request, response);
            return;
        }

        // Tạo đối tượng user
        User user = new User();
        user.setFullName(fullName);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAddress(address);
        user.setPassword(password); // Lưu plain text (theo DAO bạn đã sửa)
        user.setRoleId(2); // mặc định user thường

        // Gọi DAO để lưu DB
        int id = userDAO.insertUser(user);

        if (id > 0) {
            // Đăng ký thành công -> chuyển về login
            response.sendRedirect(request.getContextPath() + "/login");
        } else {
            request.setAttribute("error", "Đăng ký thất bại, vui lòng thử lại!");
            request.getRequestDispatcher("/login/dangky.jsp").forward(request, response);
        }
    }
}
