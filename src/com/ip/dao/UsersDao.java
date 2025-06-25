package com.ip.dao;

import com.ip.bean.UsersBean;
import com.ip.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class UsersDao {

    // 注册（超级管理员/管理员添加）用户
    public boolean addUser(String username, String password, String gender, String phone, String email, String avatar, Integer role_id) {
        Connection conn = null;
        PreparedStatement ps = null;
        boolean success = false;

        try {
            conn = DBUtil.getConnection();
            String sql = "Insert into users(username, password, gender, phone, email, avatar, role_id)" + "Values(?,?,?,?,?,?,?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, gender);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, avatar);
            ps.setInt(7, role_id);

            int rowsAffected = ps.executeUpdate();
            success = rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps);
        }

        return success;
    }


    // 登录 （查询role_id）
    public UsersBean findByPhoneAndPassword(String phone, String encryptedPassword) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        UsersBean usersBean = new UsersBean();

        try {
            conn = DBUtil.getConnection();
            String sql = "select * from users where phone = ? and password = ? and status = 1";
            ps = conn.prepareStatement(sql);
            ps.setString(1, phone);
            ps.setString(2, encryptedPassword);
            rs = ps.executeQuery();
            while (rs.next()) {
                usersBean.setUser_id(rs.getInt("user_id"));
                usersBean.setUsername(rs.getString("username"));
                usersBean.setGender(rs.getString("gender"));
                usersBean.setPhone(rs.getString("phone"));
                usersBean.setEmail(rs.getString("email"));
                usersBean.setAvatar(rs.getString("avatar"));
                usersBean.setRole_id(rs.getInt("role_id"));
                // usersBean.setLast_login(rs.getTimestamp("last_login").toLocalDateTime());
                Timestamp lastLoginTs = rs.getTimestamp("last_login");
                if (lastLoginTs != null) {
                    usersBean.setLast_login(lastLoginTs.toLocalDateTime());
                } else {
                    usersBean.setLast_login(null);
                }
                usersBean.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                usersBean.setUpdated_at(rs.getTimestamp("updated_at").toLocalDateTime());
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        return usersBean;
    }


    public void updateLastLogin(int userId, LocalDateTime loginTime) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "update users set last_login = ? where user_id = ?";
            ps = conn.prepareStatement(sql);

            ps.setTimestamp(1, Timestamp.valueOf(loginTime));
            ps.setInt(2, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


}
