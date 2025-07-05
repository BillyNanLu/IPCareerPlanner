package com.ip.dao;

import com.ip.bean.AppointInformationBean;
import com.ip.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointInformationDao {
    // 添加预约信息
    public boolean addAppointInformation(AppointInformationBean appointInfo) {
        Connection conn = null;
        CallableStatement cs = null;
        boolean success = false;

        try {
            conn = DBUtil.getConnection();

            // 调用存储过程（含8个IN参数 + 1个OUT参数）
            String call = "{CALL create_appointment_information(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
            cs = conn.prepareCall(call);

            // 设置 IN 参数
            cs.setString(1, appointInfo.getName());
            cs.setString(2, appointInfo.getPhone());
            cs.setString(3, appointInfo.getTime());
            cs.setString(4, appointInfo.getCity());
            cs.setString(5, appointInfo.getIndustry());
            cs.setString(6, appointInfo.getExperience());
            cs.setString(7, appointInfo.getPaidConsult());
            cs.setString(8, appointInfo.getDescription());

            // 注册 OUT 参数（返回生成的 appointment_id）
            cs.registerOutParameter(9, Types.VARCHAR);

            // 执行
            cs.execute();

            // 获取 OUT 参数值
            String appointmentId = cs.getString(9);
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


    public static int countByKeyword(String keyword) {
        String sql = "SELECT COUNT(*) FROM appoint_information WHERE appointment_id LIKE ? OR name LIKE ? OR phone LIKE ? OR city LIKE ? OR industry LIKE ?";
        int count = 0;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword + "%";
            for (int i = 1; i <= 5; i++) {
                ps.setString(i, kw);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }

    public static List<AppointInformationBean> getByKeywordWithPage(String keyword, int offset, int pageSize) {
        List<AppointInformationBean> list = new ArrayList<>();
        String sql = "SELECT * FROM appoint_information WHERE appointment_id LIKE ? OR name LIKE ? OR phone LIKE ? OR city LIKE ? OR industry LIKE ? ORDER BY created_at DESC LIMIT ?, ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String kw = "%" + keyword + "%";
            for (int i = 1; i <= 5; i++) {
                ps.setString(i, kw);
            }
            ps.setInt(6, offset);
            ps.setInt(7, pageSize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractAppointInfo(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    private static AppointInformationBean extractAppointInfo(ResultSet rs) throws SQLException {
        AppointInformationBean bean = new AppointInformationBean();
        bean.setId(rs.getInt("id"));
        bean.setAppointmentId(rs.getString("appointment_id"));
        bean.setName(rs.getString("name"));
        bean.setPhone(rs.getString("phone"));
        bean.setTime(rs.getString("time"));
        bean.setCity(rs.getString("city"));
        bean.setIndustry(rs.getString("industry"));
        bean.setExperience(rs.getString("experience"));
        bean.setPaidConsult(rs.getString("paid_consult"));
        bean.setDescription(rs.getString("description"));
        bean.setCreatedAt(rs.getTimestamp("created_at").toLocalDateTime());
        bean.setUpdatedAt(rs.getTimestamp("updated_at").toLocalDateTime());
        bean.setStatus(rs.getInt("status"));
        return bean;
    }
}
