package com.ip.servlet;

import com.ip.bean.AppointInformationBean;
import com.ip.dao.AppointInformationDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet("/appoint")
public class AppointInformationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AppointInformationServlet() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 处理GET请求，可用于显示预约表单或其他操作
        request.getRequestDispatcher("/consult.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 获取表单数据
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String time = request.getParameter("time");
        String city = request.getParameter("city");
        String industry = request.getParameter("industry");
        String experience = request.getParameter("experience");
        String paidConsult = request.getParameter("paid");
        String description = request.getParameter("description");

        // 创建预约信息对象
        AppointInformationBean appointInfo = new AppointInformationBean();
        appointInfo.setName(name);
        appointInfo.setPhone(phone);
        appointInfo.setTime(time);
        appointInfo.setCity(city);
        appointInfo.setIndustry(industry);
        appointInfo.setExperience(experience);
        appointInfo.setPaidConsult(paidConsult);
        appointInfo.setDescription(description);
        appointInfo.setCreatedAt(LocalDateTime.now());

        // 调用DAO添加预约信息
        AppointInformationDao appointDao = new AppointInformationDao();
        boolean success;

        try {
            success = appointDao.addAppointInformation(appointInfo);
        } catch (Exception e) {
            System.err.println("预约申请失败: " + e.getMessage());
            request.setAttribute("error", "预约申请失败，请稍后再试");
            request.getRequestDispatcher("/consult.jsp").forward(request, response);
            return;
        }

        if (success) {
            // 重定向防止表单重复提交
            response.sendRedirect("consult.jsp?appointSuccess=true");
        } else {
            request.setAttribute("error", "预约申请失败，请仔细查看信息");
            request.getRequestDispatcher("/consult.jsp").forward(request, response);
        }
    }
}