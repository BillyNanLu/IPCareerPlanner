package com.ip.servlet;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseCategoryBean;
import com.ip.dao.CourseCategoryDao;
import com.ip.dao.CourseDao;
import com.ip.service.CourseService;
import jdk.jfr.Category;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/courses")
public class CourseServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final CourseService courseService = new CourseService();

    public CourseServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        CourseDao courseDao = new CourseDao();
        CourseCategoryDao categoryDao = new CourseCategoryDao();

        int plannerId = 0;
        String plannerName = "生涯规划师";
        plannerId = categoryDao.findIdByName(plannerName);

        List<CourseBean> courseList = courseDao.findAll();
        List<CourseBean> plannerCourses = courseDao.findByCategoryId(plannerId);

        // 搜索框
        String keyword = req.getParameter("keyword");
        List<CourseBean> filteredList = new ArrayList<>();
        if (keyword != null && !keyword.trim().isEmpty()) {
            String[] keywords = keyword.trim().toLowerCase().split("\\s+");

            for (CourseBean course : courseList) {
                boolean matchesAny = false;

                for (String kw : keywords) {
                    if ((course.getName() != null && course.getName().toLowerCase().contains(kw)) ||
                            (course.getIntro() != null && course.getIntro().toLowerCase().contains(kw)) ||
                            (course.getTags() != null && course.getTags().toLowerCase().contains(kw))) {
                        matchesAny = true;
                        break;
                    }
                }

                if (matchesAny) {
                    filteredList.add(course);
                }
            }

            // 设置搜索结果和关键词回显
            req.setAttribute("searchResult", filteredList);
            req.setAttribute("searchKeyword", keyword);
        } else {
            // 如果未搜索，也设置空列表，防止 JSP 报错
            req.setAttribute("searchResult", new ArrayList<CourseBean>());
        }


        // 加载校园版（id = 3）所有三级分类课程
        Map<CourseCategoryBean, List<CourseBean>> campusCourses =
                courseService.getCoursesGroupedBySubCategory(3);

        // 加载职场版（id = 4）所有三级分类课程
        Map<CourseCategoryBean, List<CourseBean>> careerCourses =
                courseService.getCoursesGroupedBySubCategory(4);

        req.setAttribute("campusCourses", campusCourses);
        req.setAttribute("careerCourses", careerCourses);

        req.setAttribute("courseList", courseList);
        req.setAttribute("plannerCourses", plannerCourses);

        req.getRequestDispatcher("/course.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }

}
