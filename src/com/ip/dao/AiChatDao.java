package com.ip.dao;

import com.ip.bean.AiChatMessageBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AiChatDao {

    public void insert(AiChatMessageBean aiChatMessageBean) {
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = DBUtil.getConnection();
            String sql = "INSERT INTO ai_chat_history (user_id, role, message) VALUES (?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setInt(1, aiChatMessageBean.getUserId());
            ps.setString(2, aiChatMessageBean.getRole());
            ps.setString(3, aiChatMessageBean.getMessage());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps);
        }
    }


    public List<AiChatMessageBean> getMessagesByUserId(int userId) {
        List<AiChatMessageBean> list = new ArrayList<>();
        String sql = "SELECT * FROM ai_chat_history WHERE user_id=? ORDER BY timestamp";

        Connection conn = null;
        PreparedStatement ps = null;
        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AiChatMessageBean aiChatMessageBean = new AiChatMessageBean();
                aiChatMessageBean.setUserId(userId);
                aiChatMessageBean.setRole(rs.getString("role"));
                aiChatMessageBean.setMessage(rs.getString("message"));
                aiChatMessageBean.setTimestamp(rs.getTimestamp("timestamp").toLocalDateTime());
                list.add(aiChatMessageBean);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps);
        }
        
        return list;
    }

    /**
     * 获取用户最近的N条对话记录（按时间倒序）
     * @param userId 用户ID
     * @param limit 最大记录数
     * @return 对话记录列表
     */
    public List<AiChatMessageBean> getRecentMessages(int userId, int limit) {
        List<AiChatMessageBean> list = new ArrayList<>();
        String sql = "SELECT * FROM ai_chat_history " +
                "WHERE user_id = ? " +
                "ORDER BY timestamp DESC " +  // 按时间倒序
                "LIMIT ?";                  // 限制返回数量

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, limit);
            rs = ps.executeQuery();

            while (rs.next()) {
                AiChatMessageBean msg = new AiChatMessageBean();
                msg.setId(rs.getInt("id"));
                msg.setUserId(userId);
                msg.setRole(rs.getString("role"));
                msg.setMessage(rs.getString("message"));
                msg.setTimestamp(rs.getTimestamp("timestamp").toLocalDateTime());
                list.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        // 反转列表，使记录按时间正序排列
        java.util.Collections.reverse(list);
        return list;
    }

    /**
     * 获取用户对话历史（支持分页）
     * @param userId 用户ID
     * @param pageNum 页码
     * @param pageSize 每页大小
     * @return 对话记录列表
     */
    public List<AiChatMessageBean> getMessagesByPage(int userId, int pageNum, int pageSize) {
        List<AiChatMessageBean> list = new ArrayList<>();
        String sql = "SELECT * FROM ai_chat_history " +
                "WHERE user_id = ? " +
                "ORDER BY timestamp DESC " +
                "LIMIT ? OFFSET ?";

        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            ps.setInt(2, pageSize);
            ps.setInt(3, (pageNum - 1) * pageSize);
            rs = ps.executeQuery();

            while (rs.next()) {
                AiChatMessageBean msg = new AiChatMessageBean();
                msg.setId(rs.getInt("id"));
                msg.setUserId(userId);
                msg.setRole(rs.getString("role"));
                msg.setMessage(rs.getString("message"));
                msg.setTimestamp(rs.getTimestamp("timestamp").toLocalDateTime());
                list.add(msg);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        return list;
    }

    /**
     * 获取用户对话总数（用于分页）
     * @param userId 用户ID
     * @return 对话总数
     */
    public int getMessageCount(int userId) {
        String sql = "SELECT COUNT(*) FROM ai_chat_history WHERE user_id = ?";
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int count = 0;

        try {
            conn = DBUtil.getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.close(conn, ps, rs);
        }

        return count;
    }

    // 关闭资源的重载方法（支持ResultSet）
    public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static List<AiChatMessageBean> findChats(String keyword, String role, int offset, int limit) {
        List<AiChatMessageBean> list = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
                "SELECT a.*, u.username FROM ai_chat_history a JOIN users u ON a.user_id = u.user_id WHERE 1=1"
        );

        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (a.message LIKE ? OR u.username LIKE ?)");
            params.add("%" + keyword + "%");
            params.add("%" + keyword + "%");
        }

        if (role != null && !role.isEmpty()) {
            sql.append(" AND a.role = ?");
            params.add(role);
        }

        sql.append(" ORDER BY a.timestamp DESC LIMIT ?, ?");
        params.add(offset);
        params.add(limit);

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                AiChatMessageBean bean = new AiChatMessageBean();
                bean.setId(rs.getInt("id"));
                bean.setUserId(rs.getInt("user_id"));
                bean.setUsername(rs.getString("username"));
                bean.setRole(rs.getString("role"));
                bean.setMessage(rs.getString("message"));
                bean.setTimestamp(rs.getTimestamp("timestamp").toLocalDateTime());
                list.add(bean);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public static int countChats(String keyword, String role) {
        StringBuilder sql = new StringBuilder(
                "SELECT COUNT(*) FROM ai_chat_history a JOIN users u ON a.user_id = u.user_id WHERE 1=1"
        );
        List<Object> params = new ArrayList<>();

        if (keyword != null && !keyword.isEmpty()) {
            sql.append(" AND (a.message LIKE ? OR u.username LIKE ?)");
            params.add("%" + keyword + "%");
            params.add("%" + keyword + "%");
        }

        if (role != null && !role.isEmpty()) {
            sql.append(" AND a.role = ?");
            params.add(role);
        }

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql.toString())) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }


    public static int countByUserId(int userId) {
        String sql = "SELECT COUNT(*) FROM ai_chat_history WHERE user_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }


}
