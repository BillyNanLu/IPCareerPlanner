package com.ip.dao;

import com.ip.bean.CourseBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CourseMoreDao {

    public static boolean updateByCourseId(CourseBean course) {
        String sql = "UPDATE course_more SET price=?, discount=?";
        boolean hasImage = course.getImage() != null && !course.getImage().isEmpty();
        if (hasImage) {
            sql += ", image=?";
        }
        sql += " WHERE course_id=?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setBigDecimal(1, course.getPrice());
            ps.setBigDecimal(2, course.getDiscount());
            int paramIndex = 3;
            if (hasImage) {
                ps.setString(paramIndex++, course.getImage());
            }
            ps.setInt(paramIndex, course.getId());

            int affected = ps.executeUpdate();
            return affected == 1;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
