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

@WebServlet("/teacherList")
public class TeacherListServlet extends HttpServlet {
    private static final int PAGE_SIZE = 10;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        if (keyword == null) keyword = "";

        int page = 1;
        try {
            page = Integer.parseInt(request.getParameter("page"));
        } catch (Exception ignored) {}

        int total = TeacherDao.getTeacherCount(keyword);
        int totalPages = (int) Math.ceil(total * 1.0 / PAGE_SIZE);
        int offset = (page - 1) * PAGE_SIZE;

        List<TeacherBean> teacherList = TeacherDao.getTeachers(keyword, offset, PAGE_SIZE);

        request.setAttribute("teacherList", teacherList);
        request.setAttribute("keyword", keyword);
        request.setAttribute("page", page);
        request.setAttribute("total", total);
        request.setAttribute("totalPages", totalPages);
        request.getRequestDispatcher("teacher_list.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
