<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    // 解析请求参数并计算各维度得分（此处逻辑仅为示例，实际需根据职业发展测试维度调整）
    String[] answers = request.getParameterValues("answers");
    int[] scores = new int[5]; // 目标清晰度、成长动力、适应能力、协作能力、抗压能力

    if (answers != null) {
        for (String answer : answers) {
            // 简化的计分逻辑，实际需根据题目维度对应关系调整
            if (answer.startsWith("G")) scores[0]++;
            else if (answer.startsWith("B")) scores[1]++;
            else if (answer.startsWith("I")) scores[2]++;
            else if (answer.startsWith("T")) scores[3]++;
            else if (answer.startsWith("P")) scores[4]++;
        }
    }

    // 找到关键发展维度（示例逻辑）
    int keyIndex = 0;
    for (int i = 1; i < scores.length; i++) {
        if (scores[i] > scores[keyIndex]) {
            keyIndex = i;
        }
    }

    // 职业发展状态类型
    String[] types = {"目标驱动型", "成长导向型", "适应灵活型", "协作高效型", "抗压稳健型"};
    String resultType = types[keyIndex];

    // 类型对应的详细描述
    String[] typeDescriptions = {
            "目标驱动型的你对职业目标有清晰规划，善于制定计划并推进执行。你重视结果达成，能围绕目标分配资源，面对诱惑时不易偏离方向，但需注意灵活调整计划以应对变化。",
            "成长导向型的你持续投入技能提升，视挑战为成长机会。你主动学习新知识，善于从经验中总结提升，对职业倦怠有较好的应对能力，但需平衡投入与产出的性价比。",
            "适应灵活型的你能快速应对行业变革，擅长在变化中寻找机会。你对新兴事物接受度高，跨部门协作能力强，能根据环境调整工作方式，但需注意建立核心竞争力以避免精力分散。",
            "协作高效型的你在团队中定位清晰，善于沟通协调资源。你重视团队氛围与人际关系，能通过协作放大工作成果，领导认可度高，但需注意提升独立解决问题的能力。",
            "抗压稳健型的你在高压环境下仍能保持效率，职业安全感强。你注重工作稳定性，风险意识强，能冷静处理突发问题，但需适当突破舒适区以获得更大发展。"
    };

    // 发展路径建议
    String[][] developmentSuggestions = {
            {"短期（3-6个月）：细化目标拆解，制定月度里程碑并跟踪进度", "中期（1-2年）：建立目标复盘机制，每季度评估调整方向", "长期（3-5年）：拓展目标维度，平衡职业与生活目标的协同发展"},
            {"短期（3-6个月）：聚焦1-2项核心技能，通过实践项目巩固", "中期（1-2年）：构建技能体系，形成差异化竞争优势", "长期（3-5年）：向行业专家方向发展，建立知识分享机制"},
            {"短期（3-6个月）：深入了解行业趋势，识别1-2个新兴机会", "中期（1-2年）：在主领域深耕的同时，拓展相关领域能力", "长期（3-5年）：成为跨领域连接者，搭建资源整合平台"},
            {"短期（3-6个月）：提升沟通技巧，学习高效协作工具使用", "中期（1-2年）：尝试主导小型项目，锻炼协调能力", "长期（3-5年）：向管理岗发展，培养团队带领能力"},
            {"短期（3-6个月）：学习压力管理技巧，建立工作节奏规律", "中期（1-2年）：适度接受挑战性任务，逐步扩大舒适区", "长期（3-5年）：在稳健基础上尝试创新，平衡安全与突破"}
    };
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>职业发展测试结果 - IP创氪师</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/line-clamp"></script>
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
                    fontSize: {
                        base: ['1rem', '1.5rem'],
                        sm: ['0.875rem', '1.25rem'],
                        md: ['1rem', '1.5rem'],
                        lg: ['1.125rem', '1.75rem'],
                        xl: ['1.25rem', '1.75rem'],
                        '2xl': ['1.5rem', '2rem'],
                    }
                },
            }
        }
    </script>

    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto { content-visibility: auto; }
            .text-shadow { text-shadow: 0 2px 4px rgba(0,0,0,0.1); }
            .transition-navbar { transition: background-color 0.3s, box-shadow 0.3s, padding 0.3s; }
            .card-hover { transition: transform 0.3s, box-shadow 0.3s; }
            .card-hover:hover { transform: translateY(-5px); }
            .animate-number { animation: number-grow 2s ease-out forwards; opacity: 0; }
            @keyframes number-grow { 0% { opacity: 0; transform: scale(0.8); } 100% { opacity: 1; transform: scale(1); } }
            .bg-gradient-hero { background: rgba(150, 174, 253, 0.3); }
            .ml-50px { margin-left: 50px; }
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

            <div class="flex items-center space-x-4">
                <div class="flex items-center space-x-4">
                    <c:choose>
                        <c:when test="${not empty loginUser}">
                            <div class="flex items-center space-x-2">
                                <c:choose>
                                    <c:when test="${not empty loginUser.avatar}">
                                        <img src="${pageContext.request.contextPath}${loginUser.avatar}" alt="头像" class="w-8 h-8 rounded-full object-cover border border-gray-300">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="image/users/defaultavatars.jpg" alt="默认头像" class="w-8 h-8 rounded-full object-cover border border-gray-300">
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
                    <a href="consult.jsp" class="bg-secondary hover:bg-secondary/90 text-white px-5 py-2 rounded-full font-medium transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5">在线咨询</a>
                </div>
            </div>
        </div>
    </div>
</header>

<main class="pt-16 pb-12">
    <section class="bg-gradient-hero pt-12 min-h-[200px] flex items-center">
        <div class="container mx-auto px-4 relative z-10">
            <div class="max-w-3xl ml-50px">
                <h2 class="text-[clamp(1.75rem,3vw,2.5rem)] font-bold text-dark leading-tight text-shadow mb-4">职业发展测试结果</h2>
                <p class="text-[clamp(1rem,1.5vw,1.25rem)] text-dark mb-6 max-w-2xl">基于职业发展阶段理论与职场大数据，你的职业发展状态评估已完成，以下是详细分析结果</p>
            </div>
        </div>
    </section>

    <!-- 结果卡片区 -->
    <section class="py-12 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <!-- 主要结果卡片 -->
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <div class="flex items-start justify-between mb-6">
                            <div>
                                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-3">你的职业发展类型是：<span class="text-primary"><%= resultType %></span></h2>
                                <p class="text-gray-600 text-base mb-4">根据你的回答，我们从职业目标、成长动力、适应能力等维度进行了综合评估</p>
                            </div>
                        </div>
                        <div class="mb-6">
                            <h3 class="text-lg md:text-xl font-bold text-dark mb-4">职业发展状态分析</h3>
                            <p class="text-gray-600 text-base"><%= typeDescriptions[keyIndex] %></p>
                        </div>
                    </div>
                </div>

                <!-- 发展路径建议卡片 -->
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <h3 class="text-lg md:text-xl font-bold text-dark mb-5">发展路径建议</h3>
                        <div class="space-y-4">
                            <p class="text-gray-600 text-base mb-4">根据你的职业发展状态，以下是分阶段的成长建议：</p>
                            <ul class="space-y-3">
                                <% for (String suggestion : developmentSuggestions[keyIndex]) { %>
                                <li class="flex items-start text-base"><i class="fa fa-check text-primary mr-2 text-sm mt-1"></i><span><%= suggestion %></span></li>
                                <% } %>
                            </ul>
                            <div class="mt-7 pt-5 border-t border-gray-100 flex flex-col md:flex-row gap-3">
                                <a href="consult.jsp" class="flex-1 bg-primary hover:bg-primary/90 text-white px-5 py-3 rounded-lg text-base font-medium transition-colors text-center">职业规划咨询</a>
                                <a href="evaluation.jsp" class="flex-1 bg-white border border-primary text-primary hover:bg-primary/5 px-5 py-3 rounded-lg text-base font-medium transition-colors text-center">查看更多测评</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- 职业发展提升建议区 -->
    <section id="suggestions" class="py-12 bg-light">
        <div class="container mx-auto px-4">
            <div class="text-center mb-8">
                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-4">职业发展提升建议</h2>
                <p class="text-gray-500 text-base max-w-2xl mx-auto">根据你的职业发展状态，为你提供针对性的提升方向与资源</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7">
                <!-- 建议1 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-bullseye text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">目标管理优化</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (keyIndex) {
                                case 0: out.println("建议引入OKR或KPI管理工具，将长期目标分解为季度、月度可执行任务，每月进行进度复盘与调整。"); break;
                                case 1: out.println("建议结合职业发展阶段设定技能提升优先级，聚焦1-2个核心领域深耕，避免资源分散影响成长效率。"); break;
                                case 2: out.println("建议在适应变化的同时，建立核心能力锚点，通过「T型」发展模式平衡广度与深度，增强职业抗风险能力。"); break;
                                case 3: out.println("建议设定个人独立负责的项目目标，在协作中强化自主决策能力，逐步从执行者向主导者转变。"); break;
                                case 4: out.println("建议采用「小步快跑」策略，每月设定1个小幅突破舒适区的目标，在可控风险中积累成长经验。"); break;
                            }
                        %>
                    </p>
                </div>

                <!-- 建议2 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-line-chart text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">瓶颈突破策略</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (keyIndex) {
                                case 0: out.println("当目标执行遇阻时，可采用「5Why」分析法追溯根本原因，或寻求同行经验借鉴，避免陷入计划僵化。"); break;
                                case 1: out.println("面对技能提升瓶颈，可尝试「教是最好的学」模式，通过分享倒逼深入理解，或参与行业交流拓展思路。"); break;
                                case 2: out.println("行业变革期的瓶颈可通过跨界学习打破，寻找相邻领域的知识迁移点，构建差异化竞争力。"); break;
                                case 3: out.println("协作瓶颈可通过明确角色边界与沟通规则解决，必要时学习冲突管理技巧，提升跨团队协作效率。"); break;
                                case 4: out.println("突破抗压瓶颈可从压力源分类入手，区分可控与不可控因素，聚焦能改变的部分制定应对方案。"); break;
                            }
                        %>
                    </p>
                </div>

                <!-- 建议3 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-graduation-cap text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">成长资源推荐</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (keyIndex) {
                                case 0: out.println("推荐阅读《目标管理》《高效能人士的七个习惯》，学习使用Toggl Plan等目标追踪工具，参与目标管理工作坊。"); break;
                                case 1: out.println("建议学习《刻意练习》《终身成长》，使用Coursera等平台系统学习专业课程，加入行业技能交流社群。"); break;
                                case 2: out.println("推荐关注《哈佛商业评论》行业变革专栏，学习《创新者的窘境》，参加行业趋势论坛与跨界交流活动。"); break;
                                case 3: out.println("建议阅读《团队协作的五大障碍》《沟通的艺术》，学习使用Notion等协作工具，参与团队管理培训。"); break;
                                case 4: out.println("推荐学习《压力管理心理学》《自控力》，尝试冥想等减压方法，参加高压环境下的项目实践锻炼。"); break;
                            }
                        %>
                    </p>
                </div>
            </div>
        </div>
    </section>
</main>

<button id="back-to-top" class="fixed bottom-5 right-5 w-12 h-12 rounded-full bg-primary text-white shadow-lg flex items-center justify-center opacity-0 invisible transition-all z-50"><i class="fa fa-chevron-up text-base"></i></button>

<script>
    // 导航栏滚动效果
    const navbar = document.getElementById('navbar');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 30) {
            navbar.classList.add('py-1.5', 'shadow-md');
            navbar.classList.remove('py-3');
        } else {
            navbar.classList.add('py-3');
            navbar.classList.remove('py-1.5', 'shadow-md');
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
                window.scrollTo({top: targetElement.offsetTop - 60, behavior: 'smooth'});
            }
        });
    });

    // 返回顶部按钮
    const backToTopButton = document.getElementById('back-to-top');
    window.addEventListener('scroll', () => {
        if (window.scrollY > 200) {
            backToTopButton.classList.remove('opacity-0', 'invisible');
            backToTopButton.classList.add('opacity-100', 'visible');
        } else {
            backToTopButton.classList.add('opacity-0', 'invisible');
            backToTopButton.classList.remove('opacity-100', 'visible');
        }
    });

    backToTopButton.addEventListener('click', () => {
        window.scrollTo({top: 0, behavior: 'smooth'});
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
                    const increment = Math.ceil(target / 50);

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