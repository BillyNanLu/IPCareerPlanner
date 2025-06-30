package com.ip.servlet;

import com.ip.bean.CourseBean;
import com.ip.bean.TeacherBean;
import com.ip.dao.AppointConsultDao;
import com.ip.dao.CourseCategoryDao;
import com.ip.dao.CourseDao;
import com.ip.dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public HomeServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 加载核心课程
        CourseDao courseDao = new CourseDao();
        CourseCategoryDao categoryDao = new CourseCategoryDao();
        int plannerId = categoryDao.findIdByName("生涯规划师");
        List<CourseBean> plannerCourses = courseDao.findByCategoryId(plannerId);

        // 加载核心老师
        TeacherDao teacherDao = new TeacherDao();
        String department = "生涯规划学院";
        List<TeacherBean> departmentTeachers = teacherDao.findByDepartment(department);

        request.setAttribute("plannerCourses", plannerCourses);
        request.setAttribute("departmentTeachers", departmentTeachers);
        request.getRequestDispatcher("/home.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 立刻咨询表单数据
        String appoint_name = request.getParameter("appoint_name");
        String appoint_phone = request.getParameter("appoint_phone");
        String appoint_description = request.getParameter("appoint_description");

        AppointConsultDao appointConsultDao = new AppointConsultDao();
        boolean success;

        try {
            success = appointConsultDao.addAppointConsult(appoint_name, appoint_phone, appoint_description);
        } catch (Exception e) {
            System.err.println("咨询申请失败: " + e.getMessage());
            request.setAttribute("error", "咨询申请失败，请稍后再试");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
            return;
        }

        if (success) {
            // 建议使用重定向防止表单重复提交
            response.sendRedirect("home.jsp?success=true");
        } else {
            request.setAttribute("error", "咨询申请失败，请仔细查看信息");
            request.getRequestDispatcher("/home.jsp").forward(request, response);
        }

    }

}
