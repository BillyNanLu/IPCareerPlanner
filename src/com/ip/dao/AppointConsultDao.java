package com.ip.dao;

import com.ip.bean.AppointConsultBean;
import com.ip.util.DBUtil;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

public class AppointConsultDao {

    // 添加预约
    public boolean addAppointConsult(String appoint_name, String appoint_phone, String appoint_description) {
        Connection conn = null;
        CallableStatement cs = null;
        boolean success = false;

        try {
            conn = DBUtil.getConnection();

            // 调用存储过程（含3个IN参数 + 1个OUT参数）
            String call = "{CALL create_appointment(?, ?, ?, ?)}";
            cs = conn.prepareCall(call);

            // 设置 IN 参数
            cs.setString(1, appoint_name);
            cs.setString(2, appoint_phone);
            cs.setString(3, appoint_description);

            // 注册 OUT 参数（返回生成的 appointment_id）
            cs.registerOutParameter(4, java.sql.Types.VARCHAR);

            // 执行
            cs.execute();

            // 获取 OUT 参数值
            String appointmentId = cs.getString(4);
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


}
