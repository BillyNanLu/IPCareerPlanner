<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>职业发展测试 - IP创氪师</title>

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
                <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark mb-4">职业发展测试</h2>
                <p class="text-gray-600 text-lg mb-6">基于职业发展阶段理论与职场大数据，本测试将帮助你评估职业发展状态、瓶颈与潜力，明确未来成长路径</p>
                <p class="text-gray-500 mb-8">请根据你的真实想法和感受选择答案，测试共20题，预计耗时5-8分钟</p>
            </div>
        </div>
    </section>

    <section class="py-12 bg-white">
        <div class="container mx-auto px-8 max-w-4xl">
            <form action="career-result.jsp" method="post" id="test-form">
                <input type="hidden" name="answers" id="answers">

                <div id="question-1" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">1. 你对自己未来3年的职业目标清晰度如何？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="G1" class="mr-3 text-primary"><span>非常清晰，有具体实施计划</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="G2" class="mr-3 text-primary"><span>有大致方向，未细化计划</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="G3" class="mr-3 text-primary"><span>模糊不清，随遇而安</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="G4" class="mr-3 text-primary"><span>完全没有目标，走一步看一步</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="G5" class="mr-3 text-primary"><span>有目标但与现实脱节</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="G6" class="mr-3 text-primary"><span>目标频繁变化，难以坚持</span></label>
                    </div>
                </div>

                <div id="question-2" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">2. 当工作中遇到瓶颈时，你通常会？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="B1" class="mr-3 text-primary"><span>主动学习相关技能突破瓶颈</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="B2" class="mr-3 text-primary"><span>向同事或上级请教方法</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="B3" class="mr-3 text-primary"><span>暂时搁置，等待合适时机</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="B4" class="mr-3 text-primary"><span>选择换工作避开瓶颈</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="B5" class="mr-3 text-primary"><span>反思自身问题并调整策略</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="B6" class="mr-3 text-primary"><span>感到焦虑但无有效行动</span></label>
                    </div>
                </div>

                <div id="question-3" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">3. 你每年在职业技能提升上的投入（时间/金钱）约为？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S1" class="mr-3 text-primary"><span>100小时以上或5000元以上</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S2" class="mr-3 text-primary"><span>50-100小时或2000-5000元</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S3" class="mr-3 text-primary"><span>20-50小时或1000-2000元</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S4" class="mr-3 text-primary"><span>10-20小时或500-1000元</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S5" class="mr-3 text-primary"><span>10小时以下或500元以下</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S6" class="mr-3 text-primary"><span>几乎没有投入</span></label>
                    </div>
                </div>

                <div id="question-4" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">4. 你如何看待工作与生活的平衡？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="W1" class="mr-3 text-primary"><span>两者同等重要，需刻意平衡</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="W2" class="mr-3 text-primary"><span>工作为了生活，生活优先</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="W3" class="mr-3 text-primary"><span>现阶段以工作为重，适当牺牲生活</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="W4" class="mr-3 text-primary"><span>难以平衡，常被工作占据生活时间</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="W5" class="mr-3 text-primary"><span>生活为工作提供动力，相互促进</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="W6" class="mr-3 text-primary"><span>没有刻意平衡，顺其自然</span></label>
                    </div>
                </div>

                <div id="question-5" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">5. 你认为职业成功的核心标志是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C1" class="mr-3 text-primary"><span>实现个人价值与社会贡献</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C2" class="mr-3 text-primary"><span>职位晋升与薪资增长</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C3" class="mr-3 text-primary"><span>工作自由度与话语权</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C4" class="mr-3 text-primary"><span>行业内的专业影响力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C5" class="mr-3 text-primary"><span>工作与兴趣的高度匹配</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C6" class="mr-3 text-primary"><span>稳定的工作状态与安全感</span></label>
                    </div>
                </div>

                <div id="question-6" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">6. 当行业发生重大变革时，你会？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I1" class="mr-3 text-primary"><span>主动学习新趋势，适应变革</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I2" class="mr-3 text-primary"><span>观察他人行动后再做调整</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I3" class="mr-3 text-primary"><span>坚守现有领域，深化专业能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I4" class="mr-3 text-primary"><span>考虑转型到相关新兴领域</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I5" class="mr-3 text-primary"><span>感到焦虑，不知如何应对</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I6" class="mr-3 text-primary"><span>加入行业交流，获取信息再决策</span></label>
                    </div>
                </div>

                <div id="question-7" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">7. 你与上级沟通职业发展需求的频率是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C1" class="mr-3 text-primary"><span>每季度1-2次主动沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C2" class="mr-3 text-primary"><span>半年1次或在考核时沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C3" class="mr-3 text-primary"><span>有明确需求时才沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C4" class="mr-3 text-primary"><span>很少沟通，担心被认为功利</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C5" class="mr-3 text-primary"><span>上级主动询问时才提及</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C6" class="mr-3 text-primary"><span>从未沟通，自己规划</span></label>
                    </div>
                </div>

                <div id="question-8" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">8. 面对工作中的失败或失误，你通常会？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="F1" class="mr-3 text-primary"><span>分析原因，总结经验避免再犯</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="F2" class="mr-3 text-primary"><span>自责但很快调整心态重新开始</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="F3" class="mr-3 text-primary"><span>寻求他人反馈，明确改进方向</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="F4" class="mr-3 text-primary"><span>尽量掩饰，避免他人关注</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="F5" class="mr-3 text-primary"><span>将责任归因于外部因素</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="F6" class="mr-3 text-primary"><span>暂时搁置，待情绪平复后处理</span></label>
                    </div>
                </div>

                <div id="question-9" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">9. 你对团队协作中的角色定位更倾向于？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T1" class="mr-3 text-primary"><span>主导规划，推动团队目标达成</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T2" class="mr-3 text-primary"><span>专注执行，确保任务落地</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T3" class="mr-3 text-primary"><span>协调沟通，促进团队协作顺畅</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T4" class="mr-3 text-primary"><span>提供专业支持，解决技术问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T5" class="mr-3 text-primary"><span>跟随团队节奏，配合他人工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="T6" class="mr-3 text-primary"><span>提出创新想法，丰富团队思路</span></label>
                    </div>
                </div>

                <div id="question-10" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">10. 你对当前工作的满意度主要来自于？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S1" class="mr-3 text-primary"><span>能力提升与成长空间</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S2" class="mr-3 text-primary"><span>薪资福利与物质回报</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S3" class="mr-3 text-primary"><span>工作内容的趣味性与意义感</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S4" class="mr-3 text-primary"><span>良好的团队氛围与人际关系</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S5" class="mr-3 text-primary"><span>工作的稳定性与安全感</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S6" class="mr-3 text-primary"><span>领导认可与职业荣誉感</span></label>
                    </div>
                </div>

                <div id="question-11" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">11. 你更倾向于如何制定职业决策？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="D1" class="mr-3 text-primary"><span>收集充分信息后理性分析决策</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="D2" class="mr-3 text-primary"><span>参考行业专家或前辈建议</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="D3" class="mr-3 text-primary"><span>跟随内心直觉，快速决策</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="D4" class="mr-3 text-primary"><span>与信任的人商量后共同决定</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="D5" class="mr-3 text-primary"><span>倾向保守，选择风险较低的选项</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="D6" class="mr-3 text-primary"><span>优先考虑长期发展而非短期利益</span></label>
                    </div>
                </div>

                <div id="question-12" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">12. 当需要学习一项全新的职业技能时，你会？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L1" class="mr-3 text-primary"><span>制定系统学习计划，逐步掌握</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L2" class="mr-3 text-primary"><span>通过实践项目边做边学</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L3" class="mr-3 text-primary"><span>报名课程或找导师指导</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L4" class="mr-3 text-primary"><span>先了解基础概念，再深入学习</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L5" class="mr-3 text-primary"><span>因难度而拖延，直到必须学才开始</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="L6" class="mr-3 text-primary"><span>与同行交流，借鉴学习方法</span></label>
                    </div>
                </div>

                <div id="question-13" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">13. 你对职业倦怠的应对方式是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="B1" class="mr-3 text-primary"><span>调整工作节奏，适当休息充电</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="B2" class="mr-3 text-primary"><span>寻找工作中的新挑战或乐趣点</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="B3" class="mr-3 text-primary"><span>反思职业定位，考虑转型可能</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="B4" class="mr-3 text-primary"><span>与朋友或心理咨询师倾诉</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="B5" class="mr-3 text-primary"><span>强迫自己坚持，认为是阶段性问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="B6" class="mr-3 text-primary"><span>通过兴趣爱好转移注意力</span></label>
                    </div>
                </div>

                <div id="question-14" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">14. 你认为自己在压力下的工作状态是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P1" class="mr-3 text-primary"><span>压力越大，效率越高</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P2" class="mr-3 text-primary"><span>适度压力有动力，压力过大会焦虑</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P3" class="mr-3 text-primary"><span>容易受压力影响，效率下降</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P4" class="mr-3 text-primary"><span>会主动调节压力，保持稳定状态</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P5" class="mr-3 text-primary"><span>尽量避免高压工作场景</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="P6" class="mr-3 text-primary"><span>压力下更注重细节，确保不出错</span></label>
                    </div>
                </div>

                <div id="question-15" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">15. 你对跨部门协作的态度是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="K1" class="mr-3 text-primary"><span>积极参与，认为能拓展视野</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="K2" class="mr-3 text-primary"><span>必要时配合，但更专注本部门工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="K3" class="mr-3 text-primary"><span>觉得流程繁琐，尽量减少跨部门沟通</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="K4" class="mr-3 text-primary"><span>擅长协调跨部门资源，推动目标</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="K5" class="mr-3 text-primary"><span>服从安排，按要求完成协作任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="K6" class="mr-3 text-primary"><span>认为跨部门协作是提升影响力的机会</span></label>
                    </div>
                </div>

                <div id="question-16" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">16. 你如何看待新兴职业与传统职业的选择？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="N1" class="mr-3 text-primary"><span>新兴职业机会多，更愿意尝试</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="N2" class="mr-3 text-primary"><span>传统职业稳定，更倾向选择</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="N3" class="mr-3 text-primary"><span>结合自身优势，不局限于新旧</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="N4" class="mr-3 text-primary"><span>先从传统职业积累，再关注新兴领域</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="N5" class="mr-3 text-primary"><span>担心新兴职业风险，持观望态度</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="N6" class="mr-3 text-primary"><span>认为两者可以结合，相互补充</span></label>
                    </div>
                </div>

                <div id="question-17" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">17. 你在工作中设定目标的习惯是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="O1" class="mr-3 text-primary"><span>设定SMART目标，定期复盘调整</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="O2" class="mr-3 text-primary"><span>有大致目标，根据实际情况灵活调整</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="O3" class="mr-3 text-primary"><span>主要完成上级安排的目标</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="O4" class="mr-3 text-primary"><span>目标感不强，按部就班完成工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="O5" class="mr-3 text-primary"><span>设定具有挑战性的目标，激发动力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="O6" class="mr-3 text-primary"><span>将大目标分解为小任务，逐步完成</span></label>
                    </div>
                </div>

                <div id="question-18" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">18. 你对工作中的反馈态度是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="F1" class="mr-3 text-primary"><span>主动寻求反馈，视为改进机会</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="F2" class="mr-3 text-primary"><span>接受正面反馈，对负面反馈较敏感</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="F3" class="mr-3 text-primary"><span>认真分析所有反馈，提取有用信息</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="F4" class="mr-3 text-primary"><span>不太关注他人反馈，按自己节奏工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="F5" class="mr-3 text-primary"><span>对反馈有选择性接受，保留自己判断</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="F6" class="mr-3 text-primary"><span>认为反馈很重要，但很少主动获取</span></label>
                    </div>
                </div>

                <div id="question-19" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">19. 你在职业中更看重的成长维度是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="G1" class="mr-3 text-primary"><span>专业技能深度与行业权威性</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="G2" class="mr-3 text-primary"><span>跨领域能力与综合素养</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="G3" class="mr-3 text-primary"><span>领导力与团队管理能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="G4" class="mr-3 text-primary"><span>资源整合与人脉拓展</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="G5" class="mr-3 text-primary"><span>工作与生活的平衡能力</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="G6" class="mr-3 text-primary"><span>创新思维与问题解决能力</span></label>
                    </div>
                </div>

                <div id="question-20" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">20. 你理想的职业成长环境是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E1" class="mr-3 text-primary"><span>开放包容，鼓励创新与试错</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E2" class="mr-3 text-primary"><span>结构清晰，有明确的晋升路径</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E3" class="mr-3 text-primary"><span>团队氛围好，协作高效</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E4" class="mr-3 text-primary"><span>能接触前沿技术与行业动态</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E5" class="mr-3 text-primary"><span>注重员工培养，提供学习资源</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E6" class="mr-3 text-primary"><span>工作自主度高，能掌控节奏</span></label>
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
            console.group('【职业发展测试】表单验证流程');
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