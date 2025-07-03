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

@WebServlet("/userEdit")
@MultipartConfig
public class UserEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("id"));
        UsersBean user = UsersDao.getUserById(userId);
        if (user == null) {
            System.out.println("未查到用户 user_id = " + userId);
        } else {
            System.out.println("user_id 参数值：" + request.getParameter("user_id"));
            System.out.println("查到用户: " + user.getUsername());
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("user_edit.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        System.out.println("=== 表单参数调试 ===");
        System.out.println("user_id: " + request.getParameter("user_id"));
        System.out.println("username: " + request.getParameter("username"));
        System.out.println("gender: " + request.getParameter("gender"));
        System.out.println("phone: " + request.getParameter("phone"));
        System.out.println("email: " + request.getParameter("email"));
        System.out.println("role_id: " + request.getParameter("role_id"));


        String userIdStr = request.getParameter("user_id");
        if (userIdStr == null || userIdStr.trim().isEmpty()) {
            request.setAttribute("msg", "无法更新，缺少用户 ID");
            request.getRequestDispatcher("user_edit.jsp").forward(request, response);
            return;
        }
        int userId = Integer.parseInt(userIdStr);

        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        int roleId = Integer.parseInt(request.getParameter("role_id"));

        // 原始用户信息（用于保留原始头像）
        UsersBean originalUser = UsersDao.getUserById(userId);

        // 加密密码（如果不为空则更新）
        String encryptedPassword = null;
        if (password != null && !password.trim().isEmpty()) {
            encryptedPassword = MD5Util.getMD5Str(password);
        }

        // 头像处理
        Part avatarPart = request.getPart("avatar");
        String avatarPath = originalUser.getAvatar(); // 默认用原图
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String uploadDir = getServletContext().getRealPath("/uploads/avatars");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = UUID.randomUUID() + getFileExtension(avatarPart.getSubmittedFileName());
            avatarPart.write(uploadDir + File.separator + fileName);
            avatarPath = "/uploads/avatars/" + fileName;
        }

        UsersBean user = new UsersBean();
        user.setUser_id(userId);
        user.setUsername(username);
        user.setGender(gender);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAvatar(avatarPath);
        user.setRole_id(roleId);

        if (encryptedPassword != null) {
            user.setPassword(encryptedPassword);
        } else {
            user.setPassword(originalUser.getPassword());
        }

        boolean updated = UsersDao.updateUser(user);

        if (updated) {
            response.sendRedirect("userList");
        } else {
            request.setAttribute("msg", "更新失败");
            request.setAttribute("user", user);
            request.getRequestDispatcher("user_edit.jsp").forward(request, response);
        }
    }

    private String getFileExtension(String fileName) {
        return fileName.lastIndexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".")) : "";
    }
}
