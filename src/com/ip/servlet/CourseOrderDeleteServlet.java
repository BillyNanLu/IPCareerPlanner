package com.ip.servlet;

import com.ip.dao.CourseOrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/courseOrdersDelete")
public class CourseOrderDeleteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {}

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        if (idStr != null) {
            try {
                int id = Integer.parseInt(idStr);
                boolean success = CourseOrderDao.deleteOrderById(id);
                if (success) {
                    request.getSession().setAttribute("msg", "订单删除成功");
                } else {
                    request.getSession().setAttribute("msg", "订单删除失败");
                }
            } catch (NumberFormatException e) {
                request.getSession().setAttribute("msg", "参数错误");
            }
        } else {
            request.getSession().setAttribute("msg", "参数缺失");
        }
        response.sendRedirect(request.getContextPath() + "courseOrders");
    }
}
