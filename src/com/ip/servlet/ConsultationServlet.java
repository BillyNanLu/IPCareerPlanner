package com.ip.servlet;

import com.ip.bean.AppointConsultBean;
import com.ip.dao.AppointConsultDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/consultationList")
public class ConsultationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 关键字查询
        String keyword = request.getParameter("keyword");
        // 分页
        int page = 1;
        int pageSize = 10;
        try {
            page = Integer.parseInt(request.getParameter("page"));
            if (page <= 0) page = 1;
        } catch (Exception ignored) {}
        int totalCount = AppointConsultDao.countConsults(keyword);
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);
        List<AppointConsultBean> consultList = AppointConsultDao.getConsultsByPage(keyword, page, pageSize);

        if (keyword != null && !keyword.trim().isEmpty()) {
            consultList = AppointConsultDao.searchConsults(keyword.trim());
            request.setAttribute("keyword", keyword.trim());
        } else {
            consultList = AppointConsultDao.getAllConsults();
        }

        request.setAttribute("consultList", consultList);
        request.setAttribute("page", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("keyword", keyword);
        request.getRequestDispatcher("consultation_list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam != null) {
            try {
                int id = Integer.parseInt(idParam);
                AppointConsultDao.deleteConsultById(id);
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }
        }
        response.sendRedirect(request.getContextPath() + "consultationList");
    }
}
