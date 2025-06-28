package com.ip.dao;

import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CourseOrderDao {
    public boolean hasEnrolled(int courseId, int userId) {
        String sql = "SELECT 1 FROM course_order WHERE course_id = ? AND user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, courseId);
            stmt.setInt(2, userId);
            ResultSet rs = stmt.executeQuery();
            return rs.next();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public void insertOrder(String orderNo, int courseId, int userId) {
        String sql = "INSERT INTO course_order (order_no, course_id, user_id, status) VALUES (?, ?, ?, '未支付')";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, orderNo);
            stmt.setInt(2, courseId);
            stmt.setInt(3, userId);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void confirmPayment(String orderNo, String payMethod) {
        String sql = "UPDATE course_order SET status = '已支付', pay_method = ?, paid_at = NOW() WHERE order_no = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, payMethod);
            stmt.setString(2, orderNo);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
