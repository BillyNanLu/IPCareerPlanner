package com.ip.servlet;

import com.ip.bean.CourseOrderViewBean;
import com.ip.bean.EnrolledCourseBean;
import com.ip.bean.UsersBean;
import com.ip.dao.AiChatDao;
import com.ip.dao.AppointConsultDao;
import com.ip.dao.CareerAppointmentDao;
import com.ip.dao.CourseOrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/myProfile")
public class MyProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        UsersBean loginUser = (UsersBean) req.getSession().getAttribute("loginUser");
        if (loginUser == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        int userId = loginUser.getUser_id();
        String phone = loginUser.getPhone();
        int courseCount = CourseOrderDao.countByUserId(userId);
        int careerCount = CareerAppointmentDao.countByPhone(phone);
        int consultCount = AppointConsultDao.countByPhone(phone);

        int chatCount = AiChatDao.countByUserId(userId);  // 你应该已经获取了 userId

        req.setAttribute("courseCount", courseCount);
        req.setAttribute("careerCount", careerCount);
        req.setAttribute("consultCount", consultCount);
        req.setAttribute("chatCount", chatCount);

        // 查询报名课程信息
        List<EnrolledCourseBean> enrolledCourses = CourseOrderDao.getCoursesByUserId(userId);
        req.setAttribute("enrolledCourses", enrolledCourses);

        req.getRequestDispatcher("my_profile.jsp").forward(req, resp);
    }
}
