package com.ip.util;

import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

public class DBUtil {
    private static String JDBC_DRIVER;
    private static String DB_URL;
    private static String USER;
    private static String PASS;

    static {
        try {
            // 读取 db.properties 配置文件（确保在 classpath 下）
            InputStream in = DBUtil.class.getClassLoader().getResourceAsStream("db.properties");
            Properties props = new Properties();
            props.load(in);

            JDBC_DRIVER = props.getProperty("driver");
            DB_URL = props.getProperty("url");
            USER = props.getProperty("user");
            PASS = props.getProperty("password");

            // 注册 JDBC 驱动
            Class.forName(JDBC_DRIVER);
        } catch (Exception e) {
            e.printStackTrace();
            throw new ExceptionInInitializerError("初始化数据库连接失败: " + e.getMessage());
        }
    }

    /**
     * 获取数据库连接
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    /**
     * 关闭连接资源（适用于 PreparedStatement 和 ResultSet）
     */
    public static void close(Connection conn, PreparedStatement stmt, ResultSet rs) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (stmt != null) stmt.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 关闭连接资源（PreparedStatement 无 ResultSet）
     */
    public static void close(Connection conn, PreparedStatement stmt) {
        close(conn, stmt, null);
    }

    /**
     * 关闭连接资源（支持 CallableStatement 和 ResultSet）
     */
    public static void close(Connection conn, CallableStatement cs, ResultSet rs) {
        try {
            if (rs != null) rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (cs != null) cs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 关闭连接资源（CallableStatement 无 ResultSet）
     */
    public static void close(Connection conn, CallableStatement cs) {
        close(conn, cs, null);
    }

    /**
     * 测试数据库连接
     */
    public static void testConnection() {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = getConnection();
            System.out.println("数据库连接成功！");

            stmt = conn.prepareStatement("SELECT 1");
            rs = stmt.executeQuery();
            if (rs.next()) {
                System.out.println("测试查询结果: " + rs.getInt(1));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close(conn, stmt, rs);
        }
    }

    public static void main(String[] args) {
        testConnection();
    }
}
