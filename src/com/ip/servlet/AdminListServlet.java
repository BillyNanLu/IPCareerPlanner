package com.ip.servlet;

import com.ip.bean.UsersBean;
import com.ip.dao.UsersDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/adminList")
public class AdminListServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        List<UsersBean> superAdmins;
        List<UsersBean> normalAdmins;

        if (keyword != null && !keyword.trim().isEmpty()) {
            keyword = keyword.trim();
            superAdmins = UsersDao.findAdminsByRoleAndKeyword(1, keyword);
            normalAdmins = UsersDao.findAdminsByRoleAndKeyword(2, keyword);
        } else {
            superAdmins = UsersDao.findByRoleId(1);
            normalAdmins = UsersDao.findByRoleId(2);
        }

        request.setAttribute("keyword", keyword);
        request.setAttribute("superAdmins", superAdmins);
        request.setAttribute("normalAdmins", normalAdmins);
        request.getRequestDispatcher("admin_list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
