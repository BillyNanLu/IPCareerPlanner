package com.ip.dao;

import com.ip.bean.CourseBean;
import com.ip.bean.TeacherBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class TeacherDao {

    public static List<TeacherBean> findAll() {
        List<TeacherBean> teacherList = new ArrayList<>();
        String sql = "SELECT * FROM teacher";

        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TeacherBean teacher = new TeacherBean();
                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setTitle(rs.getString("title"));
                teacher.setDepartment(rs.getString("department"));
                teacher.setExpertise(rs.getString("expertise"));
                teacher.setProfile(rs.getString("profile"));
                teacher.setImgage(rs.getString("imgage"));
                teacherList.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return teacherList;
    }

    public List<TeacherBean> findByCourseId(int courseId) {
        List<TeacherBean> teacherList = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM teacher " +
                             "JOIN course_teacher ct ON teacher.id = ct.teacher_id " +
                             "WHERE ct.course_id = ?")) {

            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                TeacherBean teacher = new TeacherBean();
                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setTitle(rs.getString("title"));
                teacher.setDepartment(rs.getString("department"));
                teacher.setExpertise(rs.getString("expertise"));
                teacher.setProfile(rs.getString("profile"));
                teacher.setImgage(rs.getString("imgage"));
                teacherList.add(teacher);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return teacherList;
    }


    public List<TeacherBean> findByDepartment(String department) {
        List<TeacherBean> teacherList = new ArrayList<>();
        String sql = "SELECT * FROM teacher WHERE department = ?";

        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, department);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                TeacherBean teacher = new TeacherBean();
                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setTitle(rs.getString("title"));
                teacher.setDepartment(rs.getString("department"));
                teacher.setExpertise(rs.getString("expertise"));
                teacher.setProfile(rs.getString("profile"));
                teacher.setImgage(rs.getString("imgage"));
                teacherList.add(teacher);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return teacherList;
    }


    // 获取总数量（可带搜索）
    public static int getTeacherCount(String keyword) {
        String sql = "SELECT COUNT(*) FROM teacher WHERE name LIKE ? OR title LIKE ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            String kw = "%" + keyword + "%";
            stmt.setString(1, kw);
            stmt.setString(2, kw);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    // 分页查询教师
    public static List<TeacherBean> getTeachers(String keyword, int offset, int limit) {
        List<TeacherBean> list = new ArrayList<>();
        String sql = "SELECT * FROM teacher WHERE name LIKE ? OR title LIKE ? ORDER BY updated_at DESC LIMIT ?, ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            String kw = "%" + keyword + "%";
            stmt.setString(1, kw);
            stmt.setString(2, kw);
            stmt.setInt(3, offset);
            stmt.setInt(4, limit);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                TeacherBean t = new TeacherBean();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setTitle(rs.getString("title"));
                t.setDepartment(rs.getString("department"));
                t.setExpertise(rs.getString("expertise"));
                t.setProfile(rs.getString("profile"));
                t.setImgage(rs.getString("imgage"));
                t.setCreatedTime(rs.getTimestamp("created_at").toLocalDateTime());
                t.setUpdatedTime(rs.getTimestamp("updated_at").toLocalDateTime());
                list.add(t);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static boolean addTeacher(TeacherBean teacher) {
        String sql = "INSERT INTO teacher (name, title, department, expertise, profile, imgage) VALUES (?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, teacher.getName());
            ps.setString(2, teacher.getTitle());
            ps.setString(3, teacher.getDepartment());
            ps.setString(4, teacher.getExpertise());
            ps.setString(5, teacher.getProfile());
            ps.setString(6, teacher.getImgage());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static boolean updateTeacher(TeacherBean teacher) {
        String sql = "UPDATE teacher SET name = ?, title = ?, department = ?, expertise = ?, profile = ?, imgage = ?, updated_at = NOW() WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, teacher.getName());
            ps.setString(2, teacher.getTitle());
            ps.setString(3, teacher.getDepartment());
            ps.setString(4, teacher.getExpertise());
            ps.setString(5, teacher.getProfile());
            ps.setString(6, teacher.getImgage());
            ps.setInt(7, teacher.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static TeacherBean getTeacherById(int id) {
        String sql = "SELECT * FROM teacher WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                TeacherBean t = new TeacherBean();
                t.setId(rs.getInt("id"));
                t.setName(rs.getString("name"));
                t.setTitle(rs.getString("title"));
                t.setDepartment(rs.getString("department"));
                t.setExpertise(rs.getString("expertise"));
                t.setProfile(rs.getString("profile"));
                t.setImgage(rs.getString("imgage"));
                t.setCreatedTime(rs.getTimestamp("created_at").toLocalDateTime());
                t.setUpdatedTime(rs.getTimestamp("updated_at").toLocalDateTime());
                return t;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean deleteTeacherById(int id) {
        String sql = "DELETE FROM teacher WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public TeacherBean findById(int id) {
        TeacherBean teacher = null;
        String sql = "SELECT * FROM teacher WHERE id = ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                teacher = new TeacherBean();
                teacher.setId(rs.getInt("id"));
                teacher.setName(rs.getString("name"));
                teacher.setTitle(rs.getString("title"));
                teacher.setDepartment(rs.getString("department"));
                teacher.setExpertise(rs.getString("expertise"));
                teacher.setProfile(rs.getString("profile"));
                teacher.setImgage(rs.getString("imgage"));
                teacher.setCreatedTime(rs.getTimestamp("created_at").toLocalDateTime());
                teacher.setUpdatedTime(rs.getTimestamp("updated_at").toLocalDateTime());
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return teacher;
    }


}
