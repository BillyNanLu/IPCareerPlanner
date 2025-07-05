package com.ip.servlet;

import com.ip.bean.TeacherBean;
import com.ip.dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/teacherDetail")
public class TeacherDetailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("teachers");
            return;
        }

        try {
            int teacherId = Integer.parseInt(idParam);
            TeacherDao teacherDao = new TeacherDao();
            TeacherBean teacher = teacherDao.findById(teacherId);

            if (teacher == null) {
                response.sendRedirect("teachers");
                return;
            }

            request.setAttribute("teacher", teacher);
            request.getRequestDispatcher("/teacherDetail.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("teachers");
        }
    }
}