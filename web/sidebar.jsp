<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/6/30
  Time: 20:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

<!-- sidebar.jsp -->
<div class="w-64 h-screen bg-gray-900 text-white fixed left-0 top-0 flex flex-col">
    <div class="p-6 text-2xl font-bold border-b border-gray-700">
        IP 创氪师后台
    </div>
    <nav class="flex-1 overflow-y-auto p-4 space-y-4 text-sm">
        <a href="adminDashboard" class="block px-3 py-2 rounded hover:bg-gray-700">🏠 管理员首页</a>
        <a href="consultationList" class="block px-3 py-2 rounded hover:bg-gray-700">📋 首页咨询申请</a>
        <a href="career_appointments.jsp" class="block px-3 py-2 rounded hover:bg-gray-700">📅 职业规划预约</a>


        <div>
            <details class="group">
                <summary class="px-3 py-2 rounded cursor-pointer hover:bg-gray-700">📚 课程管理</summary>
                <div class="ml-4 mt-2 space-y-1">
                    <a href="courseOrders" class="block px-2 py-1 rounded hover:bg-gray-700">· 课程订单</a>
                    <a href="categoryList" class="block px-2 py-1 rounded hover:bg-gray-700">· 课程类别管理</a>
                    <a href="courseList" class="block px-2 py-1 rounded hover:bg-gray-700">· 课程信息管理</a>
                </div>
            </details>
        </div>

        <div>
            <details class="group">
                <summary class="px-3 py-2 rounded cursor-pointer hover:bg-gray-700">👥 用户管理</summary>
                <div class="ml-4 mt-2 space-y-1">
                    <a href="user_list.jsp" class="block px-2 py-1 rounded hover:bg-gray-700">· 普通用户</a>
                    <a href="teacher_list.jsp" class="block px-2 py-1 rounded hover:bg-gray-700">· 教师</a>
                    <a href="admin_list.jsp" class="block px-2 py-1 rounded hover:bg-gray-700">· 管理员</a>
                </div>
            </details>
        </div>
    </nav>

    <div class="p-4 border-t border-gray-700">
        <a href="logout.jsp" class="block px-3 py-2 bg-red-600 text-white text-center rounded hover:bg-red-700">
            🚪 退出登录
        </a>
    </div>
</div>

