package com.ip.dao;

import com.ip.bean.AppointInformationBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AppointInformationDao {
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
