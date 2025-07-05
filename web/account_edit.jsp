<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/7/5
  Time: 14:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改个人信息</title>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.8/dist/chart.umd.min.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#165DFF',
                        secondary: '#6B7280',
                        success: '#36D399',
                        warning: '#FFAA33',
                        danger: '#F87272',
                        info: '#3ABFF8',
                        light: '#F3F4F6',
                        dark: '#1F2937'
                    },
                    fontFamily: {
                        inter: ['Inter', 'system-ui', 'sans-serif'],
                    },
                }
            }
        }
    </script>
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .card-shadow {
                box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            }
            .input-focus {
                @apply focus:ring-2 focus:ring-primary/50 focus:border-primary transition-all duration-200;
            }
            .btn-hover {
                @apply hover:shadow-lg transform hover:-translate-y-0.5 transition-all duration-200;
            }
        }
    </style>
</head>
<body class="font-inter bg-gray-50 text-gray-800">
<div class="p-8 min-h-screen">
    <div class="max-w-3xl mx-auto">
        <!-- 页面标题 -->
        <div class="mb-8 flex justify-between items-center">
            <div class="flex items-center space-x-3">
                <div class="bg-primary/10 p-2 rounded-full">
                    <i class="fa fa-user-circle text-primary text-xl"></i>
                </div>
                <h1 class="text-2xl font-bold text-gray-800">修改账户信息</h1>
            </div>
            <a href="myProfile" class="text-sm text-gray-500 hover:text-primary transition-colors flex items-center">
                <i class="fa fa-arrow-left mr-1"></i> 返回个人中心
            </a>
        </div>

        <!-- 提示信息 -->
        <c:if test="${not empty msg}">
            <div class="relative bg-red-50 border border-red-200 text-red-700 px-4 py-3 rounded-lg mb-6 overflow-hidden">
                <div class="flex items-start">
                    <div class="flex-shrink-0 pt-0.5">
                        <i class="fa fa-exclamation-circle text-red-500"></i>
                    </div>
                    <div class="ml-3 flex-1">
                        <p class="text-sm"><strong class="font-medium">提示：</strong> ${msg}</p>
                    </div>
                    <div class="ml-4 flex-shrink-0 flex">
                        <button type="button" class="text-red-400 hover:text-red-500 focus:outline-none">
                            <i class="fa fa-times"></i>
                        </button>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- 表单卡片 -->
        <div class="bg-white rounded-2xl card-shadow p-8 space-y-8">
            <form method="post" action="editAccount" enctype="multipart/form-data" class="space-y-8">
                <input type="hidden" name="user_id" value="${user.user_id}" />

                <!-- 头像与预览 -->
                <div class="flex flex-col md:flex-row items-start md:items-center space-y-4 md:space-y-0 md:space-x-8">
                    <div class="relative">
                        <div class="w-24 h-24 rounded-full overflow-hidden border-4 border-white shadow-md">
                            <img src="${pageContext.request.contextPath}${user.avatar != null ? user.avatar : '/image/users/defaultavatars.jpg'}"
                                 class="w-full h-full object-cover" id="avatarPreview"/>
                        </div>
                        <div class="absolute -bottom-2 -right-2 bg-primary text-white rounded-full p-2 cursor-pointer hover:bg-primary/90 transition-colors">
                            <i class="fa fa-camera"></i>
                        </div>
                    </div>
                    <div class="flex-1">
                        <label class="block text-gray-700 font-medium mb-2">选择头像</label>
                        <div class="relative">
                            <div class="flex items-center justify-center w-full">
                                <label for="avatar" class="flex flex-col items-center justify-center w-full h-20 border-2 border-gray-300 border-dashed rounded-lg cursor-pointer bg-gray-50 hover:bg-gray-100 transition-colors">
                                    <div class="flex flex-col items-center justify-center pt-5 pb-6">
                                        <i class="fa fa-cloud-upload text-gray-400 text-xl mb-1"></i>
                                        <p class="mb-1 text-sm text-gray-600"><span class="font-medium">点击上传新头像</span> 或拖放文件</p>
                                        <p class="text-xs text-gray-500">PNG, JPG (最大: 2MB)</p>
                                    </div>
                                    <input id="avatar" type="file" name="avatar" accept="image/*" onchange="previewAvatar(event)" class="hidden" />
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                    <!-- 用户名 -->
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">用户名</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fa fa-user text-gray-400"></i>
                            </div>
                            <input type="text" name="username" value="${user.username}" required
                                   class="pl-10 w-full border border-gray-300 rounded-lg px-4 py-3 input-focus"
                                   placeholder="请输入用户名">
                        </div>
                    </div>

                    <!-- 性别 -->
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">性别</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fa fa-venus-mars text-gray-400"></i>
                            </div>
                            <select name="gender" class="pl-10 w-full border border-gray-300 rounded-lg px-4 py-3 input-focus appearance-none bg-white">
                                <option value="male" ${user.gender == 'male' ? 'selected' : ''}>男</option>
                                <option value="female" ${user.gender == 'female' ? 'selected' : ''}>女</option>
                            </select>
                            <div class="absolute inset-y-0 right-0 flex items-center pr-3 pointer-events-none">
                                <i class="fa fa-chevron-down text-gray-400"></i>
                            </div>
                        </div>
                    </div>

                    <!-- 手机 -->
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">手机号</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fa fa-phone text-gray-400"></i>
                            </div>
                            <input type="text" name="phone" value="${user.phone}" required
                                   class="pl-10 w-full border border-gray-300 rounded-lg px-4 py-3 input-focus"
                                   placeholder="请输入手机号">
                        </div>
                    </div>

                    <!-- 邮箱 -->
                    <div>
                        <label class="block text-gray-700 font-medium mb-2">邮箱</label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fa fa-envelope text-gray-400"></i>
                            </div>
                            <input type="email" name="email" value="${user.email}" required
                                   class="pl-10 w-full border border-gray-300 rounded-lg px-4 py-3 input-focus"
                                   placeholder="请输入邮箱">
                        </div>
                    </div>
                </div>

                <!-- 密码 -->
                <div>
                    <label class="block text-gray-700 font-medium mb-2">新密码（可选）</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                            <i class="fa fa-lock text-gray-400"></i>
                        </div>
                        <input type="password" name="password" id="password"
                               class="pl-10 w-full border border-gray-300 rounded-lg px-4 py-3 input-focus"
                               placeholder="请输入新密码">
                        <div class="absolute inset-y-0 right-0 pr-3 flex items-center">
                            <button type="button" id="togglePassword" class="text-gray-400 hover:text-gray-600 focus:outline-none">
                                <i class="fa fa-eye-slash"></i>
                            </button>
                        </div>
                    </div>
                    <p class="mt-1 text-xs text-gray-500">留空则不修改密码</p>
                </div>

                <!-- 密码强度指示器 -->
                <div id="passwordStrength" class="hidden">
                    <div class="flex items-center space-x-2 mt-2">
                        <div class="w-full bg-gray-200 rounded-full h-2">
                            <div id="strengthIndicator" class="bg-red-500 h-2 rounded-full transition-all duration-300" style="width: 0%"></div>
                        </div>
                        <span id="strengthText" class="text-xs font-medium text-red-500">密码强度</span>
                    </div>
                </div>

                <!-- 提交按钮 -->
                <div class="pt-4 flex flex-col sm:flex-row sm:justify-between space-y-4 sm:space-y-0">
                    <button type="submit"
                            class="bg-blue-600 hover:bg-blue-700 text-white px-6 py-3 rounded-lg shadow-md btn-hover w-full sm:w-auto flex justify-center items-center">
                        <i class="fa fa-check mr-2"></i> 保存修改
                    </button>
                    <a href="myProfile" class="text-gray-600 hover:text-gray-800 transition-colors flex items-center justify-center sm:justify-end">
                        <i class="fa fa-times mr-1"></i> 取消
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- 头像预览和密码显示脚本 -->
<script>
    function previewAvatar(event) {
        const file = event.target.files[0];
        if (file) {
            const reader = new FileReader();
            reader.onload = e => {
                document.getElementById("avatarPreview").src = e.target.result;
            };
            reader.readAsDataURL(file);
        }
    }

    // 密码显示/隐藏功能
    const togglePassword = document.getElementById('togglePassword');
    const password = document.getElementById('password');
    const passwordStrength = document.getElementById('passwordStrength');
    const strengthIndicator = document.getElementById('strengthIndicator');
    const strengthText = document.getElementById('strengthText');

    togglePassword.addEventListener('click', function() {
        const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
        password.setAttribute('type', type);

        // 切换图标
        this.querySelector('i').classList.toggle('fa-eye');
        this.querySelector('i').classList.toggle('fa-eye-slash');
    });

    // 密码强度检测
    password.addEventListener('input', function() {
        const password = this.value;
        if (password.length > 0) {
            passwordStrength.classList.remove('hidden');

            // 简单的密码强度检测
            let strength = 0;
            if (password.length > 6) strength += 25;
            if (password.length > 10) strength += 25;
            if (/[A-Z]/.test(password)) strength += 25;
            if (/[0-9]/.test(password)) strength += 15;
            if (/[^A-Za-z0-9]/.test(password)) strength += 10;

            // 更新强度条
            strengthIndicator.style.width = `${strength}%`;

            // 更新强度文本和颜色
            if (strength < 30) {
                strengthText.textContent = '弱';
                strengthText.className = 'text-xs font-medium text-red-500';
                strengthIndicator.className = 'bg-red-500 h-2 rounded-full transition-all duration-300';
            } else if (strength < 60) {
                strengthText.textContent = '中';
                strengthText.className = 'text-xs font-medium text-yellow-500';
                strengthIndicator.className = 'bg-yellow-500 h-2 rounded-full transition-all duration-300';
            } else if (strength < 80) {
                strengthText.textContent = '强';
                strengthText.className = 'text-xs font-medium text-blue-500';
                strengthIndicator.className = 'bg-blue-500 h-2 rounded-full transition-all duration-300';
            } else {
                strengthText.textContent = '非常强';
                strengthText.className = 'text-xs font-medium text-green-500';
                strengthIndicator.className = 'bg-green-500 h-2 rounded-full transition-all duration-300';
            }
        } else {
            passwordStrength.classList.add('hidden');
        }
    });

    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
</script>
</body>
</html>
