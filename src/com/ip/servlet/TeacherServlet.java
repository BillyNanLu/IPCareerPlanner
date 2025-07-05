package com.ip.servlet;

import com.ip.bean.TeacherBean;
import com.ip.dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/teachers")
public class TeacherServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TeacherDao teacherDao = new TeacherDao();
        List<TeacherBean> teacherList = teacherDao.findAll();
        request.setAttribute("teachers", teacherList);
        request.getRequestDispatcher("/teachers.jsp").forward(request, response);
    }
}