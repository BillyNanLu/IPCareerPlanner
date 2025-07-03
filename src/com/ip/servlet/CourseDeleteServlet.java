package com.ip.servlet;

import com.ip.dao.CourseDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/courseDelete")
public class CourseDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = 0;

        try {
            if (idStr != null && !idStr.isEmpty()) {
                id = Integer.parseInt(idStr);
                boolean success = CourseDao.deleteById(id);
                System.out.println("删除课程结果: " + success);
                if (!success) {
                    request.setAttribute("msg", "删除失败，请稍后再试");
                    request.getRequestDispatcher("course_list.jsp").forward(request, response);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        response.sendRedirect(request.getContextPath() + "course_list.jsp");
    }
}
