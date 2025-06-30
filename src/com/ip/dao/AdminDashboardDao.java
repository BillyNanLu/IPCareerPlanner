package com.ip.dao;

import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AdminDashboardDao {
    public static int countTotalUsers() {
        String sql = "SELECT COUNT(*) FROM users";
        return getIntResult(sql);
    }

    public static int countTotalAdmins() {
        String sql = "SELECT COUNT(*) FROM users WHERE role_id IN (1, 2)";
        return getIntResult(sql);
    }

    public static int countActiveUsers() {
        String sql = "SELECT COUNT(*) FROM users WHERE status = 1";
        return getIntResult(sql);
    }

    public static int countTodayLogins() {
        String sql = "SELECT COUNT(*) FROM users WHERE DATE(last_login) = CURDATE()";
        return getIntResult(sql);
    }

    public static List<Map<String, String>> getRecentAdmins() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT username, phone, email, last_login FROM users WHERE role_id IN (1, 2) ORDER BY last_login DESC LIMIT 5";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, String> admin = new HashMap<>();
                admin.put("username", rs.getString("username"));
                admin.put("phone", rs.getString("phone"));
                admin.put("email", rs.getString("email"));
                admin.put("last_login", rs.getString("last_login"));
                list.add(admin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<Map<String, String>> getRecentUsers() {
        List<Map<String, String>> list = new ArrayList<>();
        String sql = "SELECT username, phone, email, last_login FROM users WHERE role_id NOT IN (1, 2) ORDER BY last_login DESC LIMIT 5";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Map<String, String> admin = new HashMap<>();
                admin.put("username", rs.getString("username"));
                admin.put("phone", rs.getString("phone"));
                admin.put("email", rs.getString("email"));
                admin.put("last_login", rs.getString("last_login"));
                list.add(admin);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    private static int getIntResult(String sql) {
        int result = 0;
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                result = rs.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
