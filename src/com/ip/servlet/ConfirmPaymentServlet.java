package com.ip.servlet;

import com.ip.dao.CourseOrderDao;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/confirmPayment")
public class ConfirmPaymentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        String orderNo = request.getParameter("orderNo");
        String method = request.getParameter("method");

        if (orderNo != null && method != null) {
            CourseOrderDao dao = new CourseOrderDao();
            dao.confirmPayment(orderNo, method);
            response.setStatus(HttpServletResponse.SC_OK);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "参数缺失");
        }
    }
}
