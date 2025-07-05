<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String[] answers = request.getParameterValues("answers");
    int[] scores = new int[6]; // R, I, A, S, E, C
    if (answers != null) {
        for (String answer : answers) {
            switch (answer) {
                case "R": scores[0]++; break;
                case "I": scores[1]++; break;
                case "A": scores[2]++; break;
                case "S": scores[3]++; break;
                case "E": scores[4]++; break;
                case "C": scores[5]++; break;
            }
        }
    }
    int maxIndex = 0;
    for (int i = 1; i < scores.length; i++) {
        if (scores[i] > scores[maxIndex]) maxIndex = i;
    }
    String[] types = {"操作执行能力(R)", "分析研究能力(I)", "创意设计能力(A)", "社交协作能力(S)", "领导管理能力(E)", "细节处理能力(C)"};
    String resultType = types[maxIndex];
    String[] typeDescriptions = {
            "操作执行能力突出的人擅长技术性操作与维护，动手能力强，能熟练使用工具和设备，实践能力出色。工作中执行力高效，善于解决实际问题，注重实际成果。",
            "分析研究能力突出的人擅长数据分析与问题解决，逻辑思维缜密，求知欲强，善思考钻研。工作中信息处理能力强，具备系统性思维，能从复杂现象中找规律。",
            "创意设计能力突出的人擅长创意表达和艺术设计，富有想象力与创造力，追求创新和独特性。工作中灵感丰富，表现力强，善于将抽象概念转化为具体作品。",
            "社交协作能力突出的人擅长人际沟通与团队协作，同理心与沟通技巧良好，善于建立和维护人际关系。工作中团队合作精神佳，协调能力强，能有效促进团队协作。",
            "领导管理能力突出的人擅长领导团队和项目策划，目标感与组织能力强，能有效激励他人并推动任务完成。工作中决策果断，执行力强，善于把握全局。",
            "细节处理能力突出的人擅长细节处理与流程优化，注重准确性和规范性，做事严谨细致。工作中组织与执行力优秀，能确保任务按计划精准完成，善于优化流程。"
    };
    String[][] careerSuggestions = {
            {"机械工程师", "电工", "技术操作员", "设备维护工程师", "工艺工程师"},
            {"数据分析师", "市场研究员", "系统分析师", "科研人员", "战略规划师"},
            {"产品设计师", "创意总监", "艺术指导", "广告创意师", "UI/UX设计师"},
            {"人力资源经理", "培训师", "公关专员", "客户关系经理", "团队协调员"},
            {"项目经理", "部门主管", "企业创始人", "运营总监", "销售经理"},
            {"财务分析师", "行政经理", "质量控制专员", "档案管理员", "数据录入专家"}
    };
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>能力优势测评结果 - IP创氪师</title>
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
                <h2 class="text-[clamp(1.75rem,3vw,2.5rem)] font-bold text-dark leading-tight text-shadow mb-4">能力优势测评结果</h2>
                <p class="text-[clamp(1rem,1.5vw,1.25rem)] text-dark mb-6 max-w-2xl">基于职业能力模型，你的核心能力优势分析已完成，以下是详细评估结果</p>
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
                                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-3">你的核心能力优势是：<span class="text-primary"><%= resultType %></span></h2>
                                <p class="text-gray-600 text-base mb-4">根据你的测试结果，你在<%= resultType %>方面表现最为突出</p>
                            </div>
                        </div>
                        <div class="mb-6">
                            <h3 class="text-lg md:text-xl font-bold text-dark mb-4">能力特征分析</h3>
                            <p class="text-gray-600 text-base"><%= typeDescriptions[maxIndex] %></p>
                        </div>
                    </div>
                </div>
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <h3 class="text-lg md:text-xl font-bold text-dark mb-5">适合的职业方向</h3>
                        <div class="space-y-4">
                            <p class="text-gray-600 text-base mb-4">基于你的核心能力优势，以下是最能发挥你潜能的职业方向：</p>
                            <ul class="space-y-3">
                                <% for (String career : careerSuggestions[maxIndex]) { %>
                                <li class="flex items-center text-base"><i class="fa fa-check text-primary mr-2 text-sm"></i><span><%= career %></span></li>
                                <% } %>
                            </ul>
                            <div class="mt-7 pt-5 border-t border-gray-100 flex flex-col md:flex-row gap-3">
                                <a href="consult.jsp" class="flex-1 bg-primary hover:bg-primary/90 text-white px-5 py-3 rounded-lg text-base font-medium transition-colors text-center">能力提升咨询</a>
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
                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-4">能力发展建议</h2>
                <p class="text-gray-500 text-base max-w-2xl mx-auto">根据你的核心能力优势，为你提供以下能力提升和职业发展建议</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7">
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-graduation-cap text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">能力提升方向</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (maxIndex) {
                                case 0: out.println("建议提升专业技术熟练度、工具使用能力和实践创新能力，可通过技术认证和实操训练不断提升专业水平。"); break;
                                case 1: out.println("建议加强数据分析工具使用、逻辑思维和系统思考能力，通过参与复杂项目提升问题解决能力和研究深度。"); break;
                                case 2: out.println("建议发展创意方法、设计思维和跨界融合能力，通过多领域学习和实践提升创意转化能力和设计水平。"); break;
                                case 3: out.println("建议提升沟通技巧、冲突解决和团队协作能力，通过团队项目和社交实践增强人际影响力和协作效率。"); break;
                                case 4: out.println("建议培养战略思维、团队管理和决策能力，通过管理实践和领导力培训提升组织协调能力和目标达成能力。"); break;
                                case 5: out.println("建议强化细节把控、流程优化和质量管理能力，通过标准化训练和流程改进项目提升工作效率和准确性。"); break;
                            }
                        %>
                    </p>
                </div>
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-briefcase text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">工作环境适配</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (maxIndex) {
                                case 0: out.println("适合技术型工作环境，如生产车间、技术实验室、工程现场等，能提供充足的实践机会和技术挑战。"); break;
                                case 1: out.println("适合分析型工作环境，如研究机构、数据分析部门、战略规划团队等，能提供充足的信息和思考空间。"); break;
                                case 2: out.println("适合创意型工作环境，如设计工作室、创意 agency、艺术团体等，能提供自由表达和创新的空间。"); break;
                                case 3: out.println("适合团队协作型工作环境，如人力资源部门、客户服务团队、教育机构等，能提供丰富的人际互动机会。"); break;
                                case 4: out.println("适合管理型工作环境，如企业管理层、项目团队、创业公司等，能提供领导机会和决策空间。"); break;
                                case 5: out.println("适合流程型工作环境，如行政部门、财务部门、质量控制团队等，能提供结构化工作内容和明确的流程规范。"); break;
                            }
                        %>
                    </p>
                </div>
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-book text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">学习资源推荐</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (maxIndex) {
                                case 0: out.println("推荐学习《实用技术手册》《技能大师之路》等，参加技术工作坊和实操培训，获取专业技术认证。"); break;
                                case 1: out.println("推荐阅读《思考，快与慢》《数据分析实战》等，学习Python、SPSS等分析工具，参与数据分析项目。"); break;
                                case 2: out.println("建议学习《创意之道》《设计思维》等，参加创意工作坊和设计比赛，积累原创作品和设计经验。"); break;
                                case 3: out.println("推荐阅读《沟通的艺术》《高效团队协作》等，参加团队建设培训和沟通技巧工作坊，提升人际能力。"); break;
                                case 4: out.println("建议学习《领导力21法则》《项目管理实战》等，参与管理培训和领导力发展项目，积累管理经验。"); break;
                                case 5: out.println("推荐学习《细节决定成败》《流程优化指南》等，学习办公自动化工具和质量管理体系，提升工作效率。"); break;
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