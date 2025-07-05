<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>职业倾向测试 - IP创氪师</title>

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
                <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark mb-4">职业倾向测试</h2>
                <p class="text-gray-600 text-lg mb-6">基于霍兰德职业兴趣理论，本测试将帮助你发现最适合的职业方向</p>
                <p class="text-gray-500 mb-8">请根据你的真实想法和感受选择答案，测试共20题，预计耗时5-8分钟</p>
            </div>
        </div>
    </section>

    <section class="py-12 bg-white">
        <div class="container mx-auto px-8 max-w-4xl">
            <form action="interest-result.jsp" method="post" id="test-form">
                <input type="hidden" name="answers" id="answers">

                <div id="question-1" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">1. 你更愿意从事下列哪种工作？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="R" class="mr-3 text-primary"><span>使用工具修理机器</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="I" class="mr-3 text-primary"><span>研究科学问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="A" class="mr-3 text-primary"><span>创作艺术作品</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="S" class="mr-3 text-primary"><span>帮助他人解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="E" class="mr-3 text-primary"><span>领导团队完成项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="C" class="mr-3 text-primary"><span>整理和归档文件</span></label>
                    </div>
                </div>

                <div id="question-2" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">2. 业余时间，你更喜欢：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="R" class="mr-3 text-primary"><span>做手工或修理东西</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="I" class="mr-3 text-primary"><span>阅读科学书籍</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="A" class="mr-3 text-primary"><span>绘画、音乐或写作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="S" class="mr-3 text-primary"><span>参加社交活动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="E" class="mr-3 text-primary"><span>组织聚会或活动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="C" class="mr-3 text-primary"><span>整理房间或规划日程</span></label>
                    </div>
                </div>

                <div id="question-3" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">3. 你最擅长的是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="R" class="mr-3 text-primary"><span>操作工具和设备</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="I" class="mr-3 text-primary"><span>分析和解决复杂问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="A" class="mr-3 text-primary"><span>创造性地表达想法</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="S" class="mr-3 text-primary"><span>理解和帮助他人</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="E" class="mr-3 text-primary"><span>说服和影响他人</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="C" class="mr-3 text-primary"><span>细致地完成任务</span></label>
                    </div>
                </div>

                <div id="question-4" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">4. 你倾向于选择以下哪种学习方式：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="R" class="mr-3 text-primary"><span>动手实践操作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="I" class="mr-3 text-primary"><span>理论研究和分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="A" class="mr-3 text-primary"><span>创意表达和实践</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="S" class="mr-3 text-primary"><span>小组讨论和合作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="E" class="mr-3 text-primary"><span>项目策划和领导</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="C" class="mr-3 text-primary"><span>结构化学习和练习</span></label>
                    </div>
                </div>

                <div id="question-5" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">5. 你理想的工作环境是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="R" class="mr-3 text-primary"><span>户外或实操性强的环境</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="I" class="mr-3 text-primary"><span>安静的研究或实验室环境</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="A" class="mr-3 text-primary"><span>自由创意的艺术工作室</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="S" class="mr-3 text-primary"><span>与人互动的社交环境</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="E" class="mr-3 text-primary"><span>充满挑战的商业环境</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="C" class="mr-3 text-primary"><span>有序规范的办公环境</span></label>
                    </div>
                </div>

                <div id="question-6" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">6. 你更倾向于：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="R" class="mr-3 text-primary"><span>实际操作解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="I" class="mr-3 text-primary"><span>思考分析解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="A" class="mr-3 text-primary"><span>创意灵感解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="S" class="mr-3 text-primary"><span>沟通协作解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="E" class="mr-3 text-primary"><span>领导决策解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="C" class="mr-3 text-primary"><span>规范流程解决问题</span></label>
                    </div>
                </div>

                <div id="question-7" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">7. 你最喜欢的课程是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="R" class="mr-3 text-primary"><span>物理、化学实验课</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="I" class="mr-3 text-primary"><span>数学、生物理论课</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="A" class="mr-3 text-primary"><span>美术、音乐、戏剧课</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="S" class="mr-3 text-primary"><span>心理学、社会学课</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="E" class="mr-3 text-primary"><span>市场营销、商务课</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="C" class="mr-3 text-primary"><span>会计、数据处理课</span></label>
                    </div>
                </div>

                <div id="question-8" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">8. 你认为工作中最重要的是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="R" class="mr-3 text-primary"><span>技能的实际应用</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="I" class="mr-3 text-primary"><span>知识的深入探索</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="A" class="mr-3 text-primary"><span>创意的自由发挥</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="S" class="mr-3 text-primary"><span>与人的良好关系</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="E" class="mr-3 text-primary"><span>目标的达成和成就</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="C" class="mr-3 text-primary"><span>任务的准确完成</span></label>
                    </div>
                </div>

                <div id="question-9" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">9. 你更愿意成为：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="R" class="mr-3 text-primary"><span>技术熟练的工程师</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="I" class="mr-3 text-primary"><span>深入研究的科学家</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="A" class="mr-3 text-primary"><span>富有创意的艺术家</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="S" class="mr-3 text-primary"><span>乐于助人的咨询师</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="E" class="mr-3 text-primary"><span>成功的企业管理者</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="C" class="mr-3 text-primary"><span>细致的财务分析师</span></label>
                    </div>
                </div>

                <div id="question-10" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">10. 面对挑战，你更倾向于：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="R" class="mr-3 text-primary"><span>动手尝试解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="I" class="mr-3 text-primary"><span>收集信息分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="A" class="mr-3 text-primary"><span>创意方式应对</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S" class="mr-3 text-primary"><span>寻求他人帮助</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="E" class="mr-3 text-primary"><span>领导团队解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="C" class="mr-3 text-primary"><span>按计划逐步解决</span></label>
                    </div>
                </div>

                <div id="question-11" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">11. 你喜欢的休闲活动是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="R" class="mr-3 text-primary"><span>户外运动、DIY项目</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="I" class="mr-3 text-primary"><span>解谜、阅读科普书籍</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="A" class="mr-3 text-primary"><span>绘画、音乐、写作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="S" class="mr-3 text-primary"><span>聚会、志愿者活动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="E" class="mr-3 text-primary"><span>商业游戏、谈判练习</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="C" class="mr-3 text-primary"><span>拼图、数独、整理收藏</span></label>
                    </div>
                </div>

                <div id="question-12" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">12. 你认为自己的性格更接近：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="R" class="mr-3 text-primary"><span>实际、坦率、注重行动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="I" class="mr-3 text-primary"><span>好奇、分析、注重思考</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="A" class="mr-3 text-primary"><span>创意、敏感、注重表达</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="S" class="mr-3 text-primary"><span>友善、合作、注重人际</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="E" class="mr-3 text-primary"><span>自信、果断、注重影响</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="C" class="mr-3 text-primary"><span>细致、有序、注重规范</span></label>
                    </div>
                </div>

                <div id="question-13" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">13. 你更倾向于选择：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="R" class="mr-3 text-primary"><span>明确的技术操作任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="I" class="mr-3 text-primary"><span>复杂的理论研究任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="A" class="mr-3 text-primary"><span>自由的创意设计任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="S" class="mr-3 text-primary"><span>团队的协作支持任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="E" class="mr-3 text-primary"><span>挑战性的领导任务</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="C" class="mr-3 text-primary"><span>细致的流程管理任务</span></label>
                    </div>
                </div>

                <div id="question-14" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">14. 你欣赏的品质是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="R" class="mr-3 text-primary"><span>技术娴熟、动手能力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="I" class="mr-3 text-primary"><span>智慧博学、善于思考</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="A" class="mr-3 text-primary"><span>富有创意、表达力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="S" class="mr-3 text-primary"><span>善良友善、乐于助人</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="E" class="mr-3 text-primary"><span>果断自信、领导力强</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="C" class="mr-3 text-primary"><span>细致认真、有条理</span></label>
                    </div>
                </div>

                <div id="question-15" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">15. 你理想的职业成就是：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="R" class="mr-3 text-primary"><span>成为某领域的技术专家</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="I" class="mr-3 text-primary"><span>做出重要的科学发现</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="A" class="mr-3 text-primary"><span>创造有影响力的艺术作品</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="S" class="mr-3 text-primary"><span>帮助他人获得成长</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="E" class="mr-3 text-primary"><span>成功领导一个企业</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="C" class="mr-3 text-primary"><span>建立高效的工作流程</span></label>
                    </div>
                </div>

                <div id="question-16" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">16. 你更喜欢的工作内容：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="R" class="mr-3 text-primary"><span>操作机器或工具</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="I" class="mr-3 text-primary"><span>研究和解决问题</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="A" class="mr-3 text-primary"><span>设计和创造</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="S" class="mr-3 text-primary"><span>与人交流和互动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="E" class="mr-3 text-primary"><span>管理和决策</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="C" class="mr-3 text-primary"><span>组织和整理</span></label>
                    </div>
                </div>

                <div id="question-17" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">17. 你处理信息的方式更倾向于：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="R" class="mr-3 text-primary"><span>通过实际操作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="I" class="mr-3 text-primary"><span>通过逻辑分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="A" class="mr-3 text-primary"><span>通过创意联想</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="S" class="mr-3 text-primary"><span>通过与人讨论</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="E" class="mr-3 text-primary"><span>通过目标导向</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="C" class="mr-3 text-primary"><span>通过系统整理</span></label>
                    </div>
                </div>

                <div id="question-18" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">18. 你倾向于如何做决定：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="R" class="mr-3 text-primary"><span>基于实际经验</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="I" class="mr-3 text-primary"><span>基于数据分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="A" class="mr-3 text-primary"><span>基于直觉和创意</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="S" class="mr-3 text-primary"><span>基于他人意见</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="E" class="mr-3 text-primary"><span>基于目标和影响</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="C" class="mr-3 text-primary"><span>基于规则和流程</span></label>
                    </div>
                </div>

                <div id="question-19" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">19. 你希望工作中更多地：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="R" class="mr-3 text-primary"><span>使用工具和设备</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="I" class="mr-3 text-primary"><span>探索新知识</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="A" class="mr-3 text-primary"><span>表达创意想法</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="S" class="mr-3 text-primary"><span>与他人合作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="E" class="mr-3 text-primary"><span>影响和领导他人</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="C" class="mr-3 text-primary"><span>处理细节和数据</span></label>
                    </div>
                </div>

                <div id="question-20" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">20. 如果有机会，你最想尝试：</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="R" class="mr-3 text-primary"><span>机械维修或工程类工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="I" class="mr-3 text-primary"><span>科学研究或数据分析</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="A" class="mr-3 text-primary"><span>艺术创作或设计工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="S" class="mr-3 text-primary"><span>心理咨询或教育工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="E" class="mr-3 text-primary"><span>市场营销或管理工作</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="C" class="mr-3 text-primary"><span>财务会计或行政工作</span></label>
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
            console.group('【职业倾向测试】表单验证流程');
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