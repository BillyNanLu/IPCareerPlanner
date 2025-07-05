<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/7/4
  Time: 20:05
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.time.format.DateTimeFormatter" %>

<html>
<head>
    <title>IP创氪师-个人中心</title>
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
            .text-balance {
                text-wrap: balance;
            }
        }
    </style>
</head>

<body class="font-inter bg-gray-50 text-gray-800 min-h-screen">

<div class="max-w-6xl mx-auto py-8 px-4 sm:px-6 lg:px-8">
    <!-- 顶部个人信息卡片 -->
    <div class="bg-white rounded-2xl shadow-md p-6 mb-8 transform transition-all duration-300 hover:shadow-lg">
        <div class="flex flex-col md:flex-row items-start md:items-center space-y-6 md:space-y-0 md:space-x-8">
            <div class="relative">
                <div class="w-32 h-32 rounded-full overflow-hidden border-4 border-white shadow-lg">
                    <img src="${pageContext.request.contextPath}${loginUser.avatar != null ? loginUser.avatar : '/image/users/defaultavatars.jpg'}"
                         alt="用户头像" class="w-full h-full object-cover" />
                </div>
                <div class="absolute bottom-0 right-0 bg-primary text-white rounded-full p-2 cursor-pointer hover:bg-primary/90 transition-colors">
                    <i class="fa fa-camera"></i>
                </div>
            </div>

            <div class="flex-1 w-full">
                <div class="flex flex-col md:flex-row md:items-center justify-between space-y-4 md:space-y-0">
                    <div>
                        <h1 class="text-3xl font-bold text-gray-900 flex items-center">
                            ${loginUser.username}
                            <c:choose>
                                <c:when test="${loginUser.role_id == 3}">
                                    <span class="ml-2 px-2 py-0.5 bg-blue-100 text-blue-800 text-xs rounded-full">学生用户</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="ml-2 px-2 py-0.5 bg-purple-100 text-purple-800 text-xs rounded-full">职场用户</span>
                                </c:otherwise>
                            </c:choose>
                        </h1>

                        <div class="mt-3 flex flex-wrap gap-4">
                            <div class="flex items-center text-gray-600">
                                <i class="fa fa-envelope-o mr-2 text-primary"></i>
                                <span>${loginUser.email}</span>
                            </div>
                            <div class="flex items-center text-gray-600">
                                <i class="fa fa-phone mr-2 text-primary"></i>
                                <span>${loginUser.phone}</span>
                            </div>
                        </div>

                        <div class="mt-3 flex items-center">
                                <span class="inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800">
                                    <i class="fa fa-check-circle mr-1"></i> 账户状态：启用
                                </span>
                        </div>
                    </div>

                    <div class="flex space-x-3">
                        <a href="editAccount" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-800 rounded-lg shadow-sm btn-hover flex items-center">
                            <i class="fa fa-edit mr-2"></i> 修改账户信息
                        </a>
                        <a href="home" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-800 rounded-lg shadow-sm btn-hover flex items-center">
                            <i class="fa fa-home mr-2"></i> 返回主页
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 数据概览卡片 -->
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
        <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm font-medium text-gray-500">注册时间</p>
                    <p class="mt-1 text-2xl font-bold text-gray-900">${fn:replace(loginUser.created_at, 'T', ' ')}</p>
                </div>
                <div class="p-3 bg-blue-100 rounded-lg">
                    <i class="fa fa-calendar text-primary text-xl"></i>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm font-medium text-gray-500">最后登录</p>
                    <p class="mt-1 text-2xl font-bold text-gray-900">
                        <c:choose>
                            <c:when test="${empty loginUser.last_login}">暂无记录</c:when>
                            <c:otherwise>${fn:replace(loginUser.last_login, 'T', ' ')}</c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <div class="p-3 bg-green-100 rounded-lg">
                    <i class="fa fa-clock-o text-green-600 text-xl"></i>
                </div>
            </div>
        </div>

        <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
            <div class="flex items-center justify-between">
                <div>
                    <p class="text-sm font-medium text-gray-500">已报名课程</p>
                    <p class="mt-1 text-2xl font-bold text-gray-900">${courseCount} 门</p>
                </div>
                <div class="p-3 bg-purple-100 rounded-lg">
                    <i class="fa fa-book text-purple-600 text-xl"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- 主要内容区域 -->
    <div class="grid grid-cols-1 lg:grid-cols-3 gap-8">
        <!-- 左侧边栏 -->
        <div class="lg:col-span-1 space-y-6">
            <!-- 预约记录模块 -->
            <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
                <h2 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                    <i class="fa fa-calendar-check-o text-primary mr-2"></i> 我的预约记录
                </h2>
                <div class="space-y-4">
                    <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                        <span class="text-gray-700">职业规划预约</span>
                        <span class="font-semibold text-gray-900">${careerCount} 条记录</span>
                    </div>
                    <div class="flex items-center justify-between p-3 bg-gray-50 rounded-lg">
                        <span class="text-gray-700">首页咨询申请</span>
                        <span class="font-semibold text-gray-900">${consultCount} 条记录</span>
                    </div>
                </div>
                <a href="#" class="mt-4 inline-block text-primary hover:text-primary/80 text-sm font-medium flex items-center">
                    查看全部记录 <i class="fa fa-arrow-right ml-1 text-xs"></i>
                </a>
            </div>

            <!-- AI 聊天记录 -->
            <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
                <h2 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                    <i class="fa fa-comments-o text-primary mr-2"></i> AI 聊天助手
                </h2>
                <c:choose>
                    <c:when test="${chatCount > 0}">
                        <p class="text-gray-700">您与 AI 的对话已保存，共 <strong>${chatCount}</strong> 条记录。</p>
                    </c:when>
                    <c:otherwise>
                        <p class="text-gray-500">暂无与 AI 的聊天记录。</p>
                    </c:otherwise>
                </c:choose>
                <a href="chat" class="mt-4 inline-flex items-center justify-center px-4 py-2 border border-transparent rounded-lg shadow-sm text-sm font-medium text-white bg-primary hover:bg-primary/90 transition-colors w-full btn-hover">
                    <i class="fa fa-comment-o mr-2"></i> 前往聊天
                </a>
            </div>

            <!-- 学习进度统计 -->
            <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
                <h2 class="text-xl font-bold text-gray-900 mb-4 flex items-center">
                    <i class="fa fa-line-chart text-primary mr-2"></i> 学习进度
                </h2>
                <div class="space-y-4">
                    <div>
                        <div class="flex justify-between text-sm mb-1">
                            <span class="font-medium text-gray-700">完成率</span>
                            <span class="text-gray-500">${progress}%</span>
                        </div>
                        <div class="w-full bg-gray-200 rounded-full h-2.5">
                            <div class="bg-primary h-2.5 rounded-full" style="width: ${progress}%"></div>
                        </div>
                    </div>

                    <div class="grid grid-cols-2 gap-4">
                        <div class="bg-blue-50 p-3 rounded-lg">
                            <p class="text-blue-700 text-sm font-medium">已完成</p>
                            <p class="text-2xl font-bold text-blue-800">0 门</p>
                        </div>
                        <div class="bg-yellow-50 p-3 rounded-lg">
                            <p class="text-yellow-700 text-sm font-medium">进行中</p>
                            <p class="text-2xl font-bold text-yellow-800">9 门</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 右侧内容区 -->
        <div class="lg:col-span-2">
            <!-- 当前已报名课程 -->
            <div class="bg-white rounded-xl shadow-sm p-6 transform transition-all duration-300 hover:shadow-md">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-xl font-bold text-gray-900 flex items-center">
                        <i class="fa fa-book text-primary mr-2"></i> 我报名的课程
                    </h2>
                    <span class="text-sm text-gray-500">已经报名课程：<strong>${courseCount}</strong> 门</span>
                </div>

                <div class="space-y-6">
                    <c:forEach var="course" items="${enrolledCourses}">
                        <div class="border border-gray-200 rounded-xl overflow-hidden hover:shadow-md transition-shadow duration-300">
                            <div class="flex flex-col md:flex-row">
                                <!-- 封面图 -->
                                <div class="md:w-1/3 relative">
                                    <img src="${pageContext.request.contextPath}${course.coverImage}" alt="${course.courseName}" class="w-full h-48 md:h-full object-cover"/>
                                    <div class="absolute top-3 left-3">
                                        <c:choose>
                                            <c:when test="${course.status eq '已支付'}">
                                                <span class="bg-green-500 text-white text-xs font-bold px-2 py-1 rounded">已支付</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="bg-red-500 text-white text-xs font-bold px-2 py-1 rounded">未支付</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>

                                <!-- 课程信息 -->
                                <div class="md:w-2/3 p-5">
                                    <div class="flex flex-col md:flex-row md:items-center justify-between mb-3">
                                        <h3 class="font-semibold text-lg text-gray-900">${course.courseName}</h3>
                                        <span class="text-sm text-gray-500">${course.categoryName}</span>
                                    </div>

                                    <div class="grid grid-cols-1 sm:grid-cols-1 gap-3 mb-4">
                                        <div class="flex items-center">
                                            <i class="fa fa-calendar-o text-gray-400 mr-2"></i>
                                            <span class="text-sm text-gray-600">
                                                    支付时间：${course.paidAt != null ? course.paidAt.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")) : '-'}
                                                </span>
                                        </div>
                                        <div class="flex items-center">
                                            <i class="fa fa-credit-card text-gray-400 mr-2"></i>
                                            <span class="text-sm text-gray-600">支付方式：${course.payMethod}</span>
                                        </div>
                                        <div class="flex items-center">
                                            <i class="fa fa-list-alt text-gray-400 mr-2"></i>
                                            <span class="text-sm text-gray-600">订单号：<span class="font-mono text-blue-700">${course.orderNo}</span></span>
                                        </div>
                                    </div>

                                    <div class="flex items-center justify-between">
                                        <div class="flex space-x-2">
                                            <a href="courseDetail?id=${course.courseId}" class="bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 rounded-lg shadow-md btn-hover w-full sm:w-auto flex justify-center items-center">
                                                <i class="fa fa-eye mr-2"></i> 查看详情
                                            </a>
                                            <a href="#" class="px-4 py-2 bg-gray-100 hover:bg-gray-200 text-gray-800 rounded-lg shadow-sm btn-hover text-sm flex items-center">
                                                <i class="fa fa-play mr-2"></i> 继续学习
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- 空状态 -->
                    <c:if test="${empty enrolledCourses}">
                        <div class="flex flex-col items-center justify-center py-12">
                            <div class="w-16 h-16 mb-4 bg-gray-100 rounded-full flex items-center justify-center">
                                <i class="fa fa-book text-gray-400 text-2xl"></i>
                            </div>
                            <p class="text-gray-500 mb-2">暂无报名课程</p>
                            <a href="#" class="text-primary hover:text-primary/80 text-sm font-medium flex items-center">
                                浏览课程 <i class="fa fa-arrow-right ml-1 text-xs"></i>
                            </a>
                        </div>
                    </c:if>
                </div>
            </div>

            <!-- 推荐课程 -->
            <div class="bg-white rounded-xl shadow-sm p-6 mt-6 transform transition-all duration-300 hover:shadow-md">
                <div class="flex items-center justify-between mb-6">
                    <h2 class="text-xl font-bold text-gray-900 flex items-center">
                        <i class="fa fa-thumbs-up text-primary mr-2"></i> 推荐课程
                    </h2>
                    <a href="#" class="text-primary hover:text-primary/80 text-sm font-medium flex items-center">
                        查看更多 <i class="fa fa-arrow-right ml-1 text-xs"></i>
                    </a>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 gap-6">
                    <!-- 推荐课程1 -->
                    <div class="border border-gray-200 rounded-xl overflow-hidden hover:shadow-md transition-shadow duration-300">
                        <div class="relative">
                            <img src="https://picsum.photos/seed/course1/600/400" alt="课程封面" class="w-full h-40 object-cover"/>
                            <div class="absolute top-3 left-3">
                                <span class="bg-primary text-white text-xs font-bold px-2 py-1 rounded">热门</span>
                            </div>
                        </div>
                        <div class="p-4">
                            <h3 class="font-semibold text-gray-900 mb-1">Web前端开发进阶课程</h3>
                            <p class="text-sm text-gray-500 mb-3">深入学习React、Vue等主流框架，掌握现代前端开发技术</p>
                            <div class="flex items-center justify-between">
                                <span class="text-primary font-bold">¥299</span>
                                <a href="#" class="text-sm text-primary hover:underline">查看详情</a>
                            </div>
                        </div>
                    </div>

                    <!-- 推荐课程2 -->
                    <div class="border border-gray-200 rounded-xl overflow-hidden hover:shadow-md transition-shadow duration-300">
                        <div class="relative">
                            <img src="https://picsum.photos/seed/course2/600/400" alt="课程封面" class="w-full h-40 object-cover"/>
                            <div class="absolute top-3 left-3">
                                <span class="bg-green-500 text-white text-xs font-bold px-2 py-1 rounded">新课</span>
                            </div>
                        </div>
                        <div class="p-4">
                            <h3 class="font-semibold text-gray-900 mb-1">Python数据分析实战</h3>
                            <p class="text-sm text-gray-500 mb-3">从基础到进阶，全面掌握Python数据分析技能</p>
                            <div class="flex items-center justify-between">
                                <span class="text-primary font-bold">¥399</span>
                                <a href="#" class="text-sm text-primary hover:underline">查看详情</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });

    // 卡片悬停动画
    document.querySelectorAll('.transform').forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.classList.add('scale-[1.02]');
        });
        card.addEventListener('mouseleave', function() {
            this.classList.remove('scale-[1.02]');
        });
    });
</script>
</body>
</html>