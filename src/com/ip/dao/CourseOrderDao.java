package com.ip.dao;

import com.ip.bean.CourseOrderBean;
import com.ip.bean.CourseOrderViewBean;
import com.ip.bean.EnrolledCourseBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

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

    public static List<CourseOrderBean> getOrdersByPage(int page, int pageSize) {
        List<CourseOrderBean> list = new ArrayList<>();
        String sql = "SELECT o.id, o.order_no, o.pay_method, o.status, o.created_at, o.paid_at, c.name AS course_name, u.username " +
                "FROM course_order o " +
                "JOIN course c ON o.course_id = c.id " +
                "JOIN users u ON o.user_id = u.user_id " +
                "ORDER BY o.created_at DESC " +
                "LIMIT ?, ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, (page - 1) * pageSize);
            stmt.setInt(2, pageSize);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    CourseOrderBean bean = new CourseOrderBean();
                    bean.setId(rs.getInt("id"));
                    bean.setOrder_no(rs.getString("order_no"));
                    bean.setPay_method(rs.getString("pay_method"));
                    bean.setStatus(rs.getString("status"));
                    Timestamp created = rs.getTimestamp("created_at");
                    if (created != null) {
                        bean.setCreatedAt(created.toLocalDateTime());
                    }
                    Timestamp paid = rs.getTimestamp("paid_at");
                    if (paid != null) {
                        bean.setPaidAt(paid.toLocalDateTime());
                    }
                    bean.setCourse_name(rs.getString("course_name"));
                    bean.setUsername(rs.getString("username"));

                    list.add(bean);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 查询订单总数，用于分页
    public static int countOrders(String keyword, String status) {
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(*) FROM course_order o " +
                        "JOIN course c ON o.course_id = c.id " +
                        "JOIN users u ON o.user_id = u.user_id "
        );
        List<String> params = new ArrayList<>();
        boolean whereAdded = false;
        if ((keyword != null && !keyword.isEmpty()) || (status != null && !status.isEmpty())) {
            sql.append(" WHERE ");
            whereAdded = true;
        }
        boolean needAnd = false;
        if (keyword != null && !keyword.isEmpty()) {
            sql.append("(o.order_no LIKE ? OR c.name LIKE ? OR u.username LIKE ?)");
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
            needAnd = true;
        }
        if (status != null && !status.isEmpty()) {
            if (needAnd) sql.append(" AND ");
            sql.append("o.status = ?");
            params.add(status);
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                stmt.setString(i + 1, params.get(i));
            }

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<CourseOrderBean> getOrdersByPage(String keyword, String status, int page, int pageSize) {
        List<CourseOrderBean> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT o.id, o.order_no, o.pay_method, o.status, o.created_at, o.paid_at, c.name AS course_name, u.username " +
                        "FROM course_order o " +
                        "JOIN course c ON o.course_id = c.id " +
                        "JOIN users u ON o.user_id = u.user_id "
        );

        List<String> params = new ArrayList<>();
        boolean whereAdded = false;
        if ((keyword != null && !keyword.isEmpty()) || (status != null && !status.isEmpty())) {
            sql.append(" WHERE ");
            whereAdded = true;
        }
        boolean needAnd = false;
        if (keyword != null && !keyword.isEmpty()) {
            sql.append("(o.order_no LIKE ? OR c.name LIKE ? OR u.username LIKE ?)");
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
            params.add("%"+keyword+"%");
            needAnd = true;
        }
        if (status != null && !status.isEmpty()) {
            if (needAnd) sql.append(" AND ");
            sql.append("o.status = ?");
            params.add(status);
        }

        sql.append(" ORDER BY o.created_at DESC LIMIT ?, ?");

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {

            int idx = 1;
            for (String param : params) {
                stmt.setString(idx++, param);
            }
            stmt.setInt(idx++, (page - 1) * pageSize);
            stmt.setInt(idx, pageSize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                CourseOrderBean bean = new CourseOrderBean();
                bean.setId(rs.getInt("id"));
                bean.setOrder_no(rs.getString("order_no"));
                bean.setPay_method(rs.getString("pay_method"));
                bean.setStatus(rs.getString("status"));
                Timestamp created = rs.getTimestamp("created_at");
                if (created != null) bean.setCreatedAt(created.toLocalDateTime());
                Timestamp paid = rs.getTimestamp("paid_at");
                if (paid != null) bean.setPaidAt(paid.toLocalDateTime());
                bean.setCourse_name(rs.getString("course_name"));
                bean.setUsername(rs.getString("username"));
                list.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    public static boolean deleteOrderById(int id) {
        String sql = "DELETE FROM course_order WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static int countByUserId(int userId) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM course_order WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


    public static List<EnrolledCourseBean> getCoursesByUserId(int userId) {
        List<EnrolledCourseBean> list = new ArrayList<>();

        String sql = "SELECT co.course_id, c.name AS course_name, cm.image, " +
                "co.status, co.order_no, co.pay_method, co.paid_at, cat.name AS category_name " +
                "FROM course_order co " +
                "JOIN course c ON co.course_id = c.id " +
                "LEFT JOIN course_more cm ON c.id = cm.course_id " +
                "LEFT JOIN course_category cat ON c.category_id = cat.id " +
                "WHERE co.user_id = ? " +
                "ORDER BY co.created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                EnrolledCourseBean course = new EnrolledCourseBean();
                course.setCourseId(rs.getInt("course_id"));
                course.setCourseName(rs.getString("course_name"));
                course.setCoverImage(rs.getString("image"));
                course.setStatus(rs.getString("status"));
                course.setOrderNo(rs.getString("order_no"));
                course.setPayMethod(rs.getString("pay_method"));
                course.setCategoryName(rs.getString("category_name"));
                Timestamp paid = rs.getTimestamp("paid_at");
                if (paid != null) course.setPaidAt(paid.toLocalDateTime());

                list.add(course);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

}
