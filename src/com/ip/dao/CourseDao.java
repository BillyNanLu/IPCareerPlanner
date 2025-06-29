package com.ip.dao;

import com.ip.bean.CourseBean;
import com.ip.bean.CourseMoreBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
}
