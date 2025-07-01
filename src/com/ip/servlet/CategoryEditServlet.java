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

@WebServlet("/categoryEdit")
public class CategoryEditServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("id");
        if (idStr != null) {
            int id = Integer.parseInt(idStr);
            CourseCategoryBean category = CourseCategoryDao.findById(id);
            List<String> typeList = CourseCategoryDao.getAllTypes();

            if (category != null) {
                req.setAttribute("category", category);
                req.setAttribute("typeList", typeList);
                req.getRequestDispatcher("category_edit.jsp").forward(req, resp);
                return;
            }
        }
        resp.sendRedirect("categoryList");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        int parent_id = Integer.parseInt(req.getParameter("parent_id"));
        String name = req.getParameter("name");
        String type = req.getParameter("type");

        // 1. 校验是否重名（排除自己）
        if (CourseCategoryDao.isNameDuplicate(name, parent_id, id)) {
            req.setAttribute("msg", "分类名已存在，请更换");
            // 把原始数据重新设置给表单
            CourseCategoryBean category = new CourseCategoryBean();
            category.setId(id);
            category.setParentId(parent_id);
            category.setName(name);
            category.setType(type);
            req.setAttribute("category", category);

            // 获取类型下拉框
            List<String> typeList = CourseCategoryDao.getAllTypes();
            req.setAttribute("typeList", typeList);

            // 如果是子分类，也重新查父类
            if (parent_id > 0) {
                CourseCategoryBean parent = CourseCategoryDao.findById(parent_id);
                req.setAttribute("parent", parent);
            }

            req.getRequestDispatcher("category_edit.jsp").forward(req, resp);
            return;
        }

        // 2. 无重名，执行更新
        boolean success = CourseCategoryDao.updateCategory(id, name, type);
        if (success) {
            req.getSession().setAttribute("msg", "分类更新成功");
        } else {
            req.getSession().setAttribute("msg", "分类更新失败");
        }

        resp.sendRedirect("categoryList");
    }
}
