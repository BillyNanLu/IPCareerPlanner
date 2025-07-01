package com.ip.servlet;

import com.ip.bean.CourseCategoryBean;
import com.ip.dao.CourseCategoryDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/categoryList")
public class CategoryListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<CourseCategoryBean> topCategories = CourseCategoryDao.getFullCategoryTree();
        request.setAttribute("topCategories", topCategories);
        request.getRequestDispatcher("category_list.jsp").forward(request, response);
    }
}
