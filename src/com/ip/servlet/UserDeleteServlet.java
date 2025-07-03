package com.ip.servlet;

import com.ip.dao.UsersDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/userDelete")
public class UserDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("user_id");
        if (idStr != null) {
            try {
                int userId = Integer.parseInt(idStr);
                boolean success = UsersDao.deleteById(userId);
                if (success) {
                    response.sendRedirect("userList"); // 删除成功跳转
                } else {
                    request.setAttribute("msg", "删除失败");
                    request.getRequestDispatcher("userList").forward(request, response);
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                request.setAttribute("msg", "用户 ID 非法");
                request.getRequestDispatcher("userList").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "缺少用户 ID");
            request.getRequestDispatcher("userList").forward(request, response);
        }
    }
}
