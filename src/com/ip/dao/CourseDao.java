package com.ip.dao;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseMoreBean;
import com.ip.bean.CourseViewBean;
import com.ip.util.DBUtil;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

public class CourseDao {
    public List<CourseBean> findAll() {
        List<CourseBean> list = new ArrayList<>();
        String sql = "SELECT * FROM course";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CourseBean course = new CourseBean();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setIntro(rs.getString("intro"));
                course.setTags(rs.getString("tags"));
                list.add(course);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<CourseBean> findByCategoryId(int id) {
        List<CourseBean> list = new ArrayList<>();
        String sql = "SELECT * FROM course WHERE category_id = ?";

        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseBean course = new CourseBean();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setIntro(rs.getString("intro"));
                course.setTags(rs.getString("tags"));
                list.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public CourseBean findByIdSingle(int id) {
        CourseBean course = null;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM course WHERE id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course = new CourseBean();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setCategoryId(rs.getInt("category_id"));
                course.setTags(rs.getString("tags"));
                course.setIntro(rs.getString("intro"));
                course.setTargetUser(rs.getString("target_user"));
                course.setRecommendation(rs.getString("recommendation"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return course;
    }

    public CourseMoreBean findByIdMore(int id) {
        CourseMoreBean course = null;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM course_more WHERE course_id = ?")) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                course = new CourseMoreBean();
                course.setId(rs.getInt("id"));
                course.setImage(rs.getString("image"));
                course.setPrice(rs.getDouble("price"));
                course.setDiscount(rs.getDouble("discount"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return course;
    }

    // 为报名成功页提供课程主信息
    public CourseBean findById(int id) {
        return findByIdSingle(id);
    }

    // 为报名成功页提供课程图片和价格
    public CourseMoreBean findMoreById(int courseId) {
        return findByIdMore(courseId);
    }


    public static List<CourseViewBean> getAllCoursesView() {
        List<CourseViewBean> list = new ArrayList<>();

        String sql = "SELECT c.id, c.name, c.tags, c.category_id, c.created_at, " +
                "cm.image, cm.price, cm.discount, cc.name AS category_name, cc.parent_id " +
                "FROM course c " +
                "JOIN course_category cc ON c.category_id = cc.id " +
                "LEFT JOIN course_more cm ON c.id = cm.course_id";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                CourseViewBean bean = new CourseViewBean();
                int courseId = rs.getInt("id");

                bean.setId(courseId);
                bean.setName(rs.getString("name"));
                bean.setTags(rs.getString("tags"));
                bean.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
                bean.setImage(Optional.ofNullable(rs.getString("image"))
                        .orElse("/image/courses/coursedefault.png"));
                bean.setPrice(rs.getBigDecimal("price"));
                bean.setDiscount(rs.getBigDecimal("discount"));

                // 分类全路径：递归构造（如 “IP个体 / 校园版 / 通用能力提升”）
                int categoryId = rs.getInt("category_id");
                bean.setFullCategoryPath(getCategoryPath(categoryId));

                // 获取教师列表
                bean.setTeachers(getTeacherNamesByCourseId(courseId));

                list.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static String getCategoryPath(int categoryId) {
        List<String> path = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection()) {
            while (categoryId > 0) {
                String sql = "SELECT id, parent_id, name FROM course_category WHERE id = ?";
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    stmt.setInt(1, categoryId);
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        path.add(0, rs.getString("name"));
                        categoryId = rs.getInt("parent_id");
                    } else {
                        break;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return String.join(" / ", path);
    }


    public static List<String> getTeacherNamesByCourseId(int courseId) {
        List<String> names = new ArrayList<>();
        String sql = "SELECT t.name FROM teacher t " +
                "JOIN course_teacher ct ON t.id = ct.teacher_id " +
                "WHERE ct.course_id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                names.add(rs.getString("name"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return names;
    }

    public static CourseBean getCourseById(int id) {
        CourseBean bean = null;

        String courseSql = "SELECT * FROM course WHERE id = ?";
        String moreSql = "SELECT * FROM course_more WHERE course_id = ?";
        String teacherSql = "SELECT teacher_id FROM course_teacher WHERE course_id = ?";

        try (Connection conn = DBUtil.getConnection()) {

            // 查询 course 表
            try (PreparedStatement ps = conn.prepareStatement(courseSql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    bean = new CourseBean();
                    bean.setId(rs.getInt("id"));
                    bean.setCategoryId(rs.getInt("category_id"));
                    bean.setName(rs.getString("name"));
                    bean.setTags(rs.getString("tags"));
                    bean.setIntro(rs.getString("intro"));
                    bean.setTargetUser(rs.getString("target_user"));
                    bean.setRecommendation(rs.getString("recommendation"));
                }
                rs.close();
            }

            if (bean == null) {
                return null; // 没有找到课程
            }

            // 查询 course_more 表
            try (PreparedStatement ps = conn.prepareStatement(moreSql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    bean.setImage(
                            rs.getString("image") != null ? rs.getString("image") : "/image/courses/coursedefault.png"
                    );
                    bean.setPrice(rs.getBigDecimal("price"));
                    bean.setDiscount(rs.getBigDecimal("discount"));
                } else {
                    // 没有对应的 course_more 数据，设默认
                    bean.setImage("/image/courses/coursedefault.png");
                    bean.setPrice(new BigDecimal("0.00"));
                    bean.setDiscount(new BigDecimal("1.0"));
                }
                rs.close();
            }

            // 查询 course_teacher 表
            try (PreparedStatement ps = conn.prepareStatement(teacherSql)) {
                ps.setInt(1, id);
                ResultSet rs = ps.executeQuery();
                List<Integer> teacherIds = new ArrayList<>();
                while (rs.next()) {
                    teacherIds.add(rs.getInt("teacher_id"));
                }
                bean.setTeacherIds(teacherIds);
                rs.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return bean;
    }

    private static String getFullCategoryPath(int categoryId, Connection conn) throws SQLException {
        List<String> parts = new ArrayList<>();

        while (categoryId != 0) {
            String sql = "SELECT name, parent_id FROM course_category WHERE id = ?";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setInt(1, categoryId);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    parts.add(rs.getString("name"));
                    categoryId = rs.getInt("parent_id");
                } else {
                    break;
                }
            }
        }

        Collections.reverse(parts);
        return String.join(" / ", parts); // ➜ IP个体 / 校园版 / 通用能力提升
    }


    private static List<String> getTeachersByCourseId(int courseId, Connection conn) throws SQLException {
        List<String> teachers = new ArrayList<>();

        String sql = "SELECT t.name FROM teacher t " +
                "JOIN course_teacher ct ON t.id = ct.teacher_id " +
                "WHERE ct.course_id = ?";

        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                teachers.add(rs.getString("name"));
            }
        }

        return teachers;
    }


    public static boolean updateCourse(CourseBean course) {
        String sqlWithImage = "UPDATE course SET category_id=?, name=?, tags=?, target_user=?, recommendation=?, updated_at=NOW(), image=? WHERE id=?";
        String sqlWithoutImage = "UPDATE course SET category_id=?, name=?, tags=?, target_user=?, recommendation=?, updated_at=NOW() WHERE id=?";

        try (Connection conn = DBUtil.getConnection()) {
            PreparedStatement ps;
            if (course.getImage() != null && !course.getImage().isEmpty()) {
                ps = conn.prepareStatement(sqlWithImage);
                ps.setInt(1, course.getCategoryId());
                ps.setString(2, course.getName());
                ps.setString(3, course.getTags());
                ps.setString(4, course.getTargetUser());
                ps.setString(5, course.getRecommendation());
                ps.setString(6, course.getImage());
                ps.setInt(7, course.getId());
            } else {
                ps = conn.prepareStatement(sqlWithoutImage);
                ps.setInt(1, course.getCategoryId());
                ps.setString(2, course.getName());
                ps.setString(3, course.getTags());
                ps.setString(4, course.getTargetUser());
                ps.setString(5, course.getRecommendation());
                ps.setInt(6, course.getId());
            }
            int affected = ps.executeUpdate();
            ps.close();
            return affected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }



}
