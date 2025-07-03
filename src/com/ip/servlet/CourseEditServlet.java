package com.ip.servlet;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseCategoryBean;
import com.ip.bean.TeacherBean;
import com.ip.dao.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.*;

@WebServlet("/courseEdit")
public class CourseEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // 统一转发到编辑页面
    private void forwardToEditPage(HttpServletRequest request, HttpServletResponse response, CourseBean course, String msg) throws ServletException, IOException {
        request.setAttribute("course", course);
        request.setAttribute("msg", msg);
        request.setAttribute("allCategories", CourseCategoryDao.getAllCategories());
        request.setAttribute("allTeachers", TeacherDao.findAll());

        if (course != null && course.getTeacherIds() != null) {
            request.setAttribute("teacherIdSet", new HashSet<>(course.getTeacherIds()));
        }

        request.getRequestDispatcher("course_edit.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        CourseBean course = new CourseBean(); // 空对象用于添加

        if (idStr != null && !idStr.trim().isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                course = CourseDao.getCourseById(id);
                if (course == null) {
                    request.setAttribute("msg", "未找到课程");
                    return;
                }
            } catch (NumberFormatException e) {
                request.setAttribute("msg", "ID 参数错误");
                return;
            }
        }

        forwardToEditPage(request, response, course, null);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        // 初始化课程实体
        CourseBean course = new CourseBean();

        // 课程ID
        String idStr = request.getParameter("id");
        int id = 0;
        try {
            if (idStr != null && !idStr.isEmpty()) {
                id = Integer.parseInt(idStr.trim());
                course.setId(id);
            }
        } catch (Exception e) {
            forwardToEditPage(request, response, null, "课程ID无效");
            return;
        }

        // 课程名称
        course.setName(request.getParameter("name"));

        // 分类ID
        String catStr = request.getParameter("category_id");
        if (catStr == null || catStr.isEmpty()) {
            forwardToEditPage(request, response, course, "分类不能为空");
            return;
        }
        course.setCategoryId(Integer.parseInt(catStr));

        // 标签 / 简要信息
        course.setTags(request.getParameter("tags"));
        course.setTargetUser(request.getParameter("target_user"));
        course.setRecommendation(request.getParameter("recommendation"));

        // 价格和折扣
        try {
            course.setPrice(new BigDecimal(request.getParameter("price")));
        } catch (Exception ignored) {
            course.setPrice(BigDecimal.ZERO);
        }

        try {
            course.setDiscount(new BigDecimal(request.getParameter("discount")));
        } catch (Exception ignored) {
            course.setDiscount(BigDecimal.ONE);
        }

        // 多选讲师
        String[] teacherIdsStr = request.getParameterValues("teacher_ids");
        List<Integer> teacherIds = new ArrayList<>();
        if (teacherIdsStr != null) {
            for (String tid : teacherIdsStr) {
                try {
                    teacherIds.add(Integer.parseInt(tid));
                } catch (NumberFormatException ignored) {}
            }
        }
        course.setTeacherIds(teacherIds);

        // 图片上传
        Part imagePart = request.getPart("image");
        if (imagePart != null && imagePart.getSize() > 0) {
            String filename = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
            String uploadPath = request.getServletContext().getRealPath("/image/courses");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            File file = new File(uploadDir, filename);
            imagePart.write(file.getAbsolutePath());

            course.setImage("/image/courses/" + filename);
        }

        // 插入/更新课程数据
        if (id == 0) {
            int newId = CourseDao.insertCourse(course); // insert 返回新 ID
            course.setId(newId);
            if (newId <= 0) {
                forwardToEditPage(request, response, course, "课程新增失败");
                return;
            }
        } else {
            CourseDao.updateCourse(course);
        }

        // 更新多对多关系
        CourseTeacherDao.deleteByCourseId(course.getId());
        if (!teacherIds.isEmpty()) {
            CourseTeacherDao.insertBatch(course.getId(), teacherIds);
        }

        // 更新详细表（课程图片、价格等）
        CourseMoreDao.updateByCourseId(course);

        // ✅ 保存成功，跳转列表页
        response.sendRedirect(request.getContextPath() + "/courseList");

    }
}
