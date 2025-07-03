package com.ip.servlet;

import com.ip.bean.CourseViewBean;
import com.ip.dao.CourseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/courseList")
public class CourseListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public CourseListServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CourseViewBean> courseList = CourseDao.getAllCoursesView();
        request.setAttribute("courseList", courseList);
        request.getRequestDispatcher("course_list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        request.setCharacterEncoding("UTF-8");
    }
}
