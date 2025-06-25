package com.ip.servlet;

import com.ip.bean.AppointConsultBean;
import com.ip.dao.AppointConsultDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 立刻咨询
        String appoint_name = request.getParameter("appoint_name");
        String appoint_phone = request.getParameter("appoint_phone");
        String appoint_description = request.getParameter("appoint_description");

        AppointConsultDao appointConsultDao = new AppointConsultDao();
        boolean success = false;

        try {
            success = appointConsultDao.addAppointConsult(appoint_name, appoint_phone, appoint_description);
        } catch (Exception e) {
            System.err.println("咨询申请失败: " + e.getMessage());
            request.setAttribute("error", "咨询申请失败，请稍后再试");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
            return;
        }
        if (success) {
            response.sendRedirect("home.jsp?success=true");
        } else {
            request.setAttribute("error", "咨询申请失败，请仔细查看信息");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

}
