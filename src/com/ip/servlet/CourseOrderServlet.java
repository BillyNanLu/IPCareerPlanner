package com.ip.servlet;

import com.ip.bean.CourseOrderBean;
import com.ip.dao.CourseOrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/courseOrders")
public class CourseOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String status = request.getParameter("status");

        int page = 1;
        int pageSize = 10;
        try {
            String pageStr = request.getParameter("page");
            if (pageStr != null) {
                page = Integer.parseInt(pageStr);
                if (page <= 0) page = 1;
            }
        } catch (Exception ignored) {}

        int totalCount = CourseOrderDao.countOrders(keyword, status);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        List<CourseOrderBean> orderList = CourseOrderDao.getOrdersByPage(keyword, status, page, pageSize);

        request.setAttribute("orderList", orderList);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("keyword", keyword != null ? keyword : "");
        request.setAttribute("status", status != null ? status : "");

        request.getRequestDispatcher("course_orders.jsp").forward(request, response);
    }

}
