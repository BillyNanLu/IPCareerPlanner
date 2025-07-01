package com.ip.servlet;

import com.ip.bean.CourseBean;
import com.ip.dao.CourseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/courseView")
public class CourseViewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        CourseBean course = CourseDao.getCourseById(id);
        request.setAttribute("course", course);
        request.getRequestDispatcher("course_view.jsp").forward(request, response);
    }
}
