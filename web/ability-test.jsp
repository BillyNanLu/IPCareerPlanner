<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>能力优势测评 - IP创氪师</title>
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
        }
    </style>
</head>

<body class="font-inter text-dark antialiased w-1200 mx-auto">

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

            <!-- 登录注册按钮 -->
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

<main class="pt-20 pb-16">
    <!-- 1. 测试标题区 -->
    <section class="bg-gradient-to-r from-primary/10 to-primary/5 py-12">
        <div class="container mx-auto px-8">
            <div class="max-w-4xl mx-auto text-center">
                <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark mb-4">能力优势测评</h2>
                <p class="text-gray-600 text-lg mb-6">基于职业能力模型，本测试将帮助你发现核心能力与潜在优势</p>
                <p class="text-gray-500 mb-8">请根据你的真实能力和实际表现选择答案，测试共20题，预计耗时5-8分钟</p>
            </div>
        </div>
    </section>

    <!-- 2. 测试题目区 -->
    <section class="py-12 bg-white">
        <div class="container mx-auto px-8 max-w-4xl">
            <form action="ability-result.jsp" method="post" id="test-form">
                <input type="hidden" name="answers" id="answers">

                <div id="question-1" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">1. 你最擅长的工作类型是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="R" class="mr-3 text-primary"><span>技术性操作与维护</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="I" class="mr-3 text-primary"><span>数据分析与问题解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="A" class="mr-3 text-primary"><span>创意设计与艺术表达</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="S" class="mr-3 text-primary"><span>人际沟通与团队协作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="E" class="mr-3 text-primary"><span>领导管理与项目策划</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="C" class="mr-3 text-primary"><span>细节处理与流程优化</span></label>
                    </div>
                </div>

                <div id="question-2" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">2. 在团队中，你通常承担的角色是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="R" class="mr-3 text-primary"><span>技术执行者，负责具体操作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="I" class="mr-3 text-primary"><span>智囊角色，提供专业见解</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="A" class="mr-3 text-primary"><span>创意担当，提出新颖方案</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="S" class="mr-3 text-primary"><span>协调者，促进团队沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="E" class="mr-3 text-primary"><span>领导者，规划和推动项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="C" class="mr-3 text-primary"><span>监督者，确保任务精准完成</span></label>
                    </div>
                </div>

                <div id="question-3" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">3. 面对工作挑战，你更倾向于：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="R" class="mr-3 text-primary"><span>动手操作，通过实践解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="I" class="mr-3 text-primary"><span>分析研究，寻找理论依据</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="A" class="mr-3 text-primary"><span>创新思维，设计独特方案</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S" class="mr-3 text-primary"><span>寻求帮助，集合团队智慧</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="E" class="mr-3 text-primary"><span>制定策略，领导团队攻克</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="C" class="mr-3 text-primary"><span>按计划执行，逐步解决</span></label>
                    </div>
                </div>

                <div id="question-4" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">4. 你在工作中最突出的优势是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="R" class="mr-3 text-primary"><span>操作技能熟练，动手能力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="I" class="mr-3 text-primary"><span>逻辑思维缜密，分析能力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="A" class="mr-3 text-primary"><span>想象力丰富，创造力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="S" class="mr-3 text-primary"><span>人际敏感度高，沟通能力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="E" class="mr-3 text-primary"><span>决策果断，领导力突出</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="C" class="mr-3 text-primary"><span>注重细节，执行力强</span></label>
                    </div>
                </div>

                <div id="question-5" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">5. 你更倾向于通过哪种方式学习新技能：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="R" class="mr-3 text-primary"><span>实地操作，边做边学</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="I" class="mr-3 text-primary"><span>理论学习，系统研究</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="A" class="mr-3 text-primary"><span>模仿创造，实践创新</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="S" class="mr-3 text-primary"><span>小组讨论，合作学习</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="E" class="mr-3 text-primary"><span>项目实践，领导执行</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C" class="mr-3 text-primary"><span>结构化学习，按计划练习</span></label>
                    </div>
                </div>

                <div id="question-6" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">6. 你在工作中最不擅长的是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="R" class="mr-3 text-primary"><span>机械重复的操作性工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I" class="mr-3 text-primary"><span>抽象复杂的理论分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="A" class="mr-3 text-primary"><span>无规则的创意性工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="S" class="mr-3 text-primary"><span>需要大量人际互动的工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="E" class="mr-3 text-primary"><span>需要承担领导责任的工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="C" class="mr-3 text-primary"><span>高度规范化的细节工作</span></label>
                    </div>
                </div>

                <div id="question-7" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">7. 你更愿意参与哪种类型的项目：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="R" class="mr-3 text-primary"><span>设备安装与维护项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="I" class="mr-3 text-primary"><span>数据分析与研究项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="A" class="mr-3 text-primary"><span>创意设计与艺术项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="S" class="mr-3 text-primary"><span>社区服务与教育项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="E" class="mr-3 text-primary"><span>商业策划与推广项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C" class="mr-3 text-primary"><span>流程优化与管理项目</span></label>
                    </div>
                </div>

                <div id="question-8" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">8. 你认为自己的核心竞争力在于：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="R" class="mr-3 text-primary"><span>熟练掌握专业技术技能</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="I" class="mr-3 text-primary"><span>深入的专业知识储备</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="A" class="mr-3 text-primary"><span>独特的创意和创新能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="S" class="mr-3 text-primary"><span>良好的人际关系和沟通能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="E" class="mr-3 text-primary"><span>卓越的领导和管理能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="C" class="mr-3 text-primary"><span>严谨的工作态度和执行力</span></label>
                    </div>
                </div>

                <div id="question-9" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">9. 你更希望在工作中发展哪方面的能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="R" class="mr-3 text-primary"><span>专业技术操作能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="I" class="mr-3 text-primary"><span>科学研究与分析能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="A" class="mr-3 text-primary"><span>艺术创作与设计能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="S" class="mr-3 text-primary"><span>人际沟通与服务能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="E" class="mr-3 text-primary"><span>领导决策与管理能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="C" class="mr-3 text-primary"><span>细节处理与组织能力</span></label>
                    </div>
                </div>

                <div id="question-10" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">10. 你在团队中的贡献通常是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="R" class="mr-3 text-primary"><span>完成具体的技术操作任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="I" class="mr-3 text-primary"><span>提供专业的分析和建议</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="A" class="mr-3 text-primary"><span>提出创新的想法和方案</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S" class="mr-3 text-primary"><span>协调团队关系和沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="E" class="mr-3 text-primary"><span>制定计划和推动执行</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="C" class="mr-3 text-primary"><span>确保任务的精准完成</span></label>
                    </div>
                </div>

                <div id="question-11" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">11. 你处理信息的方式更倾向于：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="R" class="mr-3 text-primary"><span>通过实际操作处理信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="I" class="mr-3 text-primary"><span>通过逻辑分析处理信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="A" class="mr-3 text-primary"><span>通过创意联想处理信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="S" class="mr-3 text-primary"><span>通过与人讨论处理信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="E" class="mr-3 text-primary"><span>通过目标导向处理信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="C" class="mr-3 text-primary"><span>通过系统整理处理信息</span></label>
                    </div>
                </div>

                <div id="question-12" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">12. 你更擅长应对哪种工作场景：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="R" class="mr-3 text-primary"><span>需要动手操作的工作场景</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="I" class="mr-3 text-primary"><span>需要深度思考的工作场景</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="A" class="mr-3 text-primary"><span>需要创意表达的工作场景</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="S" class="mr-3 text-primary"><span>需要人际互动的工作场景</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="E" class="mr-3 text-primary"><span>需要领导决策的工作场景</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="C" class="mr-3 text-primary"><span>需要细致严谨的工作场景</span></label>
                    </div>
                </div>

                <div id="question-13" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">13. 你在工作中获取成就感的方式是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="R" class="mr-3 text-primary"><span>成功完成技术性任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="I" class="mr-3 text-primary"><span>解决复杂的理论问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="A" class="mr-3 text-primary"><span>创造出独特的作品或方案</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="S" class="mr-3 text-primary"><span>帮助他人解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="E" class="mr-3 text-primary"><span>成功领导项目达成目标</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="C" class="mr-3 text-primary"><span>精准完成细节性工作</span></label>
                    </div>
                </div>

                <div id="question-14" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">14. 同事通常如何评价你的工作能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="R" class="mr-3 text-primary"><span>"技术过硬，动手能力强"</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="I" class="mr-3 text-primary"><span>"思维缜密，分析能力强"</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="A" class="mr-3 text-primary"><span>"创意十足，想法独特"</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="S" class="mr-3 text-primary"><span>"善于沟通，团队协作能力强"</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="E" class="mr-3 text-primary"><span>"有领导力，能推动项目"</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="C" class="mr-3 text-primary"><span>"细致认真，执行力强"</span></label>
                    </div>
                </div>

                <div id="question-15" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">15. 你理想的工作能力组合是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="R" class="mr-3 text-primary"><span>专业技术能力+动手操作能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="I" class="mr-3 text-primary"><span>研究分析能力+逻辑思维能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="A" class="mr-3 text-primary"><span>创意设计能力+艺术表达能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="S" class="mr-3 text-primary"><span>人际沟通能力+团队协作能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="E" class="mr-3 text-primary"><span>领导管理能力+决策执行能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="C" class="mr-3 text-primary"><span>细节处理能力+流程管理能力</span></label>
                    </div>
                </div>

                <div id="question-16" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">16. 你在工作中解决问题的方式是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="R" class="mr-3 text-primary"><span>通过实际操作尝试解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="I" class="mr-3 text-primary"><span>通过数据分析和研究</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="A" class="mr-3 text-primary"><span>通过创意和灵感</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="S" class="mr-3 text-primary"><span>通过团队讨论和协作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="E" class="mr-3 text-primary"><span>通过制定策略和计划</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="C" class="mr-3 text-primary"><span>通过流程和规范</span></label>
                    </div>
                </div>

                <div id="question-17" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">17. 你更倾向于发展以下哪种专业能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="R" class="mr-3 text-primary"><span>工程技术、机械操作能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="I" class="mr-3 text-primary"><span>科学研究、数据分析能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="A" class="mr-3 text-primary"><span>艺术创作、设计创新能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="S" class="mr-3 text-primary"><span>心理咨询、教育辅导能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="E" class="mr-3 text-primary"><span>市场营销、管理策划能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="C" class="mr-3 text-primary"><span>财务会计、行政办公能力</span></label>
                    </div>
                </div>

                <div id="question-18" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">18. 你在工作中最常使用的工具是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="R" class="mr-3 text-primary"><span>专业设备和工具</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="I" class="mr-3 text-primary"><span>数据分析和研究工具</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="A" class="mr-3 text-primary"><span>创意设计软件和工具</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="S" class="mr-3 text-primary"><span>沟通协作平台和工具</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="E" class="mr-3 text-primary"><span>项目管理和策划工具</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="C" class="mr-3 text-primary"><span>文档处理和办公软件</span></label>
                    </div>
                </div>

                <div id="question-19" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">19. 你认为自己的工作风格是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="R" class="mr-3 text-primary"><span>务实型，注重实际操作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="I" class="mr-3 text-primary"><span>研究型，注重理论分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="A" class="mr-3 text-primary"><span>创意型，注重创新表达</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="S" class="mr-3 text-primary"><span>社交型，注重人际互动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="E" class="mr-3 text-primary"><span>领导型，注重目标达成</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="C" class="mr-3 text-primary"><span>规范型，注重细节流程</span></label>
                    </div>
                </div>

                <div id="question-20" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">20. 如果更换工作，你希望提升哪方面的能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="R" class="mr-3 text-primary"><span>更专业的技术操作能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="I" class="mr-3 text-primary"><span>更深入的研究分析能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="A" class="mr-3 text-primary"><span>更突出的创意设计能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="S" class="mr-3 text-primary"><span>更优秀的人际沟通能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E" class="mr-3 text-primary"><span>更强的领导管理能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="C" class="mr-3 text-primary"><span>更细致的流程管理能力</span></label>
                    </div>
                </div>

                <div class="text-center mt-12">
                    <button type="submit" class="bg-primary hover:bg-primary/90 text-white px-8 py-3 rounded-lg font-medium transition-colors text-lg shadow-md hover:shadow-lg transform hover:-translate-y-0.5">提交测试 <i class="fa fa-arrow-right ml-2"></i></button>
                </div>
            </form>
        </div>
    </section>
</main>

<button id="back-to-top" class="fixed bottom-6 right-6 w-12 h-12 rounded-full bg-primary text-white shadow-lg flex items-center justify-center opacity-0 invisible transition-all z-50"><i class="fa fa-chevron-up"></i></button>

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
                window.scrollTo({top: targetElement.offsetTop - 80, behavior: 'smooth'});
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
        window.scrollTo({top: 0, behavior: 'smooth'});
    });

    // 表单提交前验证所有题目是否已回答
    const testForm = document.getElementById('test-form');
    document.addEventListener('DOMContentLoaded', function() {
        if (!testForm) {
            console.error('未找到测试表单，请检查页面结构');
            return;
        }

        testForm.addEventListener('submit', function(e) {
            console.group('【能力优势测评】表单验证流程');
            const questionInputs = Array.from(document.querySelectorAll('input[type="radio"][name^="q"]'));
            if (questionInputs.length === 0) {
                e.preventDefault();
                console.error('未检测到任何题目选项，请刷新页面或检查HTML结构');
                alert('表单加载异常，请刷新页面后重试');
                console.groupEnd();
                return;
            }

            const questionGroups = {};
            questionInputs.forEach(input => {
                if (!questionGroups[input.name]) questionGroups[input.name] = [];
                questionGroups[input.name].push(input);
            });

            const questionCount = Object.keys(questionGroups).length;
            let allAnswered = true, firstUnanswered = null;

            for (const [name, group] of Object.entries(questionGroups)) {
                if (!group.some(input => input.checked)) {
                    allAnswered = false;
                    firstUnanswered = name;
                    break;
                }
            }

            if (!allAnswered) {
                e.preventDefault();
                const questionNum = firstUnanswered.replace('q', '');
                console.error(`验证失败：第 ${questionNum} 题未回答`);
                const questionElement = document.getElementById(`question-${questionNum}`);
                if (questionElement) {
                    questionElement.classList.add('border-red-500', 'bg-red-50');
                    setTimeout(() => questionElement.classList.remove('border-red-500', 'bg-red-50'), 3000);
                }
                alert(`请先完成所有题`);
            } else {
                console.log('所有题目已回答，允许提交');
                const answers = {};
                questionInputs.forEach(input => {if (input.checked) answers[input.name] = input.value;});

                if (Object.keys(answers).length !== questionCount) {
                    e.preventDefault();
                    console.error('答案收集异常：答案数量与题目数量不一致');
                    alert('答案处理异常，请刷新页面后重试');
                    console.groupEnd();
                    return;
                }

                document.getElementById('answers').value = JSON.stringify(answers);
                console.log('答案已序列化，准备提交表单');
            }
            console.groupEnd();
        });
    });
</script>

</body>
</html>