<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>师资团队 - IP创氪师</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">

    <!-- Tailwind 配置 -->
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#165DFF',
                        secondary: '#FF7D00',
                        dark: '#1D2129',
                        light: '#F7F8FA',
                    },
                    fontFamily: {
                        inter: ['Inter', 'system-ui', 'sans-serif'],
                    },
                },
            }
        }
    </script>

    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .text-shadow {
                text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .transition-navbar {
                transition: background-color 0.3s, box-shadow 0.3s, padding 0.3s;
            }
            .card-hover {
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .card-hover:hover {
                transform: translateY(-5px);
            }
            .animate-number {
                animation: number-grow 2s ease-out forwards;
                opacity: 0;
            }
            @keyframes number-grow {
                0% { opacity: 0; transform: scale(0.8); }
                100% { opacity: 1; transform: scale(1); }
            }
            .bg-gradient-hero {
                background: linear-gradient(to right, rgba(22, 93, 255, 0.9), rgba(22, 93, 255, 0.7)), url('./image/home/bigbackground.jpg') center/cover no-repeat;
            }
        }
    </style>
</head>

<body class="font-inter text-dark antialiased w-1200 mx-auto">

<header id="navbar" class="fixed top-0 left-0 w-full z-50 transition-navbar bg-white/95 backdrop-blur-md shadow-sm">
    <div class="container mx-auto px-8">
        <div class="flex justify-between items-center h-16 md:h-20">
            <div class="flex items-center">
                <a href="home" class="flex items-center space-x-2">
                    <div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center text-white">
                        <i class="fa fa-rocket text-xl"></i>
                    </div>
                    <div>
                        <h1 class="text-lg md:text-xl font-bold text-primary">IP创氪师</h1>
                        <p class="text-xs text-gray-500">成长，长成自己的样子</p>
                    </div>
                </a>
            </div>

            <nav class="flex items-center space-x-8">
                <a href="home" class="text-gray-700 hover:text-primary transition-colors font-medium">首页</a>
                <a href="courses" class="text-gray-700 hover:text-primary transition-colors font-medium">课程培训</a>
                <div class="relative group">
                    <a href="consult.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">职业规划咨询</a>
                    <div class="absolute left-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300">
                        <a href="consult.jsp" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary hover:text-white">
                            一对一职业规划咨询
                        </a>
                        <a href="chat" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary hover:text-white">
                            AI职业规划咨询
                        </a>
                    </div>
                </div>
                <a href="evaluation.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">职业测评</a>
                <a href="teachers" class="text-gray-700 hover:text-primary transition-colors font-medium  border-b-2 border-primary">师资团队</a>
                <c:choose>
                    <c:when test="${loginUser.role_id == 1 || loginUser.role_id == 2}">
                        <a href="adminDashboard" class="text-gray-700 hover:text-primary transition-colors font-medium">工作台</a>
                    </c:when>
                    <c:otherwise>
                        <a href="myProfile" class="text-gray-700 hover:text-primary transition-colors font-medium">个人中心</a>
                    </c:otherwise>
                </c:choose>
            </nav>

            <div class="flex items-center space-x-4">
                <div class="flex items-center space-x-4">
                    <c:choose>
                        <c:when test="${not empty loginUser}">
                            <div class="flex items-center space-x-2">
                                <c:choose>
                                    <c:when test="${not empty loginUser.avatar}">
                                        <img src="${pageContext.request.contextPath}${loginUser.avatar}" alt="头像"
                                             class="w-8 h-8 rounded-full object-cover border border-gray-300">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="image/users/defaultavatars.jpg" alt="默认头像"
                                             class="w-8 h-8 rounded-full object-cover border border-gray-300">
                                    </c:otherwise>
                                </c:choose>
                                <span class="text-gray-700 font-medium">${loginUser.username}</span>
                                <a href="logout" class="text-sm text-red-500 hover:underline">退出</a>
                            </div>
                        </c:when>

                        <c:otherwise>
                            <a href="login.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">登录</a>
                            <a href="register.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">注册</a>
                        </c:otherwise>
                    </c:choose>

                    <a href="consult.jsp" class="bg-secondary hover:bg-secondary/90 text-white px-5 py-2 rounded-full font-medium transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
                        在线咨询
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>



<!-- 页面主体 -->
<main class="container mx-auto px-8 pt-24 pb-16">
    <section class="py-12">
        <h2 class="text-3xl font-bold mb-8 text-center">专业师资团队</h2>
        <p class="text-gray-500 text-center max-w-2xl mx-auto mb-12">
            我们的教师均具备丰富的实战经验和专业背景，致力于为学员提供最优质的教学服务
        </p>

        <!-- 教师列表网格 -->
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">
            <c:forEach var="teacher" items="${teachers}">
                <a href="teacherDetail?id=${teacher.id}" class="block">
                    <div class="bg-white rounded-xl overflow-hidden shadow-md card-hover">
                        <div class="p-6">
                            <div class="flex items-start space-x-4">
                                <!-- 教师头像 -->
                                <img src="${pageContext.request.contextPath}${teacher.imgage}"
                                     alt="${teacher.name}"
                                     class="w-20 h-20 rounded-full object-cover border-2 border-primary">

                                <!-- 教师信息 -->
                                <div>
                                    <h3 class="text-xl font-bold text-dark">${teacher.name}</h3>
                                    <p class="text-gray-600 mt-1">${teacher.title}</p>
                                    <p class="text-primary mt-2 line-clamp-2">${teacher.expertise}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
            </c:forEach>
        </div>
    </section>
</main>

<!-- 页脚 -->
<jsp:include page="footer.jsp"/>

<!-- 返回顶部按钮 -->
<button id="back-to-top" class="fixed bottom-6 right-6 w-12 h-12 rounded-full bg-primary text-white shadow-lg flex items-center justify-center opacity-0 invisible transition-all z-50">
    <i class="fa fa-chevron-up"></i>
</button>

<script>
    // 返回顶部功能
    const backToTopButton = document.getElementById('back-to-top');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 300) {
            backToTopButton.classList.remove('opacity-0', 'invisible');
            backToTopButton.classList.add('opacity-100', 'visible');
        } else {
            backToTopButton.classList.add('opacity-0', 'invisible');
        }
    });
    backToTopButton.addEventListener('click', () => {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    });
</script>
</body>
</html>