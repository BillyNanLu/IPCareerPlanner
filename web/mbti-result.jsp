<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
    // 解析请求参数并计算每个维度得分
    String[] answers = request.getParameterValues("answers");

    int eCount = 0, iCount = 0;
    int sCount = 0, nCount = 0;
    int tCount = 0, fCount = 0;
    int jCount = 0, pCount = 0;

    if (answers != null) {
        for (String answer : answers) {
            switch (answer) {
                case "E": eCount++; break;
                case "I": iCount++; break;
                case "S": sCount++; break;
                case "N": nCount++; break;
                case "T": tCount++; break;
                case "F": fCount++; break;
                case "J": jCount++; break;
                case "P": pCount++; break;
            }
        }
    }

    // 确定每个维度的偏好
    char eOrI = eCount >= iCount ? 'E' : 'I';
    char sOrN = sCount >= nCount ? 'S' : 'N';
    char tOrF = tCount >= fCount ? 'T' : 'F';
    char jOrP = jCount >= pCount ? 'J' : 'P';

    String resultType = "" + eOrI + sOrN + tOrF + jOrP;

    // 准备类型对应的详细描述和职业列表
    String typeDescription = "";
    String[] careers = {};

    switch (resultType) {
        case "ESTJ":
            typeDescription = "ESTJ型的人高效率、实际、逻辑清晰，善于组织和管理，喜欢有结构的工作环境，注重规则和秩序。决策果断，负责任，善于监督和执行计划。";
            careers = new String[]{"项目经理", "行政主管", "警察", "财务经理", "教师"};
            break;
        case "ESFJ":
            typeDescription = "ESFJ型的人热情、友好、有责任心，善于与人合作，重视人际关系和谐，喜欢为他人提供帮助。善于组织社交活动，关注他人需求，务实且有耐心。";
            careers = new String[]{"护士", "社会工作者", "教师", "公关专员", "行政助理"};
            break;
        case "ISTJ":
            typeDescription = "ISTJ型的人严谨、可靠、务实，注重细节和逻辑，喜欢按计划行事，具有强烈的责任感。善于处理实际问题，做事有条理，值得信赖。";
            careers = new String[]{"会计师", "审计师", "图书管理员", "工程师", "数据录入员"};
            break;
        case "ISFJ":
            typeDescription = "ISFJ型的人温和、体贴、有耐心，善于倾听和帮助他人，重视传统和稳定，做事认真负责。注重细节，能很好地理解他人需求。";
            careers = new String[]{"护士", "营养师", "图书管理员", "行政助理", "幼儿教师"};
            break;
        case "ESTP":
            typeDescription = "ESTP型的人灵活、实际、善于应对突发情况，喜欢行动和冒险，适应能力强，注重结果。善于解决实际问题，乐于与人交往。";
            careers = new String[]{"企业家", "销售经理", "警察", "消防员", "导游"};
            break;
        case "ESFP":
            typeDescription = "ESFP型的人开朗、热情、喜欢社交，善于表达和表演，关注当下的体验，适应能力强。富有活力，能给周围的人带来快乐。";
            careers = new String[]{"演员", "主持人", "销售代表", "活动策划", "护士"};
            break;
        case "ISTP":
            typeDescription = "ISTP型的人冷静、理性、善于分析，喜欢动手解决问题，注重实际效果，灵活且适应性强。喜欢探索事物的运作原理。";
            careers = new String[]{"工程师", "机械师", "程序员", "侦探", "运动员"};
            break;
        case "ISFP":
            typeDescription = "ISFP型的人敏感、温和、注重个人价值观，喜欢通过行动表达自己，善于观察和感受，灵活且适应性强。富有艺术天赋。";
            careers = new String[]{"艺术家", "设计师", "兽医", "厨师", "社会工作者"};
            break;
        case "ENTJ":
            typeDescription = "ENTJ型的人自信、果断、有领导力，善于战略规划和组织管理，喜欢挑战和创新，具有强烈的目标感。逻辑清晰，能有效调动资源。";
            careers = new String[]{"企业家", "CEO", "项目经理", "律师", "军事指挥官"};
            break;
        case "ENFJ":
            typeDescription = "ENFJ型的人热情、有同理心、善于激励他人，具有强烈的责任感和领导力，重视人际关系和合作，善于沟通和协调。";
            careers = new String[]{"心理咨询师", "教师", "人力资源经理", "公关总监", "政治家"};
            break;
        case "INTJ":
            typeDescription = "INTJ型的人独立、创新、有远见，善于战略思考和分析，注重逻辑和效率，喜欢挑战传统，追求卓越。具有强烈的个人意志。";
            careers = new String[]{"战略顾问", "科学家", "工程师", "设计师", "企业家"};
            break;
        case "INFJ":
            typeDescription = "INFJ型的人富有洞察力、理想主义、有同理心，善于理解他人和未来趋势，重视个人价值观，致力于实现理想。善于启发他人。";
            careers = new String[]{"心理咨询师", "作家", "哲学家", "教师", "社会活动家"};
            break;
        case "ENTP":
            typeDescription = "ENTP型的人聪明、好奇、善于辩论，喜欢挑战和创新，思维敏捷，能提出新颖的想法，乐于探索可能性。";
            careers = new String[]{"企业家", "律师", "营销策划", "发明家", "记者"};
            break;
        case "ENFP":
            typeDescription = "ENFP型的人热情、创意丰富、善于激励他人，喜欢探索新事物和可能性，重视个人成长和人际关系，富有同理心。";
            careers = new String[]{"作家", "营销专员", "教师", "心理咨询师", "创业者"};
            break;
        case "INTP":
            typeDescription = "INTP型的人理性、好奇、善于分析，喜欢抽象思考和解决复杂问题，重视逻辑和创新，独立自主，思维敏捷。";
            careers = new String[]{"科学家", "程序员", "哲学家", "数学家", "系统分析师"};
            break;
        case "INFP":
            typeDescription = "INFP型的人理想主义、敏感、富有创造力，重视个人价值观和内在和谐，善于理解他人，喜欢通过艺术或写作表达自己。";
            careers = new String[]{"作家", "艺术家", "心理咨询师", "社会工作者", "教师"};
            break;
        default:
            typeDescription = "你的性格类型具有独特的组合，展现出多元化的特质和潜力，适合在多种领域探索发展。";
            careers = new String[]{"跨领域项目协调", "自由职业者", "创业家", "咨询顾问", "培训师"};
    }
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MBTI职业性格测试结果 - IP创氪师</title>
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
                <h2 class="text-[clamp(1.75rem,3vw,2.5rem)] font-bold text-dark leading-tight text-shadow mb-4">MBTI职业性格测试结果</h2>
                <p class="text-[clamp(1rem,1.5vw,1.25rem)] text-dark mb-6 max-w-2xl">基于MBTI性格理论，你的性格类型分析已完成，以下是详细评估结果</p>
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
                                <h2 class="text-[clamp(1.5rem,2.5vw,2rem)] font-bold text-dark mb-3">你的MBTI性格类型是：<span class="text-primary"><%= resultType %></span></h2>
                                <p class="text-gray-600 text-base mb-4">根据你的选择，你的性格类型组合为<%= resultType %></p>
                            </div>
                        </div>
                        <div class="mb-6">
                            <h3 class="text-lg md:text-xl font-bold text-dark mb-4">性格特征分析</h3>
                            <p class="text-gray-600 text-base"><%= typeDescription %></p>
                        </div>
                    </div>
                </div>

                <!-- 职业建议卡片 -->
                <div class="bg-light rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-8">
                        <h3 class="text-lg md:text-xl font-bold text-dark mb-5">职业匹配建议</h3>
                        <div class="space-y-4">
                            <p class="text-gray-600 text-base mb-4">根据你的性格类型，以下是最适合你的职业方向：</p>
                            <ul class="space-y-3">
                                <% for (String career : careers) { %>
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
                <p class="text-gray-500 text-base max-w-2xl mx-auto">根据你的性格类型，为你提供以下发展方向和建议</p>
            </div>
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-7">
                <!-- 建议1 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover p-6">
                    <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4"><i class="fa fa-graduation-cap text-lg"></i></div>
                    <h3 class="text-base md:text-lg font-bold text-dark mb-3">技能提升方向</h3>
                    <p class="text-gray-500 text-base">
                        <%
                            switch (resultType) {
                                case "ESTJ":
                                    out.println("建议提升组织管理能力、决策能力和沟通协调技巧，学习项目管理方法和团队领导技能。");
                                    break;
                                case "ESFJ":
                                    out.println("建议提升人际交往能力、倾听技巧和冲突解决能力，学习团队协作和客户服务相关技能。");
                                    break;
                                case "ISTJ":
                                    out.println("建议提升细节处理能力、数据分析能力和系统思维，学习相关专业工具和流程管理方法。");
                                    break;
                                case "ISFJ":
                                    out.println("建议提升同理心、服务意识和时间管理能力，学习心理咨询基础和沟通技巧。");
                                    break;
                                case "ESTP":
                                    out.println("建议提升问题解决能力、应变能力和谈判技巧，学习风险管理和资源协调方法。");
                                    break;
                                case "ESFP":
                                    out.println("建议提升表达能力、创造力和情绪管理能力，学习表演技巧和活动策划知识。");
                                    break;
                                case "ISTP":
                                    out.println("建议提升技术分析能力、动手能力和逻辑思维，学习相关工具操作和系统分析方法。");
                                    break;
                                case "ISFP":
                                    out.println("建议提升艺术表现力、审美能力和手工技巧，学习设计软件和创意表达方法。");
                                    break;
                                case "ENTJ":
                                    out.println("建议提升战略思维、领导力和影响力，学习商业分析和组织变革管理知识。");
                                    break;
                                case "ENFJ":
                                    out.println("建议提升辅导能力、激励技巧和人际关系管理，学习心理学和团队建设方法。");
                                    break;
                                case "INTJ":
                                    out.println("建议提升创新思维、系统分析能力和战略规划能力，学习前沿技术和未来趋势分析。");
                                    break;
                                case "INFJ":
                                    out.println("建议提升洞察力、同理心和创意表达能力，学习心理咨询和深度沟通技巧。");
                                    break;
                                case "ENTP":
                                    out.println("建议提升辩论能力、创新思维和问题解决能力，学习创业知识和市场分析方法。");
                                    break;
                                case "ENFP":
                                    out.println("建议提升创意构思能力、沟通能力和激励技巧，学习设计思维和社交网络管理。");
                                    break;
                                case "INTP":
                                    out.println("建议提升逻辑分析能力、抽象思维和研究能力，学习编程、数据分析和科学研究方法。");
                                    break;
                                case "INFP":
                                    out.println("建议提升创意写作能力、同理心和价值观澄清能力，学习艺术表达和心理咨询基础。");
                                    break;
                                default:
                                    out.println("建议根据个人兴趣和职业目标，有针对性地提升专业技能和软技能，注重综合能力发展。");
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
                            switch (resultType) {
                                case "ESTJ":
                                    out.println("适合结构清晰、目标明确的工作环境，有明确的规章制度和层级体系，注重效率和结果。");
                                    break;
                                case "ESFJ":
                                    out.println("适合人际关系和谐、团队合作密切的环境，有较多的互动机会，注重互助和支持。");
                                    break;
                                case "ISTJ":
                                    out.println("适合安静有序、规则明确的工作环境，有稳定的流程和标准，减少不必要的社交。");
                                    break;
                                case "ISFJ":
                                    out.println("适合温馨友好、氛围轻松的工作环境，能为他人提供帮助，有稳定的工作节奏。");
                                    break;
                                case "ESTP":
                                    out.println("适合动态变化、充满挑战的工作环境，有多样的任务和互动机会，注重实际成果。");
                                    break;
                                case "ESFP":
                                    out.println("适合活泼开放、社交频繁的工作环境，有展示自我的机会，氛围轻松愉快。");
                                    break;
                                case "ISTP":
                                    out.println("适合独立工作、注重实效的环境，有足够的空间解决问题，减少过多的会议和社交。");
                                    break;
                                case "ISFP":
                                    out.println("适合艺术氛围浓厚、自由度高的工作环境，能发挥创造力，减少严格的规则约束。");
                                    break;
                                case "ENTJ":
                                    out.println("适合有挑战性、能发挥领导力的环境，有明确的晋升通道，注重战略和成果。");
                                    break;
                                case "ENFJ":
                                    out.println("适合团队合作、能帮助他人成长的环境，有良好的沟通氛围，注重个人发展。");
                                    break;
                                case "INTJ":
                                    out.println("适合独立思考、注重创新的环境，有足够的自主权，能从事复杂的分析工作。");
                                    break;
                                case "INFJ":
                                    out.println("适合有意义、能实现价值的工作环境，氛围和谐，能深入思考和帮助他人。");
                                    break;
                                case "ENTP":
                                    out.println("适合充满辩论和创新的环境，有灵活的工作方式，能接触各种新想法。");
                                    break;
                                case "ENFP":
                                    out.println("适合创意氛围浓厚、多样化的工作环境，有机会探索新事物，减少严格的约束。");
                                    break;
                                case "INTP":
                                    out.println("适合安静、注重思考的环境，有足够的时间研究分析，减少过多的社交活动。");
                                    break;
                                case "INFP":
                                    out.println("适合理想化、有意义的工作环境，能发挥创造力，注重个人价值观的实现。");
                                    break;
                                default:
                                    out.println("适合灵活多样、能平衡个人需求的工作环境，既有挑战也有支持，能发挥自身优势。");
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
                            switch (resultType) {
                                case "ESTJ":
                                    out.println("推荐阅读《高效能人士的七个习惯》《项目管理实战》，学习团队管理和流程优化课程。");
                                    break;
                                case "ESFJ":
                                    out.println("推荐阅读《人性的弱点》《沟通的艺术》，参加社交礼仪和客户服务培训。");
                                    break;
                                case "ISTJ":
                                    out.println("推荐阅读《细节决定成败》《数据分析实战》，学习Excel高级应用和质量管理课程。");
                                    break;
                                case "ISFJ":
                                    out.println("推荐阅读《同理心的力量》《服务之心》，参加心理咨询基础和时间管理培训。");
                                    break;
                                case "ESTP":
                                    out.println("推荐阅读《应变力》《谈判技巧》，学习风险管理和应急处理课程。");
                                    break;
                                case "ESFP":
                                    out.println("推荐阅读《表现力》《活动策划指南》，参加演讲培训和艺术表达工作坊。");
                                    break;
                                case "ISTP":
                                    out.println("推荐阅读《系统分析与设计》《实用工具手册》，学习Python编程和机械原理课程。");
                                    break;
                                case "ISFP":
                                    out.println("推荐阅读《艺术创想》《设计基础》，学习Photoshop和手工制作课程。");
                                    break;
                                case "ENTJ":
                                    out.println("推荐阅读《领导力21法则》《战略管理》，学习商业分析和组织行为学课程。");
                                    break;
                                case "ENFJ":
                                    out.println("推荐阅读《激励人心》《团队建设》，学习心理学和辅导技巧培训课程。");
                                    break;
                                case "INTJ":
                                    out.println("推荐阅读《未来简史》《系统之美》，学习人工智能基础和战略规划课程。");
                                    break;
                                case "INFJ":
                                    out.println("推荐阅读《洞察人心》《深度倾听》，学习心理咨询和哲学思考课程。");
                                    break;
                                case "ENTP":
                                    out.println("推荐阅读《创新者的窘境》《辩论的艺术》，学习创业管理和批判性思维课程。");
                                    break;
                                case "ENFP":
                                    out.println("推荐阅读《创意无限》《社交网络分析》，学习设计思维和市场营销课程。");
                                    break;
                                case "INTP":
                                    out.println("推荐阅读《逻辑思维导论》《科学研究方法》，学习数学建模和编程课程。");
                                    break;
                                case "INFP":
                                    out.println("推荐阅读《理想主义者的生存指南》《创意写作》，学习艺术疗法和价值观探索课程。");
                                    break;
                                default:
                                    out.println("推荐根据职业目标选择相关领域的经典书籍和课程，注重跨学科知识的学习和应用。");
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