package com.ip.dao;

import com.ip.bean.CourseCategoryBean;
import com.ip.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CourseCategoryDao {
    public List<CourseCategoryBean> findAll() {
        List<CourseCategoryBean> list = new ArrayList<>();
        String sql = "SELECT id, parent_id, name, type FROM course_category";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                CourseCategoryBean cat = new CourseCategoryBean();
                cat.setId(rs.getInt("id"));
                cat.setParentId(rs.getInt("parent_id"));
                cat.setName(rs.getString("name"));
                cat.setType(rs.getString("type"));
                list.add(cat);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public int findIdByName(String name) {
        int id = 0;
        String sql = "SELECT id FROM course_category WHERE name=?";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, name);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                id = rs.getInt("id");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return id;
    }

    public List<CourseCategoryBean> findByParentId(int id) {
        List<CourseCategoryBean> list = new ArrayList<>();
        String sql = "SELECT id, name, type FROM course_category WHERE parent_id=?";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CourseCategoryBean cat = new CourseCategoryBean();
                cat.setId(rs.getInt("id"));
                cat.setName(rs.getString("name"));
                cat.setType(rs.getString("type"));
                list.add(cat);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }


}
