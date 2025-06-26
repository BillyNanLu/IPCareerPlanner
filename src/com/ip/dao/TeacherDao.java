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

}
