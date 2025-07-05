package com.ip.dao;

import com.ip.bean.AppointConsultBean;
import com.ip.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointConsultDao {

    // 添加申请
    public boolean addAppointConsult(String appoint_name, String appoint_phone, String appoint_description) {
        Connection conn = null;
        CallableStatement cs = null;
        boolean success = false;

        try {
            conn = DBUtil.getConnection();

            // 调用存储过程（含3个IN参数 + 1个OUT参数）
            String call = "{CALL create_appointment(?, ?, ?, ?)}";
            cs = conn.prepareCall(call);

            // 设置 IN 参数
            cs.setString(1, appoint_name);
            cs.setString(2, appoint_phone);
            cs.setString(3, appoint_description);

            // 注册 OUT 参数（返回生成的 appointment_id）
            cs.registerOutParameter(4, java.sql.Types.VARCHAR);

            // 执行
            cs.execute();

            // 获取 OUT 参数值
            String appointmentId = cs.getString(4);
            System.out.println("生成的预约 ID 为: " + appointmentId);

            // 成功插入判断依据
            success = (appointmentId != null && !appointmentId.isEmpty());
        } catch (SQLException e) {
            throw new RuntimeException("数据库调用失败: " + e.getMessage(), e);
        } finally {
            DBUtil.close(conn, cs);
        }

        return success;
    }


    // 获取所有申请
    public static List<AppointConsultBean> getAllConsults() {
        List<AppointConsultBean> list = new ArrayList<>();
        String sql = "SELECT id, appointment_id, name, phone, description, created_at FROM appoint_consult ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                AppointConsultBean bean = new AppointConsultBean();
                bean.setId(rs.getInt("id"));
                bean.setAppointment_id(rs.getString("appointment_id"));
                bean.setName(rs.getString("name"));
                bean.setPhone(rs.getString("phone"));
                bean.setDescription(rs.getString("description"));
                Timestamp ts = rs.getTimestamp("created_at");
                if (ts != null) {
                    bean.setCreated_at(ts.toLocalDateTime());
                }
                list.add(bean);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // 删除某一行申请
    public static void deleteConsultById(int id) {
        String sql = "DELETE FROM appoint_consult WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    // 搜索申请
    public static List<AppointConsultBean> searchConsults(String keyword) {
        List<AppointConsultBean> list = new ArrayList<>();
        String sql = "SELECT id, appointment_id, name, phone, description, created_at FROM appoint_consult WHERE name LIKE ? OR phone LIKE ? ORDER BY created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            String likeKeyword = "%" + keyword + "%";
            stmt.setString(1, likeKeyword);
            stmt.setString(2, likeKeyword);

            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    AppointConsultBean bean = new AppointConsultBean();
                    bean.setId(rs.getInt("id"));
                    bean.setAppointment_id(rs.getString("appointment_id"));
                    bean.setName(rs.getString("name"));
                    bean.setPhone(rs.getString("phone"));
                    bean.setDescription(rs.getString("description"));
                    Timestamp ts = rs.getTimestamp("created_at");
                    if (ts != null) {
                        bean.setCreated_at(ts.toLocalDateTime());
                    }
                    list.add(bean);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }


    public static int countConsults(String keyword) {
        String sql = "SELECT COUNT(*) FROM appoint_consult";
        if (keyword != null && !keyword.isEmpty()) {
            sql += " WHERE name LIKE ? OR phone LIKE ?";
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            if (keyword != null && !keyword.isEmpty()) {
                String like = "%" + keyword + "%";
                stmt.setString(1, like);
                stmt.setString(2, like);
            }
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<AppointConsultBean> getConsultsByPage(String keyword, int page, int pageSize) {
        List<AppointConsultBean> list = new ArrayList<>();
        String sql = "SELECT * FROM appoint_consult";
        if (keyword != null && !keyword.isEmpty()) {
            sql += " WHERE name LIKE ? OR phone LIKE ?";
        }
        sql += " ORDER BY created_at DESC LIMIT ?, ?";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            int paramIndex = 1;
            if (keyword != null && !keyword.isEmpty()) {
                String like = "%" + keyword + "%";
                stmt.setString(paramIndex++, like);
                stmt.setString(paramIndex++, like);
            }

            stmt.setInt(paramIndex++, (page - 1) * pageSize);
            stmt.setInt(paramIndex, pageSize);

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                AppointConsultBean bean = new AppointConsultBean();
                bean.setId(rs.getInt("id"));
                bean.setAppointment_id(rs.getString("appointment_id"));
                bean.setName(rs.getString("name"));
                bean.setPhone(rs.getString("phone"));
                bean.setDescription(rs.getString("description"));
                bean.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                list.add(bean);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int countByPhone(String phone) {
        int count = 0;
        String sql = "SELECT COUNT(*) FROM appoint_consult WHERE phone = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, phone);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) count = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }



}
