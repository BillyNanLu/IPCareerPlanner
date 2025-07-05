package com.ip.dao;

import com.ip.bean.UsersBean;
import com.ip.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

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
                usersBean.setStatus(rs.getInt("status"));
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


    public static List<UsersBean> getNormalUsers() {
        List<UsersBean> list = new ArrayList<>();
        String sql = "SELECT u.*, r.role_name FROM users u JOIN roles r ON u.role_id = r.role_id WHERE u.role_id IN (3, 4) ORDER BY u.created_at DESC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UsersBean user = new UsersBean();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setGender(rs.getString("gender"));
                user.setPhone(rs.getString("phone"));
                user.setEmail(rs.getString("email"));
                user.setStatus(rs.getInt("status"));
                user.setRole_id(rs.getInt("role_id"));
                user.setAvatar(rs.getString("avatar"));
                user.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                user.setLast_login(rs.getTimestamp("last_login") != null ? rs.getTimestamp("last_login").toLocalDateTime() : null);
                user.setRoleName(rs.getString("role_name")); // 你可以在 UsersBean 中添加该字段
                list.add(user);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static List<UsersBean> findAllNormalUsers() {
        List<UsersBean> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role_id IN (3, 4) ORDER BY created_at ASC";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                UsersBean u = new UsersBean();
                u.setUser_id(rs.getInt("user_id"));
                u.setUsername(rs.getString("username"));
                u.setGender(rs.getString("gender"));
                u.setPhone(rs.getString("phone"));
                u.setEmail(rs.getString("email"));
                u.setAvatar(rs.getString("avatar"));
                u.setStatus(rs.getInt("status"));
                u.setRole_id(rs.getInt("role_id"));
                u.setLast_login(rs.getTimestamp("last_login") != null ? rs.getTimestamp("last_login").toLocalDateTime() : null);
                u.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
                u.setUpdated_at(rs.getTimestamp("updated_at").toLocalDateTime());
                list.add(u);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static void toggleStatus(int userId) {
        String sql = "UPDATE users SET status = 1 - status WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteById(int userId) {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, userId);
            int affected = ps.executeUpdate();
            return affected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean updateUser(UsersBean user) {
        String sql = "UPDATE users SET username=?, gender=?, phone=?, password=?, email=?, avatar=?, role_id=? WHERE user_id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getGender());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getAvatar());
            ps.setInt(7, user.getRole_id());
            ps.setInt(8, user.getUser_id());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public static UsersBean getUserById(int id) {
        String sql = "SELECT * FROM users WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                UsersBean user = new UsersBean();
                user.setUser_id(rs.getInt("user_id"));
                user.setUsername(rs.getString("username"));
                user.setGender(rs.getString("gender"));
                user.setPhone(rs.getString("phone"));
                user.setPassword(rs.getString("password"));
                user.setEmail(rs.getString("email"));
                user.setAvatar(rs.getString("avatar"));
                user.setRole_id(rs.getInt("role_id"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static List<UsersBean> findAdminsByRoleAndKeyword(int roleId, String keyword) {
        List<UsersBean> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role_id = ? AND (username LIKE ? OR phone LIKE ? OR email LIKE ?) ORDER BY updated_at DESC";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, roleId);
            String likeKeyword = "%" + keyword + "%";
            ps.setString(2, likeKeyword);
            ps.setString(3, likeKeyword);
            ps.setString(4, likeKeyword);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                list.add(extractUser(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public static List<UsersBean> findByRoleId(int roleId) {
        List<UsersBean> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE role_id = ? ORDER BY created_at ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, roleId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                UsersBean user = extractUser(rs);
                list.add(user);
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public static boolean insertUser(UsersBean user) {
        String sql = "INSERT INTO users (username, gender, phone, password, email, avatar, role_id) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, user.getUsername());
            ps.setString(2, user.getGender());
            ps.setString(3, user.getPhone());
            ps.setString(4, user.getPassword());
            ps.setString(5, user.getEmail());
            ps.setString(6, user.getAvatar());
            ps.setInt(7, user.getRole_id());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 模糊查询 + 分页
    public static List<UsersBean> searchUsers(String keyword, int offset, int limit) {
        List<UsersBean> list = new ArrayList<>();
        String sql = "SELECT * FROM users WHERE (username LIKE ? OR phone LIKE ? OR email LIKE ?) AND role_id IN (3,4) ORDER BY created_at ASC LIMIT ?, ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String like = "%" + (keyword != null ? keyword : "") + "%";
            ps.setString(1, like);
            ps.setString(2, like);
            ps.setString(3, like);
            ps.setInt(4, offset);
            ps.setInt(5, limit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UsersBean user = extractUser(rs);
                list.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 获取总数
    public static int countUsers(String keyword) {
        String sql = "SELECT COUNT(*) FROM users WHERE (username LIKE ? OR phone LIKE ? OR email LIKE ?) AND role_id IN (3,4)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            String like = "%" + (keyword != null ? keyword : "") + "%";
            ps.setString(1, like);
            ps.setString(2, like);
            ps.setString(3, like);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    private static UsersBean extractUser(ResultSet rs) throws SQLException {
        UsersBean user = new UsersBean();
        user.setUser_id(rs.getInt("user_id"));
        user.setUsername(rs.getString("username"));
        user.setGender(rs.getString("gender"));
        user.setPhone(rs.getString("phone"));
        user.setPassword(rs.getString("password"));
        user.setEmail(rs.getString("email"));
        user.setAvatar(rs.getString("avatar"));
        user.setStatus(rs.getInt("status"));
        user.setRole_id(rs.getInt("role_id"));
        user.setLast_login(rs.getTimestamp("last_login") != null ? rs.getTimestamp("last_login").toLocalDateTime() : null);
        user.setCreated_at(rs.getTimestamp("created_at").toLocalDateTime());
        user.setUpdated_at(rs.getTimestamp("updated_at").toLocalDateTime());
        return user;
    }


}
