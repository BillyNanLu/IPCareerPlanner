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
import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.UUID;
import java.util.stream.Collectors;

@WebServlet("/userAdd")
@MultipartConfig
public class UserAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user_add.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String username = getFormField(request, "username");
        String gender = getFormField(request, "gender");
        String phone = getFormField(request, "phone");
        String password = getFormField(request, "password");
        String email = getFormField(request, "email");
        String roleIdStr = getFormField(request, "role_id");

        System.out.println("username 参数：" + username);
        System.out.println("role_id 参数：" + roleIdStr);

        int roleId = Integer.parseInt(request.getParameter("role_id"));

        // 加密密码
        String encryptedPassword = MD5Util.getMD5Str(password);

        // 头像上传
        Part avatarPart = request.getPart("avatar");
        String avatarPath = "/image/users/defaultavatars.jpg"; // 默认
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
        user.setGender(gender);
        user.setPhone(phone);
        user.setPassword(encryptedPassword);
        user.setEmail(email);
        user.setAvatar(avatarPath);
        user.setRole_id(roleId);

        boolean inserted = UsersDao.insertUser(user);

        if (inserted) {
            response.sendRedirect("userList");
        } else {
            request.setAttribute("msg", "添加失败，用户名或手机号或邮箱可能已存在");
            request.getRequestDispatcher("user_add.jsp").forward(request, response);
        }

    }

    private String getFileExtension(String fileName) {
        return fileName.lastIndexOf(".") != -1 ?
                fileName.substring(fileName.lastIndexOf(".")) : "";
    }

    private String getFormField(HttpServletRequest request, String name) throws IOException, ServletException {
        Part part = request.getPart(name);
        if (part != null) {
            InputStream inputStream = part.getInputStream();
            return new BufferedReader(new InputStreamReader(inputStream, StandardCharsets.UTF_8))
                    .lines().collect(Collectors.joining("\n"));
        }
        return null;
    }

}
