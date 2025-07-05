package com.ip.servlet;

import com.ip.bean.AiChatMessageBean;
import com.ip.dao.AiChatDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/aiChatList")
public class AIChatListServlet extends HttpServlet {
    private static final int PAGE_SIZE = 10;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keyword = request.getParameter("keyword");
        String role = request.getParameter("role");
        String pageStr = request.getParameter("page");

        int page = 1;
        try {
            if (pageStr != null) page = Integer.parseInt(pageStr);
        } catch (Exception e) {
            page = 1;
        }

        int offset = (page - 1) * PAGE_SIZE;

        List<AiChatMessageBean> chatList = AiChatDao.findChats(keyword, role, offset, PAGE_SIZE);
        int totalCount = AiChatDao.countChats(keyword, role);
        int totalPage = (int) Math.ceil(totalCount / (double) PAGE_SIZE);

        request.setAttribute("chatList", chatList);
        request.setAttribute("totalCount", totalCount);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("keyword", keyword);
        request.setAttribute("role", role);

        request.getRequestDispatcher("ai_chat_list.jsp").forward(request, response);
    }
}
