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

}
