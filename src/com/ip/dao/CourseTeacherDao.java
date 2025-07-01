package com.ip.dao;

import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseTeacherDao {

    public static boolean deleteByCourseId(int courseId) {
        String sql = "DELETE FROM course_teacher WHERE course_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            int affected = ps.executeUpdate();
            return affected >= 0;  // 删除0条也算成功
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // 批量插入多条讲师关联
    public static boolean insertBatch(int courseId, java.util.List<Integer> teacherIds) {
        if (teacherIds == null || teacherIds.isEmpty()) {
            return true; // 无需插入也算成功
        }
        String sql = "INSERT INTO course_teacher (course_id, teacher_id) VALUES (?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            for (Integer tid : teacherIds) {
                ps.setInt(1, courseId);
                ps.setInt(2, tid);
                ps.addBatch();
            }
            ps.executeBatch();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }


    public static List<Integer> getTeacherIdsByCourseId(int courseId) {
        List<Integer> list = new ArrayList<>();
        String sql = "SELECT teacher_id FROM course_teacher WHERE course_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, courseId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt("teacher_id"));
            }
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

}

