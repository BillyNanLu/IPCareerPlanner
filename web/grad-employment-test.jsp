<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>大学生就业核心竞争力测评 - IP创氪师</title>
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
<main class="pt-20 pb-16">
    <section class="bg-gradient-to-r from-primary/10 to-primary/5 py-12">
        <div class="container mx-auto px-8">
            <div class="max-w-4xl mx-auto text-center">
                <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark mb-4">大学生就业核心竞争力测评</h2>
                <p class="text-gray-600 text-lg mb-6">本测试将全面评估你的就业核心竞争力，包括专业技能、实践能力、职业素养等维度</p>
                <p class="text-gray-500 mb-8">请根据你的真实情况选择答案，测试共20题，预计耗时8-10分钟</p>
            </div>
        </div>
    </section>
    <section class="py-12 bg-white">
        <div class="container mx-auto px-8 max-w-4xl">
            <form action="grad-employment-result.jsp" method="post" id="test-form">
                <input type="hidden" name="answers" id="answers">
                <div id="question-1" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">1. 你对专业核心课程的掌握程度是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="S" class="mr-3 text-primary"><span>优秀，能灵活运用专业知识解决复杂问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="P" class="mr-3 text-primary"><span>良好，掌握主要知识点，能完成常规任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="C" class="mr-3 text-primary"><span>一般，基本概念清楚，但应用能力有限</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="T" class="mr-3 text-primary"><span>薄弱，仅了解基础内容，缺乏实践应用</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="L" class="mr-3 text-primary"><span>较差，对多数知识点理解不深入</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="M" class="mr-3 text-primary"><span>未系统学习，仅零散了解部分内容</span></label>
                    </div>
                </div>
                <div id="question-2" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">2. 你的实习经历情况是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="S" class="mr-3 text-primary"><span>3次以上相关行业实习，担任过重要角色</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="P" class="mr-3 text-primary"><span>1-2次相关实习，参与过实际项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="C" class="mr-3 text-primary"><span>有1次短期实习，以观察学习为主</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="T" class="mr-3 text-primary"><span>无专业相关实习，但有其他兼职经历</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="L" class="mr-3 text-primary"><span>仅参与过校园内的模拟实践活动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="M" class="mr-3 text-primary"><span>无任何实习或实践经历</span></label>
                    </div>
                </div>
                <div id="question-3" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">3. 你在团队项目中通常扮演的角色是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S" class="mr-3 text-primary"><span>领导者，负责统筹规划和决策</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="P" class="mr-3 text-primary"><span>核心执行者，承担关键任务完成</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="C" class="mr-3 text-primary"><span>协调者，促进团队沟通与合作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="T" class="mr-3 text-primary"><span>创意贡献者，提供想法和建议</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="L" class="mr-3 text-primary"><span>普通参与者，完成分配的基础任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="M" class="mr-3 text-primary"><span>较少参与团队项目，缺乏经验</span></label>
                    </div>
                </div>
                <div id="question-4" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">4. 你的英语能力水平是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="S" class="mr-3 text-primary"><span>精通，可作为工作语言无障碍沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="P" class="mr-3 text-primary"><span>熟练，CET-6 500+或同等水平，读写流利</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="C" class="mr-3 text-primary"><span>良好，CET-4通过，能进行简单交流</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="T" class="mr-3 text-primary"><span>基础，掌握日常词汇，阅读简单文本</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="L" class="mr-3 text-primary"><span>薄弱，仅能理解少量基础表达</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="M" class="mr-3 text-primary"><span>较差，基本不具备英语应用能力</span></label>
                    </div>
                </div>
                <div id="question-5" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">5. 你掌握的专业相关技能证书情况：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="S" class="mr-3 text-primary"><span>持有3个以上高含金量证书（如行业认证）</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="P" class="mr-3 text-primary"><span>持有2-3个与专业相关的主流证书</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C" class="mr-3 text-primary"><span>持有1个基础证书或技能认证</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="T" class="mr-3 text-primary"><span>正在备考1-2个相关证书</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="L" class="mr-3 text-primary"><span>了解证书重要性，但未开始准备</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="M" class="mr-3 text-primary"><span>无任何专业相关证书，也不了解</span></label>
                    </div>
                </div>
                <div id="question-6" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">6. 你的计算机应用能力（如Office、专业软件）：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="S" class="mr-3 text-primary"><span>精通，能熟练使用专业软件并解决复杂问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="P" class="mr-3 text-primary"><span>熟练，能高效使用Office及1-2种专业软件</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="C" class="mr-3 text-primary"><span>良好，能满足日常办公和学习需求</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="T" class="mr-3 text-primary"><span>一般，掌握基础操作，复杂功能需学习</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="L" class="mr-3 text-primary"><span>薄弱，仅会简单操作，效率较低</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="M" class="mr-3 text-primary"><span>较差，依赖他人指导完成操作</span></label>
                    </div>
                </div>
                <div id="question-7" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">7. 你在公开场合的表达与演讲能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="S" class="mr-3 text-primary"><span>优秀，能清晰表达观点并吸引听众</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="P" class="mr-3 text-primary"><span>良好，能有条理地完成演讲并回应问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C" class="mr-3 text-primary"><span>一般，准备充分时能完成基本表达</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="T" class="mr-3 text-primary"><span>略有紧张，但能完成核心内容表达</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="L" class="mr-3 text-primary"><span>紧张明显，表达不够流畅</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="M" class="mr-3 text-primary"><span>畏惧公开表达，难以完成演讲</span></label>
                    </div>
                </div>
                <div id="question-8" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">8. 你对行业发展趋势的了解程度：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="S" class="mr-3 text-primary"><span>深入了解，持续关注并分析行业动态</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="P" class="mr-3 text-primary"><span>比较了解，知道主要发展方向和热点</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="C" class="mr-3 text-primary"><span>一般了解，知道基本情况和趋势</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="T" class="mr-3 text-primary"><span>了解较少，仅听说过部分信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="L" class="mr-3 text-primary"><span>不太了解，对行业趋势无清晰认识</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="M" class="mr-3 text-primary"><span>完全不了解，从未关注过行业动态</span></label>
                    </div>
                </div>
                <div id="question-9" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">9. 你参与过的科研或学术项目情况：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="S" class="mr-3 text-primary"><span>作为核心成员参与并发表相关成果</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="P" class="mr-3 text-primary"><span>参与过校级以上项目，有实质贡献</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="C" class="mr-3 text-primary"><span>参与过课程相关小型研究项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T" class="mr-3 text-primary"><span>了解科研流程，但未实际参与</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="L" class="mr-3 text-primary"><span>仅在课堂上学习过相关知识</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="M" class="mr-3 text-primary"><span>未接触过任何科研或学术项目</span></label>
                    </div>
                </div>
                <div id="question-10" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">10. 你的时间管理能力表现为：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S" class="mr-3 text-primary"><span>优秀，能高效规划并按时完成多项任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="P" class="mr-3 text-primary"><span>良好，能合理安排时间，基本不拖延</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="C" class="mr-3 text-primary"><span>一般，多数任务能按时完成，偶尔拖延</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="T" class="mr-3 text-primary"><span>较差，经常拖延，需他人提醒</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="L" class="mr-3 text-primary"><span>混乱，难以规划时间，常完不成任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="M" class="mr-3 text-primary"><span>无规划习惯，完全凭感觉安排时间</span></label>
                    </div>
                </div>
                <div id="question-11" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">11. 你处理人际关系与沟通协调的能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="S" class="mr-3 text-primary"><span>优秀，能快速融入团队并化解冲突</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="P" class="mr-3 text-primary"><span>良好，能与不同类型的人有效沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="C" class="mr-3 text-primary"><span>一般，能维持基本人际关系</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="T" class="mr-3 text-primary"><span>略有欠缺，需主动努力才能有效沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="L" class="mr-3 text-primary"><span>比较薄弱，不擅长主动与人交流</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="M" class="mr-3 text-primary"><span>欠缺，常因沟通问题产生矛盾</span></label>
                    </div>
                </div>
                <div id="question-12" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">12. 你对职业规划的清晰度：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="S" class="mr-3 text-primary"><span>非常清晰，有明确的短期和长期目标</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="P" class="mr-3 text-primary"><span>比较清晰，知道1-3年的发展方向</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="C" class="mr-3 text-primary"><span>有大致方向，但具体路径不明确</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="T" class="mr-3 text-primary"><span>不太明确，对未来感到迷茫</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L" class="mr-3 text-primary"><span>几乎没有规划，走一步看一步</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="M" class="mr-3 text-primary"><span>完全没有概念，从未考虑过职业规划</span></label>
                    </div>
                </div>
                <div id="question-13" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">13. 你应对压力和挫折的能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="S" class="mr-3 text-primary"><span>很强，能快速调整心态并解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="P" class="mr-3 text-primary"><span>较强，面对压力能保持积极态度</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="C" class="mr-3 text-primary"><span>一般，能承受普通压力，偶尔会焦虑</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="T" class="mr-3 text-primary"><span>较弱，压力大时容易情绪低落</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="L" class="mr-3 text-primary"><span>较差，遇到挫折容易放弃</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="M" class="mr-3 text-primary"><span>很弱，难以承受压力，易受打击</span></label>
                    </div>
                </div>
                <div id="question-14" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">14. 你获取就业信息的能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="S" class="mr-3 text-primary"><span>优秀，能通过多渠道精准获取有效信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P" class="mr-3 text-primary"><span>良好，熟悉主流招聘平台和信息渠道</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="C" class="mr-3 text-primary"><span>一般，能获取基本信息，但不够全面</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="T" class="mr-3 text-primary"><span>较弱，主要依赖学校或他人推荐</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="L" class="mr-3 text-primary"><span>较差，不了解有效信息获取方式</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="M" class="mr-3 text-primary"><span>几乎不主动获取就业相关信息</span></label>
                    </div>
                </div>
                <div id="question-15" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">15. 你的简历制作与面试准备能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="S" class="mr-3 text-primary"><span>优秀，能制作针对性简历，面试表现突出</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="P" class="mr-3 text-primary"><span>良好，简历完整，掌握基本面试技巧</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="C" class="mr-3 text-primary"><span>一般，能制作基础简历，简单应对面试</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="T" class="mr-3 text-primary"><span>较弱，简历不够规范，面试容易紧张</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="L" class="mr-3 text-primary"><span>较差，简历存在明显不足，缺乏面试准备</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="M" class="mr-3 text-primary"><span>未制作过简历，对面试流程完全不了解</span></label>
                    </div>
                </div>
                <div id="question-16" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">16. 你对自我优势与不足的认知清晰度：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="S" class="mr-3 text-primary"><span>非常清晰，能准确认知并有效发挥优势</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="P" class="mr-3 text-primary"><span>比较清晰，了解主要优势和需要改进的地方</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="C" class="mr-3 text-primary"><span>一般，对自身特点有基本认识，但不够深入</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="T" class="mr-3 text-primary"><span>模糊，不太清楚自己的优势和不足</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="L" class="mr-3 text-primary"><span>较模糊，常被他人评价影响自我认知</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="M" class="mr-3 text-primary"><span>完全不了解，很少思考自身特点</span></label>
                    </div>
                </div>
                <div id="question-17" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">17. 你的学习主动性与新知识接受能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="S" class="mr-3 text-primary"><span>很强，主动学习新知识并快速掌握</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="P" class="mr-3 text-primary"><span>较强，能积极学习并应用新技能</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="C" class="mr-3 text-primary"><span>一般，在要求下能完成学习任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="T" class="mr-3 text-primary"><span>较弱，被动学习，接受新知识较慢</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="L" class="mr-3 text-primary"><span>较差，缺乏学习动力，对新知识抵触</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="M" class="mr-3 text-primary"><span>几乎没有主动学习意识，仅限课堂内容</span></label>
                    </div>
                </div>
                <div id="question-18" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">18. 你参与校园活动与社会实践的情况：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="S" class="mr-3 text-primary"><span>丰富，担任过社团负责人，参与多次实践</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="P" class="mr-3 text-primary"><span>较多，积极参与社团活动和社会实践</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="C" class="mr-3 text-primary"><span>一般，参与过部分活动，担任普通成员</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="T" class="mr-3 text-primary"><span>较少，偶尔参与，不常投入时间</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="L" class="mr-3 text-primary"><span>很少，几乎不参与校园活动和实践</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="M" class="mr-3 text-primary"><span>从未参与任何校园活动或社会实践</span></label>
                    </div>
                </div>
                <div id="question-19" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">19. 你的创新思维与解决问题的能力：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="S" class="mr-3 text-primary"><span>优秀，能提出创新方案并有效解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="P" class="mr-3 text-primary"><span>良好，能找到多种解决方案并选择最优</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="C" class="mr-3 text-primary"><span>一般，能解决常规问题，缺乏创新性</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="T" class="mr-3 text-primary"><span>较弱，需他人指导才能解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="L" class="mr-3 text-primary"><span>较差，面对问题容易束手无策</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="M" class="mr-3 text-primary"><span>缺乏解决问题的思路，依赖他人帮助</span></label>
                    </div>
                </div>
                <div id="question-20" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">20. 你对职场规则与职业素养的了解：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="S" class="mr-3 text-primary"><span>深入了解，具备良好的职业素养和规则意识</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="P" class="mr-3 text-primary"><span>比较了解，知道基本职场礼仪和规范</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="C" class="mr-3 text-primary"><span>一般，对职场规则有基础认识</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="T" class="mr-3 text-primary"><span>了解较少，仅知道部分基本规则</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="L" class="mr-3 text-primary"><span>不太了解，对职场规范缺乏概念</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="M" class="mr-3 text-primary"><span>完全不了解，未关注过职场相关知识</span></label>
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
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            if (targetId === '#') return;
            const targetElement = document.querySelector(targetId);
            if (targetElement) window.scrollTo({top: targetElement.offsetTop - 80, behavior: 'smooth'});
        });
    });
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
    document.addEventListener('DOMContentLoaded', function() {
        const testForm = document.getElementById('test-form');
        if (!testForm) {console.error('未找到测试表单，请检查页面结构'); return;}
        testForm.addEventListener('submit', function(e) {
            console.group('【大学生就业核心竞争力测评】表单验证流程');
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
