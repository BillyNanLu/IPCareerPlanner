<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    // 解析请求参数并计算每个类型得分
    String[] answers = request.getParameterValues("answers");
    int[] scores = new int[6]; // R, I, A, S, E, C

    if (answers != null) {
        for (String answer : answers) {
            switch (answer) {
                case "R":
                    scores[0]++;
                    break;
                case "I":
                    scores[1]++;
                    break;
                case "A":
                    scores[2]++;
                    break;
                case "S":
                    scores[3]++;
                    break;
                case "E":
                    scores[4]++;
                    break;
                case "C":
                    scores[5]++;
                    break;
            }
        }
    }

    // 找到最高分的索引
    int maxIndex = 0;
    for (int i = 1; i < scores.length; i++) {
        if (scores[i] > scores[maxIndex]) {
            maxIndex = i;
        }
    }

    // 根据最高分确定职业类型
    String[] types = {"实际型(R)", "研究型(I)", "艺术型(A)", "社会型(S)", "企业型(E)", "常规型(C)"};
    String resultType = types[maxIndex];

    // 准备类型对应的详细描述和职业列表
    String[] typeDescriptions = {
            "实际型(R)的人喜欢具体的、实在的工作，偏好使用工具、机器和设备，动手能力强，做事手脚灵活，动作协调。不喜欢跟人打交道的工作，偏好与物体打交道。",
            "研究型(I)的人喜欢探索和理解事物，抽象思维能力强，求知欲强，肯动脑，善思考，不愿动手。喜欢独立的和富有创造性的工作，知识渊博，有学识才能。",
            "艺术型(A)的人喜欢自我表达，富有想象力和创造力，追求美、自由和变化，喜欢在艺术领域工作。具有艺术才能和个性，善于表达、怀旧、独立自主。",
            "社会型(S)的人喜欢与人交往，乐于助人，喜欢从事为他人服务和教育他人的工作。热情、合作、善良、耐心，善于沟通，渴望发挥自己的社会作用。",
            "企业型(E)的人喜欢影响和领导他人，追求权力、地位和财富，具有领导才能和商业头脑。精力充沛、自信、善交际，喜欢竞争，敢于冒险，做事有目标。",
            "常规型(C)的人喜欢有条理、程序化的工作，注重细节和准确性，习惯接受他人的指挥和领导。谨慎、保守、实际、有条理，喜欢按计划办事，不喜欢冒险和竞争。"
    };

    String[][] careerSuggestions = {
            {"机械工程师", "电工", "建筑工人", "汽车修理工", "土木工程师"},
            {"科学家", "研究员", "软件开发人员", "数据分析师", "医学研究者"},
            {"画家", "音乐家", "作家", "设计师", "演员"},
            {"护士", "教师", "社工", "心理咨询师", "人力资源专员"},
            {"企业家", "销售经理", "公关专员", "市场营销总监", "项目经理"},
            {"会计", "行政助理", "数据录入员", "审计员", "税务专员"}
    };
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>职业倾向测试结果 - IP创氪师</title>
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
                <h2 class="text-[clamp(1.75rem,3vw,2.5rem)] font-bold text-dark leading-tight text-shadow mb-4">职业倾向测试结果</h2>
                <p class="text-[clamp(1rem,1.5vw,1.25rem)] text-dark mb-6 max-w-2xl">基于霍兰德职业兴趣理论，你的职业倾向分析已完成，以下是详细评估结果</p>
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
                                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-3">你的职业倾向是：<span class="text-primary"><%= resultType %></span></h2>
                                <p class="text-gray-600 text-base mb-4">根据你的选择，你在<%= resultType %>类型中得分最高</p>
                            </div>
                        </div>
                        <div class="mb-6">
                            <h3 class="text-lg md:text-xl font-bold text-dark mb-4">性格特征分析</h3>
                            <p class="text-gray-600 text-base"><%= typeDescriptions[maxIndex] %></p>
                        </div>
                    </div>
                </div>

                <!-- 职业建议卡片 -->
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <h3 class="text-lg md:text-xl font-bold text-dark mb-5">职业匹配建议</h3>
                        <div class="space-y-4">
                            <p class="text-gray-600 text-base mb-4">根据你的职业倾向，以下是最适合你的职业方向：</p>
                            <ul class="space-y-3">
                                <% for (String career : careerSuggestions[maxIndex]) { %>
                                <li class="flex items-center text-base"><i class="fa fa-check text-primary mr-2 text-sm"></i><span><%= career %></span></li>
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

    <!-- 职业发展建议区 -->
    <section id="suggestions" class="py-12 bg-light">
        <div class="container mx-auto px-4">
            <div class="text-center mb-8">
                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-4">职业发展建议</h2>
                <p class="text-gray-500 text-base max-w-2xl mx-auto">根据你的职业倾向，为你提供以下发展方向和建议</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7">
                <!-- 建议1 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-graduation-cap text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">技能提升方向</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (maxIndex) {
                                case 0: out.println("建议提升机械操作、工具使用、动手实践等技能，可参加相关技术培训或认证。"); break;
                                case 1: out.println("建议加强逻辑分析、问题解决、研究方法等能力，多参与学术研究或数据分析项目。"); break;
                                case 2: out.println("建议发展创意表达、艺术创作、审美能力等，通过实践和作品积累提升专业水平。"); break;
                                case 3: out.println("建议提升沟通技巧、同理心、团队协作等能力，可从事教育、咨询等领域的实践工作。"); break;
                                case 4: out.println("建议培养领导能力、商业思维、谈判技巧等，参与管理项目或创业实践积累经验。"); break;
                                case 5: out.println("建议强化细节处理、流程管理、数据处理等能力，学习相关办公软件和管理工具。"); break;
                            }
                        %>
                    </p>
                </div>

                <!-- 建议2 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-briefcase text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">工作环境偏好</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (maxIndex) {
                                case 0: out.println("适合在户外、车间、实验室等实操性强的环境中工作，避免过多文书工作。"); break;
                                case 1: out.println("适合在安静、独立的研究环境中工作，如图书馆、实验室或远程办公。"); break;
                                case 2: out.println("适合在自由、创意的工作环境中工作，如艺术工作室、设计公司等。"); break;
                                case 3: out.println("适合在与人互动、团队合作的环境中工作，如学校、医院、非营利组织。"); break;
                                case 4: out.println("适合在充满挑战、竞争的商业环境中工作，如企业、创业公司等。"); break;
                                case 5: out.println("适合在有序、规范的办公环境中工作，如办公室、行政部门等。"); break;
                            }
                        %>
                    </p>
                </div>

                <!-- 建议3 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-book text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">学习资源推荐</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (maxIndex) {
                                case 0: out.println("推荐学习《机械原理》《工具使用技术》等书籍，或参加蓝领技能培训课程。"); break;
                                case 1: out.println("推荐阅读《科学研究方法》《数据分析入门》等，学习Python、R等数据分析工具。"); break;
                                case 2: out.println("建议学习《艺术创作基础》《设计思维》等，多参观展览、参与创作工作坊。"); break;
                                case 3: out.println("推荐阅读《沟通的艺术》《心理咨询技术》等，参加教育或社工相关培训。"); break;
                                case 4: out.println("建议学习《领导力21法则》《市场营销原理》等，参与商业模拟或创业大赛。"); break;
                                case 5: out.println("推荐学习《办公自动化》《财务管理基础》等，考取会计、行政等相关证书。"); break;
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