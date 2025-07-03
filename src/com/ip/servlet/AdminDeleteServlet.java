package com.ip.servlet;

import com.ip.bean.UsersBean;
import com.ip.dao.UsersDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/adminDelete")
public class AdminDeleteServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 被删除者 ID
        String idStr = request.getParameter("user_id");
        if (idStr == null || idStr.isEmpty()) {
            request.setAttribute("msg", "未指定要删除的管理员");
            request.getRequestDispatcher("adminList").forward(request, response);
            return;
        }
        int targetId = Integer.parseInt(idStr);

        // 当前登录用户 ID（假设已保存到 session）
        UsersBean currentUser = (UsersBean) request.getSession().getAttribute("loginUser");
        if (currentUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // 不允许删除自己
        if (currentUser.getUser_id() == targetId) {
            request.setAttribute("msg", "不能删除自己！");
            request.getRequestDispatcher("adminList").forward(request, response);
            return;
        }

        // 查询目标用户角色
        UsersBean targetUser = UsersDao.getUserById(targetId);
        if (targetUser == null || (targetUser.getRole_id() != 1 && targetUser.getRole_id() != 2)) {
            request.setAttribute("msg", "无效的管理员 ID");
            request.getRequestDispatcher("adminList").forward(request, response);
            return;
        }

        // 权限限制：普通管理员不能删超级管理员
        if (currentUser.getRole_id() == 2 && targetUser.getRole_id() == 1) {
            request.setAttribute("msg", "您没有权限删除超级管理员！");
            request.getRequestDispatcher("adminList").forward(request, response);
            return;
        }

        // 执行删除
        boolean deleted = UsersDao.deleteById(targetId);
        if (deleted) {
            response.sendRedirect("adminList");
        } else {
            request.setAttribute("msg", "删除失败！");
            request.getRequestDispatcher("adminList").forward(request, response);
        }

    }
}
