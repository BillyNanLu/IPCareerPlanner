<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 2025/6/24
  Time: 0:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>职业测评 - IP创氪师</title>

    <!-- 引入与home.jsp一致的资源 -->
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <!-- Tailwind配置（与home.jsp保持一致） -->
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

    <!-- 自定义样式（与home.jsp保持一致） -->
    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto { content-visibility: auto; }
            .text-shadow { text-shadow: 0 2px 4px rgba(0,0,0,0.1); }
            .transition-navbar { transition: background-color 0.3s, box-shadow 0.3s, padding 0.3s; }
            .card-hover { transition: transform 0.3s, box-shadow 0.3s; }
            .card-hover:hover { transform: translateY(-5px); }
            .animate-number { animation: number-grow 2s ease-out forwards; opacity: 0; }
            @keyframes number-grow { 0% { opacity: 0; transform: scale(0.8); } 100% { opacity: 1; transform: scale(1); } }
            .bg-gradient-hero {
                background: url('image/evaluation/background.jpg') center/cover no-repeat;
            }
        }
    </style>
</head>
<body class="font-inter text-dark antialiased w-1200 mx-auto">
<!-- 复制home.jsp的导航栏，整合登录注册逻辑 -->
<header id="navbar" class="fixed top-0 left-0 w-full z-50 transition-navbar bg-white/95 backdrop-blur-md shadow-sm">
    <div class="container mx-auto px-8">
        <div class="flex justify-between items-center h-16 md:h-20">
            <!-- 品牌Logo -->
            <div class="flex items-center">
                <a href="home.jsp" class="flex items-center space-x-2">
                    <div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center text-white">
                        <i class="fa fa-rocket text-xl"></i>
                    </div>
                    <div>
                        <h1 class="text-lg md:text-xl font-bold text-primary">IP创氪师</h1>
                        <p class="text-xs text-gray-500">成长，长成自己的样子</p>
                    </div>
                </a>
            </div>

            <!-- 导航菜单 -->
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
                <a href="evaluation.jsp" class="text-primary hover:text-primary transition-colors font-medium border-b-2 border-primary">职业测评</a>
                <a href="teachers" class="text-gray-700 hover:text-primary transition-colors font-medium">师资团队</a>
                <c:choose>
                    <c:when test="${loginUser.role_id == 1 || loginUser.role_id == 2}">
                        <a href="adminDashboard" class="text-gray-700 hover:text-primary transition-colors font-medium">工作台</a>
                    </c:when>
                    <c:otherwise>
                        <a href="myProfile" class="text-gray-700 hover:text-primary transition-colors font-medium">个人中心</a>
                    </c:otherwise>
                </c:choose>
            </nav>

            <!-- 整合home.jsp的登录注册逻辑 -->
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

<!-- 页面主体内容-->
<main class="pt-20 pb-16">
    <!-- 1. 英雄区 -->
    <section class="bg-gradient-hero pt-18.5 min-h-[280px] flex items-center">
        <div class="container mx-auto px-8 relative z-10">
            <div class="max-w-3xl">
                <h2 class="text-[clamp(2rem,4vw,2.5rem)] font-bold text-white leading-tight text-shadow mb-4">
                    科学测评，发现职业潜力
                </h2>
                <p class="text-[clamp(1rem,2vw,1.25rem)] text-white/90 mb-8 max-w-2xl">
                    基于心理学理论与职场大数据，10+维度评估你的职业倾向、能力优势与发展潜力
                </p>

            </div>
        </div>
    </section>

    <!-- 2. 测评分类区 -->
    <section id="categories" class="py-16 bg-light">
        <div class="container mx-auto px-8">
            <div class="text-center mb-12">
                <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">测评分类</h2>
                <p class="text-gray-500 max-w-2xl mx-auto">根据你的职业阶段和需求，选择最适合的测评工具</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                <!-- 分类1：职业倾向测评 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-6">
                        <div class="w-14 h-14 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                            <i class="fa fa-square text-2xl"></i>
                        </div>
                        <h3 class="text-xl font-bold text-dark mb-2">职业倾向测评</h3>
                        <p class="text-gray-500 mb-4">通过霍兰德职业兴趣理论，分析你的兴趣类型与职业匹配度，找到真正适合的职业方向</p>
                        <a href="interest-test.jsp" class="inline-flex items-center text-primary font-medium hover:underline">
                            开始测试 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>

                <!-- 分类2：能力优势测评 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-6">
                        <div class="w-14 h-14 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                            <i class="fa fa-star text-2xl"></i>
                        </div>
                        <h3 class="text-xl font-bold text-dark mb-2">能力优势测评</h3>
                        <p class="text-gray-500 mb-4">挖掘你的核心能力与潜在优势，明确职场竞争力，为职业发展提供科学依据</p>
                        <a href="ability-test.jsp" class="inline-flex items-center text-primary font-medium hover:underline">
                            开始测试 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>


                <!-- 分类3：大学生就业核心竞争力测评 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-6">
                        <div class="w-14 h-14 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                            <i class="fa fa-graduation-cap text-2xl"></i>
                        </div>
                        <h3 class="text-xl font-bold text-dark mb-2">大学生就业核心竞争力测评</h3>
                        <p class="text-gray-500 mb-4">针对大学生群体，评估专业技能、实践能力、职业素养等就业核心竞争力，提供精准就业指导</p>
                        <a href="grad-employment-test.jsp" class="inline-flex items-center text-primary font-medium hover:underline">
                            开始测试 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>


            </div>
        </div>
    </section>

    <!-- 3. 热门测评区 -->
    <section id="assessments" class="py-16 bg-white">
        <div class="container mx-auto px-8">
            <div class="text-center mb-12">
                <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">热门职业测评</h2>
                <p class="text-gray-500 max-w-2xl mx-auto">超过10万职场人选择的科学测评工具，立即开启职业探索之旅</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-8">
                <!-- 测评卡片1：职业性格测试 -->
                <div class="bg-light rounded-xl overflow-hidden card-hover">
                    <img src="https://picsum.photos/id/1066/600/400" alt="职业性格测试" class="w-full h-48 object-cover">
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-3">
                            <h3 class="text-xl font-bold text-dark">职业性格测试</h3>
                            <span class="bg-primary/10 text-primary text-xs px-2 py-1 rounded-full">免费</span>
                        </div>
                        <p class="text-gray-500 mb-4">基于MBTI理论，分析你的性格类型与职业适配度，发现隐藏的职业潜力</p>
                        <div class="flex items-center text-sm text-gray-500 mb-4">
                            <i class="fa fa-user-o mr-1"></i> 12.5万人已测试
                            <span class="mx-2">•</span>
                            <i class="fa fa-clock-o mr-1"></i> 15分钟
                        </div>
                        <a href="mbti-test.jsp" class="w-full bg-primary hover:bg-primary/90 text-white px-6 py-3 rounded-lg font-medium transition-colors text-center">
                            开始测试
                        </a>
                    </div>
                </div>


                <!-- 测评卡片2：职业发展测试 -->
                <div class="bg-light rounded-xl overflow-hidden card-hover">
                    <img src="https://picsum.photos/id/1083/600/400" alt="职业发展测试" class="w-full h-48 object-cover">
                    <div class="p-6">
                        <div class="flex justify-between items-start mb-3">
                            <h3 class="text-xl font-bold text-dark">职业发展测试</h3>
                            <span class="bg-secondary/10 text-secondary text-xs px-2 py-1 rounded-full">￥59</span>
                        </div>
                        <p class="text-gray-500 mb-4">评估你的职业发展阶段与瓶颈，提供个性化的成长路径规划和能力提升建议</p>
                        <div class="flex items-center text-sm text-gray-500 mb-4">
                            <i class="fa fa-user-o mr-1"></i> 5.3万人已测试
                            <span class="mx-2">•</span>
                            <i class="fa fa-clock-o mr-1"></i> 25分钟
                        </div>
                        <a href="career-test.jsp" class="w-full bg-primary hover:bg-primary/90 text-white px-6 py-3 rounded-lg font-medium transition-colors text-center">
                            开始测试
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 4. 测评流程说明 -->
    <section class="py-16 bg-light">
        <div class="container mx-auto px-8">
            <div class="text-center mb-12">
                <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">职业测评流程</h2>
                <p class="text-gray-500 max-w-2xl mx-auto">简单4步，开启你的职业探索之旅</p>
            </div>

            <div class="grid grid-cols-1 md:grid-cols-4 gap-8">
                <div class="text-center">
                    <div class="w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center text-primary text-2xl font-bold mx-auto mb-4">1</div>
                    <h3 class="text-xl font-bold text-dark mb-2">选择测评</h3>
                    <p class="text-gray-500">根据职业需求，从20+测评工具中选择适合你的测评</p>
                </div>

                <div class="text-center">
                    <div class="w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center text-primary text-2xl font-bold mx-auto mb-4">2</div>
                    <h3 class="text-xl font-bold text-dark mb-2">完成测试</h3>
                    <p class="text-gray-500">在线完成测评题目，平均耗时15-30分钟，支持中途保存</p>
                </div>

                <div class="text-center">
                    <div class="w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center text-primary text-2xl font-bold mx-auto mb-4">3</div>
                    <h3 class="text-xl font-bold text-dark mb-2">生成报告</h3>
                    <p class="text-gray-500">系统自动生成多维度测评报告，包含职业建议与发展方向</p>
                </div>

                <div class="text-center">
                    <div class="w-16 h-16 rounded-full bg-primary/10 flex items-center justify-center text-primary text-2xl font-bold mx-auto mb-4">4</div>
                    <h3 class="text-xl font-bold text-dark mb-2">专家解读</h3>
                    <p class="text-gray-500">可选专家1对1报告解读服务，深入分析测评结果与职业规划</p>
                </div>
            </div>
        </div>
    </section>
</main>

<!-- 底部信息区 -->
<jsp:include page="footer.jsp"/>

<!-- 返回顶部按钮 -->
<button id="back-to-top" class="fixed bottom-6 right-6 w-12 h-12 rounded-full bg-primary text-white shadow-lg flex items-center justify-center opacity-0 invisible transition-all z-50">
    <i class="fa fa-chevron-up"></i>
</button>

<!-- JavaScript（与home.jsp一致，确保交互效果统一） -->
<script>
    // 导航栏滚动效果
    const navbar = document.getElementById('navbar');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 50) {
            navbar.classList.add('py-2', 'shadow-md');
            navbar.classList.remove('py-4');
        } else {
            navbar.classList.add('py-4');
            navbar.classList.remove('py-2', 'shadow-md');
        }
    });

    // 平滑滚动
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });

    // 返回顶部按钮
    const backToTopButton = document.getElementById('back-to-top');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 300) {
            backToTopButton.classList.remove('opacity-0', 'invisible');
            backToTopButton.classList.add('opacity-100', 'visible');
        } else {
            backToTopButton.classList.add('opacity-0', 'invisible');
            backToTopButton.classList.remove('opacity-100', 'visible');
        }
    });

    backToTopButton.addEventListener('click', () => {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    // 数字增长动画
    const animateNumbers = () => {
        const numberElements = document.querySelectorAll('.animate-number');
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const numberElement = entry.target;
                    const target = parseInt(numberElement.getAttribute('data-target'));
                    let current = 0;
                    const increment = Math.ceil(target / 50); // 分50步完成动画

                    const updateNumber = () => {
                        current += increment;
                        if (current < target) {
                            numberElement.textContent = current;
                            requestAnimationFrame(updateNumber);
                        } else {
                            numberElement.textContent = target;
                        }
                    };

                    updateNumber();
                    observer.unobserve(numberElement);
                }
            });
        }, { threshold: 0.5 });

        numberElements.forEach(element => {
            observer.observe(element);
        });
    };

    // 页面加载完成后执行动画
    window.addEventListener('load', () => {
        animateNumbers();
    });
</script>
</body>
</html>