package com.ip.servlet;

import com.ip.dao.CourseCategoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/categoryDelete")
public class CategoryDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        HttpSession session = request.getSession();
        
        if (CourseCategoryDao.hasChildren(id)) {
            session.setAttribute("msg", "该分类下仍有子分类，无法删除");
        } else if (CourseCategoryDao.isCategoryInUse(id)) {
            session.setAttribute("msg", "该分类已挂载课程，无法删除");
        } else {
            boolean success = CourseCategoryDao.deleteCategory(id);
            session.setAttribute("msg", success ? "删除成功" : "删除失败");
        }

        response.sendRedirect("category-list");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}
}
