<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String[] answers = request.getParameterValues("answers");
    int[] scores = new int[6]; // S,P,C,T,L,M对应的维度得分
    if (answers != null) {
        for (String answer : answers) {
            switch (answer) {
                case "S": scores[0]++; break;
                case "P": scores[1]++; break;
                case "C": scores[2]++; break;
                case "T": scores[3]++; break;
                case "L": scores[4]++; break;
                case "M": scores[5]++; break;
            }
        }
    }
    int totalScore = 0;
    for (int score : scores) totalScore += score;
    String resultLevel;
    if (totalScore >= 90) resultLevel = "优秀";
    else if (totalScore >= 70) resultLevel = "良好";
    else if (totalScore >= 50) resultLevel = "一般";
    else resultLevel = "待提升";
    String[] levelDescriptions = {
            "优秀：你的就业核心竞争力处于较高水平，专业基础扎实，实践经验丰富，具备良好的职业素养和求职技巧。在就业市场中具有较强的竞争力，能较好地适应职场需求。",
            "良好：你的就业核心竞争力处于中等偏上水平，具备一定的专业技能和实践经历，职业认知清晰。但在部分维度仍有提升空间，针对性强化后能显著提高就业竞争力。",
            "一般：你的就业核心竞争力处于中等水平，专业基础基本达标，但实践经验不足，职业素养和求职能力有待加强。需要系统性提升各维度能力以适应就业市场要求。",
            "待提升：你的就业核心竞争力较弱，在专业技能、实践经历、职业认知等多个维度存在明显不足。需要制定全面的提升计划，弥补短板以提高就业成功率。"
    };
    String[][] improvementDirections = {
            {"深化专业前沿知识，参与高含金量项目", "拓展行业资源，争取优质就业机会", "提升领导力和团队管理能力", "关注职业长期发展规划"},
            {"强化核心专业技能应用能力", "增加相关行业实习经历", "提升面试技巧和简历质量", "加强行业动态了解"},
            {"巩固专业基础知识，弥补薄弱环节", "积极参与实习和社会实践", "学习求职礼仪和面试技巧", "明确职业发展方向"},
            {"系统学习专业核心课程", "积累基础实践经验，从兼职或短期实习开始", "参加求职技能培训", "建立职业认知，制定提升计划"}
    };
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>大学生就业核心竞争力测评结果 - IP创氪师</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <script src="https://cdn.jsdelivr.net/npm/@tailwindcss/line-clamp"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
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
                <h2 class="text-[clamp(1.75rem,3vw,2.5rem)] font-bold text-dark leading-tight text-shadow mb-4">大学生就业核心竞争力测评结果</h2>
                <p class="text-[clamp(1rem,1.5vw,1.25rem)] text-dark mb-6">本测评从专业技能、实践能力、职业素养等多个维度评估了你的就业核心竞争力，以下是详细分析结果</p>
            </div>
        </div>
    </section>
    <section class="py-12 bg-white">
        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <div class="flex items-start justify-between mb-6">
                            <div>
                                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-3">你的就业核心竞争力评估等级是：<span class="text-primary"><%= resultLevel %></span></h2>
                                <p class="text-gray-600 text-base mb-4">根据你的答题情况，你的就业核心竞争力综合评估为<%= resultLevel %></p>
                            </div>
                        </div>
                        <div class="mb-6">
                            <h3 class="text-lg md:text-xl font-bold text-dark mb-4">竞争力特征分析</h3>
                            <p class="text-gray-600 text-base"><%= resultLevel.equals("优秀") ? levelDescriptions[0] : resultLevel.equals("良好") ? levelDescriptions[1] : resultLevel.equals("一般") ? levelDescriptions[2] : levelDescriptions[3] %></p>
                        </div>
                    </div>
                </div>
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <h3 class="text-lg md:text-xl font-bold text-dark mb-5">竞争力提升重点</h3>
                        <div class="space-y-4">
                            <p class="text-gray-600 text-base mb-4">根据你的评估结果，以下是需要重点提升的方向：</p>
                            <ul class="space-y-3">
                                <% String[] directions = resultLevel.equals("优秀") ? improvementDirections[0] : resultLevel.equals("良好") ? improvementDirections[1] : resultLevel.equals("一般") ? improvementDirections[2] : improvementDirections[3]; for (String dir : directions) { %>
                                <li class="flex items-center text-base"><i class="fa fa-check text-primary mr-2 text-sm"></i><span><%= dir %></span></li>
                                <% } %>
                            </ul>
                            <div class="mt-7 pt-5 border-t border-gray-100 flex flex-col md:flex-row gap-3">
                                <a href="consult.jsp" class="flex-1 bg-primary hover:bg-primary/90 text-white px-5 py-3 rounded-lg text-base font-medium transition-colors text-center">就业指导咨询</a>
                                <a href="evaluation.jsp" class="flex-1 bg-white border border-primary text-primary hover:bg-primary/5 px-5 py-3 rounded-lg text-base font-medium transition-colors text-center">查看更多测评</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section id="suggestions" class="py-12 bg-light">
        <div class="container mx-auto px-4">
            <div class="text-center mb-8">
                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-4">就业竞争力提升建议</h2>
                <p class="text-gray-500 text-base max-w-2xl mx-auto">根据你的测评结果，为你提供针对性的能力提升方案和建议</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7">
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-cogs text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">技能提升重点</h3>
                    <p class="text-gray-500 text-base">
                        <% if (resultLevel.equals("优秀")) { out.println("建议深化专业前沿知识，参与行业高端项目，考取权威认证，同时拓展跨领域技能，形成复合型能力优势。"); } else if (resultLevel.equals("良好")) { out.println("重点强化核心专业技能的实际应用能力，针对性弥补薄弱环节，学习行业主流工具和方法，提升解决复杂问题的能力。"); } else if (resultLevel.equals("一般")) { out.println("优先巩固专业基础知识，掌握核心课程要点，通过课程设计和实践作业提升应用能力，学习基础办公和专业软件操作。"); } else { out.println("从专业基础课程入手，建立知识体系，通过在线课程和教材补充理论知识，参与基础技能培训，逐步提升应用能力。"); } %>
                    </p>
                </div>
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-briefcase text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">实践经历积累</h3>
                    <p class="text-gray-500 text-base">
                        <% if (resultLevel.equals("优秀")) { out.println("建议参与行业顶尖企业实习或科研项目，担任核心角色，积累高质量项目经验，拓展行业人脉资源。"); } else if (resultLevel.equals("良好")) { out.println("争取与目标行业相关的实习机会，深度参与实际项目，承担有挑战性的任务，积累可量化的成果。"); } else if (resultLevel.equals("一般")) { out.println("积极寻找与专业相关的实习或社会实践，从基础岗位做起，熟悉行业运作流程，积累实践经验。"); } else { out.println("从校园实践和短期兼职开始，逐步接触职场环境，学习基础工作技能，培养职业意识和责任感。"); } %>
                    </p>
                </div>
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-graduation-cap text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">求职准备策略</h3>
                    <p class="text-gray-500 text-base">
                        <% if (resultLevel.equals("优秀")) { out.println("优化简历突出核心优势和成果，针对性准备面试，关注行业顶尖企业招聘信息，拓展内推渠道。"); } else if (resultLevel.equals("良好")) { out.println("打磨简历和求职信，参加模拟面试训练，研究目标企业招聘要求，积极参与校园招聘活动。"); } else if (resultLevel.equals("一般")) { out.println("学习简历制作技巧，准备常见面试问题的回答，了解基本求职流程，寻求学长学姐的经验分享。"); } else { out.println("参加求职技能培训，学习简历撰写和面试礼仪，利用学校就业指导中心资源，制定求职计划。"); } %>
                    </p>
                </div>
            </div>
        </div>
    </section>
</main>
<button id="back-to-top" class="fixed bottom-5 right-5 w-12 h-12 rounded-full bg-primary text-white shadow-lg flex items-center justify-center opacity-0 invisible transition-all z-50"><i class="fa fa-chevron-up text-base"></i></button>
<script>
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
    window.addEventListener('load', () => {
        animateNumbers();
    });
</script>
</body>
</html>
