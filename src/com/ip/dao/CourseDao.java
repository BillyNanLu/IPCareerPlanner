package com.ip.dao;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseMoreBean;
import com.ip.bean.CourseViewBean;
import com.ip.util.DBUtil;

import java.math.BigDecimal;
import java.sql.*;
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
                    bean.setCreateTime(rs.getTimestamp("created_at").toLocalDateTime());
                    bean.setUpdateTime(rs.getTimestamp("updated_at").toLocalDateTime());
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


    public static boolean deleteById(int id) {
        String sql = "DELETE FROM course WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            int affected = ps.executeUpdate();
            return affected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static int insert(CourseBean course) {
        String sql = "INSERT INTO course (category_id, name, tags, intro, target_user, recommendation) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setInt(1, course.getCategoryId());
            ps.setString(2, course.getName());
            ps.setString(3, course.getTags());
            ps.setString(4, course.getIntro());
            ps.setString(5, course.getTargetUser());
            ps.setString(6, course.getRecommendation());

            int affected = ps.executeUpdate();
            if (affected == 1) {
                ResultSet rs = ps.getGeneratedKeys();
                if (rs.next()) {
                    int newId = rs.getInt(1);

                    // 插入 course_more
                    insertCourseMore(newId, course);
                    return newId;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private static void insertCourseMore(int courseId, CourseBean course) throws SQLException {
        String sql = "INSERT INTO course_more (course_id, image, price, discount) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ps.setString(2, course.getImage());
            ps.setBigDecimal(3, course.getPrice());
            ps.setBigDecimal(4, course.getDiscount());
            ps.executeUpdate();
        }
    }

    public static int insertCourse(CourseBean course) {
        String sql = "INSERT INTO course (name, category_id, tags, target_user, recommendation, image) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            ps.setString(1, course.getName());
            ps.setInt(2, course.getCategoryId());
            ps.setString(3, course.getTags());
            ps.setString(4, course.getTargetUser());
            ps.setString(5, course.getRecommendation());
            ps.setString(6, course.getImage()); // 允许为 null

            int affectedRows = ps.executeUpdate();

            if (affectedRows == 0) {
                return 0; // 插入失败
            }

            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) {
                    return rs.getInt(1); // 返回插入的自增ID
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }


    public static List<CourseBean> getCourses(int offset, int limit, String keyword) {
        List<CourseBean> list = new ArrayList<>();
        String sql = "SELECT c.*, cat.name AS category_name, m.price, m.discount FROM course c " +
                "LEFT JOIN course_category cat ON c.category_id = cat.id " +
                "LEFT JOIN course_more m ON c.id = m.course_id " +
                "WHERE c.name LIKE ? OR c.tags LIKE ? OR c.recommendation LIKE ? " +
                "ORDER BY c.id DESC LIMIT ?, ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword + "%";
            ps.setString(1, kw);
            ps.setString(2, kw);
            ps.setString(3, kw);
            ps.setInt(4, offset);
            ps.setInt(5, limit);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseBean course = new CourseBean();
                course.setId(rs.getInt("id"));
                course.setName(rs.getString("name"));
                course.setCategoryId(rs.getInt("category_id"));
                course.setTags(rs.getString("tags"));
                course.setRecommendation(rs.getString("recommendation"));
                course.setCategoryName(rs.getString("category_name"));
                course.setPrice(rs.getBigDecimal("price"));
                course.setDiscount(rs.getBigDecimal("discount"));
                list.add(course);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<CourseViewBean> getCourses(String keyword, int offset, int limit) {
        List<CourseViewBean> list = new ArrayList<>();
        String sql = "SELECT c.id, c.name, c.tags, c.category_id, cc.name AS category_name, " +
                "cm.image, cm.price, cm.discount " +
                "FROM course c " +
                "LEFT JOIN course_more cm ON c.id = cm.course_id " +
                "LEFT JOIN course_category cc ON c.category_id = cc.id " +
                "WHERE c.name LIKE ? OR c.tags LIKE ? OR c.recommendation LIKE ? " +
                "ORDER BY c.id DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String like = "%" + keyword + "%";
            ps.setString(1, like);
            ps.setString(2, like);
            ps.setString(3, like);
            ps.setInt(4, limit);
            ps.setInt(5, offset);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseViewBean bean = new CourseViewBean();
                bean.setId(rs.getInt("id"));
                bean.setName(rs.getString("name"));
                bean.setTags(rs.getString("tags"));
                bean.setCategoryId(rs.getInt("category_id"));
                bean.setCategoryName(rs.getString("category_name"));
                bean.setImage(Optional.ofNullable(rs.getString("image"))
                        .orElse("/image/courses/coursedefault.png"));
                bean.setPrice(rs.getBigDecimal("price"));
                bean.setDiscount(rs.getBigDecimal("discount"));
                bean.setTeachers(CourseTeacherDao.getTeacherNamesByCourseId(rs.getInt("id")));
                list.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }



    public static int countCourses(String keyword) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM course WHERE name LIKE ? OR tags LIKE ? OR recommendation LIKE ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword + "%";
            ps.setString(1, kw);
            ps.setString(2, kw);
            ps.setString(3, kw);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


}
