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

@WebServlet("/editAccount")
@MultipartConfig
public class EditAccountServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int userId = (int) request.getSession().getAttribute("user_id");
        UsersBean user = UsersDao.getUserById(userId);
        request.setAttribute("user", user);
        request.getRequestDispatcher("account_edit.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        int userId = Integer.parseInt(request.getParameter("user_id"));
        String username = request.getParameter("username");
        String gender = request.getParameter("gender");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        UsersBean original = UsersDao.getUserById(userId);
        String encryptedPassword = (password != null && !password.trim().isEmpty())
                ? MD5Util.getMD5Str(password)
                : original.getPassword();

        // 头像上传处理
        String avatarPath = original.getAvatar();
        Part avatarPart = request.getPart("avatar");
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
        user.setPassword(encryptedPassword);
        user.setAvatar(avatarPath);
        user.setRole_id(original.getRole_id()); // 保持原始角色

        boolean success = UsersDao.updateUser(user);
        if (success) {
            response.sendRedirect("myProfile");
        } else {
            request.setAttribute("msg", "更新失败！");
            request.setAttribute("user", user);
            request.getRequestDispatcher("account_edit.jsp").forward(request, response);
        }

    }

    private String getFileExtension(String name) {
        return name.lastIndexOf(".") != -1 ? name.substring(name.lastIndexOf(".")) : "";
    }
}
