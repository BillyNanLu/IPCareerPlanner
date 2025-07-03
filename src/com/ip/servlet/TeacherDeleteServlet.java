package com.ip.servlet;

import com.ip.dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/teacherDelete")
public class TeacherDeleteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            boolean success = TeacherDao.deleteTeacherById(id);
            if (success) {
                response.sendRedirect("teacherList");
            } else {
                request.setAttribute("msg", "删除失败");
                request.getRequestDispatcher("teacherList").forward(request, response);
            }
        } else {
            response.sendRedirect("teacherList");
        }
    }
}
