package com.ip.servlet;

import com.ip.bean.UsersBean;
import com.ip.dao.AdminDashboardDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public AdminDashboardServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UsersBean loginUser = (UsersBean) request.getSession().getAttribute("loginUser");
        if (loginUser == null || (loginUser.getRole_id() != 1 && loginUser.getRole_id() != 2)) {
            response.sendRedirect(request.getContextPath() + "login.jsp");
            return;
        }

        int totalUsers = AdminDashboardDao.countTotalUsers();
        int totalAdmins = AdminDashboardDao.countTotalAdmins();
        int activeUsers = AdminDashboardDao.countActiveUsers();
        int todayLogins = AdminDashboardDao.countTodayLogins();
        List<Map<String, String>> recentAdmins = AdminDashboardDao.getRecentAdmins();
        List<Map<String, String>> recentUsers = AdminDashboardDao.getRecentUsers();

        request.setAttribute("loginUser", loginUser);
        request.setAttribute("totalAdmins", totalAdmins);
        request.setAttribute("totalUsers", totalUsers);
        request.setAttribute("activeUsers", activeUsers);
        request.setAttribute("todayLogins", todayLogins);
        request.setAttribute("recentAdmins", recentAdmins);
        request.setAttribute("recentUsers", recentUsers);

        request.getRequestDispatcher("/admin.jsp").forward(request, response);
    }
}
