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


    // 查询所有分类（无结构）
    public static List<CourseCategoryBean> getAllCategories() {
        List<CourseCategoryBean> list = new ArrayList<>();
        String sql = "SELECT id, parent_id, name, type FROM course_category ORDER BY parent_id ASC, id ASC";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                CourseCategoryBean bean = new CourseCategoryBean();
                bean.setId(rs.getInt("id"));
                bean.setParentId(rs.getInt("parent_id"));
                bean.setName(rs.getString("name"));
                bean.setType(rs.getString("type"));
                list.add(bean);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 构造多级分类结构树（返回顶级分类，children中包含下级）
    public static List<CourseCategoryBean> getFullCategoryTree() {
        List<CourseCategoryBean> all = getAllCategories();
        Map<Integer, CourseCategoryBean> map = new HashMap<>();
        List<CourseCategoryBean> topLevel = new ArrayList<>();

        // 先把所有分类加入 map
        for (CourseCategoryBean cat : all) {
            map.put(cat.getId(), cat);
            cat.setChildren(new ArrayList<>()); // 初始化 children
        }

        // 组装 parent-child 关系
        for (CourseCategoryBean cat : all) {
            if (cat.getParentId() == 0) {
                topLevel.add(cat); // 一级分类
            } else {
                CourseCategoryBean parent = map.get(cat.getParentId());
                if (parent != null) {
                    parent.getChildren().add(cat);
                }
            }
        }

        return topLevel;
    }

    public static CourseCategoryBean findById(int id) {
        String sql = "SELECT id, parent_id, name, type FROM course_category WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                CourseCategoryBean bean = new CourseCategoryBean();
                bean.setId(rs.getInt("id"));
                bean.setParentId(rs.getInt("parent_id"));
                bean.setName(rs.getString("name"));
                bean.setType(rs.getString("type"));
                return bean;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static boolean updateCategory(int id, String name, String type) {
        String sql = "UPDATE course_category SET name = ?, type = ? WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setString(2, type);
            stmt.setInt(3, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static List<String> getAllTypes() {
        List<String> types = new ArrayList<>();
        String sql = "SELECT DISTINCT type FROM course_category WHERE type IS NOT NULL ORDER BY type";

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                types.add(rs.getString("type"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return types;
    }

    public static boolean insertCategory(int parent_id, String name, String type) {
        String sql = "INSERT INTO course_category (parent_id, name, type) VALUES (?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, parent_id);
            stmt.setString(2, name);
            stmt.setString(3, type);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static boolean hasChildren(int parentId) {
        String sql = "SELECT COUNT(*) FROM course_category WHERE parent_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, parentId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static boolean deleteCategory(int id) {
        String sql = "DELETE FROM course_category WHERE id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


    public static boolean isCategoryInUse(int categoryId) {
        String sql = "SELECT COUNT(*) FROM course WHERE category_id = ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, categoryId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static boolean isNameDuplicate(String name, int parentId, int excludeId) {
        String sql = "SELECT COUNT(*) FROM course_category WHERE name = ? AND parent_id = ? AND id != ?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, name);
            stmt.setInt(2, parentId);
            stmt.setInt(3, excludeId);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }


}
