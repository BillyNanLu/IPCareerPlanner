package com.ip.servlet;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseMoreBean;
import com.ip.bean.UsersBean;
import com.ip.dao.CourseDao;
import com.ip.dao.CourseOrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Random;

@WebServlet("/enroll")
public class EnrollServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        UsersBean user = (UsersBean) session.getAttribute("loginUser");

        String courseIdStr = request.getParameter("courseId");
        if (courseIdStr == null) {
            response.sendRedirect("courses");
            return;
        }
        int courseId = Integer.parseInt(courseIdStr);

        if (user == null) {
            session.setAttribute("redirectAfterLogin", "enroll?courseId=" + courseId);
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = user.getUser_id();
        CourseOrderDao orderDao = new CourseOrderDao();

        if (orderDao.hasEnrolled(courseId, userId)) {
            String msg = java.net.URLEncoder.encode("您已报名该课程，无需重复报名", "UTF-8");
            request.getRequestDispatcher("courseDetail?id=" + courseId + "&msg=" + msg).forward(request, response);
            return;
        }

        String orderNo = generateOrderNo();
        orderDao.insertOrder(orderNo, courseId, userId);

        // 加载课程详情展示
        CourseDao courseDao = new CourseDao();
        CourseBean course = courseDao.findById(courseId);
        CourseMoreBean courseMore = courseDao.findMoreById(courseId);

        request.setAttribute("orderNo", orderNo);
        request.setAttribute("course", course);
        request.setAttribute("courseMore", courseMore);
        request.getRequestDispatcher("courseSuccess.jsp").forward(request, response);
    }

    private String generateOrderNo() {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        String nowStr = LocalDateTime.now().format(dtf);
        int randomNum = new Random().nextInt(9000) + 1000;
        return "CO" + nowStr + randomNum;
    }
}
