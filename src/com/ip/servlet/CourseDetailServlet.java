package com.ip.servlet;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseMoreBean;
import com.ip.bean.TeacherBean;
import com.ip.dao.CourseDao;
import com.ip.dao.TeacherDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/courseDetail")
public class CourseDetailServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public CourseDetailServlet() {}

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect("courses");
            return;
        }

        try {
            int courseId = Integer.parseInt(idParam);

            CourseDao courseDao = new CourseDao();
            CourseBean course = courseDao.findByIdSingle(courseId);
            CourseMoreBean courseMore = courseDao.findByIdMore(courseId);
            if (course == null && courseMore == null) {
                response.sendRedirect("courses");
                return;
            }

            TeacherDao teacherDao = new TeacherDao();
            List<TeacherBean> teacherList = teacherDao.findByCourseId(courseId);

            // 即使 teacher 为空，也可以只在 JSP 判断是否展示老师信息
            request.setAttribute("course", course);
            request.setAttribute("courseMore", courseMore);
            request.setAttribute("teachers", teacherList);
            request.getRequestDispatcher("/courseDetail.jsp").forward(request, response);

        } catch (NumberFormatException e) {
            response.sendRedirect("courses");
        }

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

}
