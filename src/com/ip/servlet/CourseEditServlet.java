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
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@WebServlet("/courseEdit")
public class CourseEditServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        CourseBean course = CourseDao.getCourseById(id);

        List<CourseCategoryBean> allCategories = CourseCategoryDao.getAllCategories();
        List<TeacherBean> allTeachers = TeacherDao.findAll();

        // 转换 teacherId 列表为 Set 以供 JSP 中使用 contains
        Set<Integer> teacherIdSet = new HashSet<>(course.getTeacherIds());

        request.setAttribute("course", course);
        request.setAttribute("allCategories", allCategories);
        request.setAttribute("allTeachers", allTeachers);
        request.setAttribute("teacherIdSet", teacherIdSet);

        request.getRequestDispatcher("course_edit.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1. 设置编码
        request.setCharacterEncoding("UTF-8");

        // 2. 获取表单数据
        //int id = Integer.parseInt(request.getParameter("id"));
        String idStr = request.getParameter("id");
        int id = 0;
        try {
            if (idStr != null && !idStr.trim().isEmpty()) {
                id = Integer.parseInt(idStr.trim());
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("msg", "课程 ID 参数有误！");
            request.getRequestDispatcher("courseList").forward(request, response);
            return;
        }

        String name = request.getParameter("name");

        //int categoryId = Integer.parseInt(request.getParameter("category_id"));
        String catStr = request.getParameter("category_id");
        int categoryId = 0;
        if (catStr != null && !catStr.isEmpty()) {
            categoryId = Integer.parseInt(catStr);
        } else {
            // 你可以选择报错、跳转回去、或给默认值
            request.setAttribute("msg", "分类不能为空");
            request.getRequestDispatcher("courseList").forward(request, response);
            return;
        }

        String tags = request.getParameter("tags");
        String targetUser = request.getParameter("target_user");
        String recommendation = request.getParameter("recommendation");
        double price = 0;
        double discount = 1;

        try {
            price = Double.parseDouble(request.getParameter("price"));
        } catch (Exception e) {}

        try {
            discount = Double.parseDouble(request.getParameter("discount"));
        } catch (Exception e) {}

        // 3. 处理讲师多选参数
        String[] teacherIdsStr = request.getParameterValues("teacher_ids");
        List<Integer> teacherIds = new ArrayList<>();
        if (teacherIdsStr != null) {
            for (String tid : teacherIdsStr) {
                try {
                    teacherIds.add(Integer.parseInt(tid));
                } catch (NumberFormatException ignored) {}
            }
        }

        // 4. 处理封面图片上传
        Part imagePart = request.getPart("image");
        String imagePath = null;
        if (imagePart != null && imagePart.getSize() > 0) {
            String filename = System.currentTimeMillis() + "_" + imagePart.getSubmittedFileName();
            // 注意：这里路径请根据你的项目结构调整
            String uploadPath = request.getServletContext().getRealPath("/image/courses");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }
            File file = new File(uploadDir, filename);
            imagePart.write(file.getAbsolutePath());
            imagePath = "/image/courses/" + filename;
        }

        // 5. 构造 CourseBean，更新数据
        CourseBean course = new CourseBean();
        course.setId(id);
        course.setName(name);
        course.setCategoryId(categoryId);
        course.setTags(tags);
        course.setTargetUser(targetUser);
        course.setRecommendation(recommendation);

        // 课程详细表 (CourseMore)
        course.setPrice(new BigDecimal(price));
        course.setDiscount(new BigDecimal(discount));

        // 如果上传了图片，覆盖旧图
        if (imagePath != null) {
            course.setImage(imagePath);
        } else {
            // 不上传图片时，保持原图
            // 你可以自行设计 Dao 层默认不改 image 字段或传旧图路径
        }

        // 6. 调用 Dao 更新课程信息
        CourseDao.updateCourse(course);

        // 7. 先删除旧讲师关联，后插入新讲师关联（多对多）
        CourseTeacherDao.deleteByCourseId(id);
        if (!teacherIds.isEmpty()) {
            CourseTeacherDao.insertBatch(id, teacherIds);
        }

        // 8. 更新课程详细表（图片、价格、折扣）
        CourseMoreDao.updateByCourseId(course);

        // 9. 重定向回课程列表页
        response.sendRedirect(request.getContextPath() + "/courseList");

    }
}
