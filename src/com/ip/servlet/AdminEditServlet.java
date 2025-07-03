package com.ip.servlet;

import com.ip.bean.UsersBean;
import com.ip.dao.UsersDao;
import com.ip.util.MD5Util;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/adminEdit")
@MultipartConfig
public class AdminEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        UsersBean admin = UsersDao.getUserById(userId);
        request.setAttribute("admin", admin);
        request.getRequestDispatcher("adminEdit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        int userId = Integer.parseInt(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int roleId = Integer.parseInt(request.getParameter("role_id"));

        UsersBean old = UsersDao.getUserById(userId);

        // 密码处理（为空则保留旧密码）
        String encryptedPassword = old.getPassword();
        if (password != null && !password.trim().isEmpty()) {
            encryptedPassword = MD5Util.getMD5Str(password);
        }

        // 头像处理（为空则保留旧头像）
        Part avatarPart = request.getPart("avatar");
        String avatarPath = old.getAvatar();
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String uploadDir = getServletContext().getRealPath("/uploads/avatars");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = UUID.randomUUID() + getFileExtension(avatarPart.getSubmittedFileName());
            avatarPart.write(uploadDir + File.separator + fileName);
            avatarPath = "/uploads/avatars/" + fileName;
        }

        // 封装 bean
        UsersBean admin = new UsersBean();
        admin.setUser_id(userId);
        admin.setUsername(username);
        admin.setGender(gender);
        admin.setPhone(phone);
        admin.setEmail(email);
        admin.setPassword(encryptedPassword);
        admin.setAvatar(avatarPath);
        admin.setRole_id(roleId);

        boolean success = UsersDao.updateUser(admin);

        if (success) {
            response.sendRedirect("adminList");
        } else {
            request.setAttribute("msg", "修改失败！");
            request.setAttribute("admin", admin);
            request.getRequestDispatcher("adminEdit.jsp").forward(request, response);
        }
    }

    private String getFileExtension(String fileName) {
        return fileName.lastIndexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".")) : "";
    }
}
