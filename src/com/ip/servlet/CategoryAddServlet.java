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

@WebServlet("/categoryAdd")
public class CategoryAddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public CategoryAddServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int parent_id = 0;
        try {
            parent_id = Integer.parseInt(request.getParameter("parent_id"));
        } catch (Exception ignored) {}

        // 获取所有可选 type
        List<String> typeList = CourseCategoryDao.getAllTypes();

        // 获取父分类对象（若存在）
        CourseCategoryBean parent = null;
        if (parent_id > 0) {
            parent = CourseCategoryDao.findById(parent_id);
        }

        request.setAttribute("typeList", typeList);
        request.setAttribute("parent_id", parent_id);
        request.setAttribute("parent", parent);
        request.getRequestDispatcher("category_add.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int parent_id = Integer.parseInt(request.getParameter("parent_id"));
        String name = request.getParameter("name");
        String type = request.getParameter("type");

        boolean success = CourseCategoryDao.insertCategory(parent_id, name, type);
        request.getSession().setAttribute("msg", success ? "添加成功" : "添加失败");
        response.sendRedirect("categoryList");
    }
}
