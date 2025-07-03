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

@WebServlet("/adminAdd")
@MultipartConfig
public class AdminAddServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String roleStr = request.getParameter("role_id");

        // 表单校验
        if (username == null || password == null || phone == null || email == null || roleStr == null) {
            request.setAttribute("msg", "所有字段必须填写！");
            request.getRequestDispatcher("adminAdd.jsp").forward(request, response);
            return;
        }

        int roleId = Integer.parseInt(roleStr); // 必须为 1 或 2

        // 加密密码
        String md5Password = MD5Util.getMD5Str(password);

        // 头像处理
        Part avatarPart = request.getPart("avatar");
        String avatarPath = null;
        if (avatarPart != null && avatarPart.getSize() > 0) {
            String uploadDir = getServletContext().getRealPath("/uploads/avatars");
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = UUID.randomUUID() + getFileExtension(avatarPart.getSubmittedFileName());
            avatarPart.write(uploadDir + File.separator + fileName);
            avatarPath = "/uploads/avatars/" + fileName;
        }

        UsersBean user = new UsersBean();
        user.setUsername(username);
        user.setPassword(md5Password);
        user.setGender(gender);
        user.setPhone(phone);
        user.setEmail(email);
        user.setAvatar(avatarPath);
        user.setRole_id(roleId);

        boolean success = UsersDao.insertUser(user);

        if (success) {
            response.sendRedirect("adminList");
        } else {
            request.setAttribute("msg", "添加失败，请检查是否有重复的用户名或手机号！");
            request.getRequestDispatcher("adminAdd.jsp").forward(request, response);
        }
    }

    private String getFileExtension(String fileName) {
        return fileName.lastIndexOf(".") != -1 ? fileName.substring(fileName.lastIndexOf(".")) : "";
    }
}
