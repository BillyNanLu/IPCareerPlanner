<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/6/22
  Time: 23:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IP创氪师-专业职业生涯规划咨询与培训平台</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">

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
                },
            }
        }
    </script>

    <style type="text/tailwindcss">
        @layer utilities {
            .content-auto {
                content-visibility: auto;
            }
            .text-shadow {
                text-shadow: 0 2px 4px rgba(0,0,0,0.1);
            }
            .transition-navbar {
                transition: background-color 0.3s, box-shadow 0.3s, padding 0.3s;
            }
            .card-hover {
                transition: transform 0.3s, box-shadow 0.3s;
            }
            .card-hover:hover {
                transform: translateY(-5px);
            }
            .animate-number {
                animation: number-grow 2s ease-out forwards;
                opacity: 0;
            }
            @keyframes number-grow {
                0% { opacity: 0; transform: scale(0.8); }
                100% { opacity: 1; transform: scale(1); }
            }
            .bg-gradient-hero {
                background: linear-gradient(to right, rgba(22, 93, 255, 0.9), rgba(22, 93, 255, 0.7)), url('./image/home/bigbackground.jpg') center/cover no-repeat;
            }
        }
    </style>
</head>

<body class="font-inter text-dark antialiased w-1200 mx-auto">

<header id="navbar" class="fixed top-0 left-0 w-full z-50 transition-navbar bg-white/95 backdrop-blur-md shadow-sm">
    <div class="container mx-auto px-8">
        <div class="flex justify-between items-center h-16 md:h-20">
            <div class="flex items-center">
                <a href="#" class="flex items-center space-x-2">
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
                <a href="home.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">首页</a>
                <a href="courses" class="text-gray-700 hover:text-primary transition-colors font-medium">课程培训</a>
                <a href="AIChat.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">职业规划咨询</a>
                <a href="#tests" class="text-gray-700 hover:text-primary transition-colors font-medium">职业测评</a>
                <a href="#teachers" class="text-gray-700 hover:text-primary transition-colors font-medium">师资团队</a>
                <a href="#my" class="text-gray-700 hover:text-primary transition-colors font-medium">个人中心</a>
            </nav>

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

                    <a href="#consult"
                       class="bg-secondary hover:bg-secondary/90 text-white px-5 py-2 rounded-full font-medium transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
                        立即咨询
                    </a>
                </div>
            </div>
        </div>
    </div>
</header>


<section class="pt-20 bg-gradient-hero min-h-screen flex items-center">
    <div class="container mx-auto px-8 relative z-10">
        <div class="max-w-3xl">
            <h2 class="text-[clamp(2rem,5vw,3.5rem)] font-bold text-white leading-tight text-shadow mb-4">
                打破职业迷茫，设计属于你的人生路径
            </h2>
            <p class="text-[clamp(1rem,2vw,1.25rem)] text-white/90 mb-8 max-w-2xl">
                从0基础到职业规划专家，新精英陪你解锁生涯无限可能，让每一次选择都成为未来的基石
            </p>

            <div class="flex flex-row gap-4 mb-10">
                <a href="#course-free" class="bg-white text-primary hover:bg-gray-100 px-8 py-3 rounded-full font-medium transition-all shadow-lg hover:shadow-xl transform hover:-translate-y-1 text-center">
                    免费领取3天阅读写作特训营
                </a>
                <a href="#consult" class="bg-secondary hover:bg-secondary/90 text-white px-8 py-3 rounded-full font-medium transition-all shadow-lg hover:shadow-xl transform hover:-translate-y-1 text-center">
                    预约1对1职业咨询
                </a>
            </div>
        </div>
    </div>
</section>

<!-- 核心服务模块 - 固定3列布局 -->
<section id="services" class="py-16 bg-light">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">我们的核心服务</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">从职业规划到个人成长，全方位助力你的职业生涯发展，让每一步选择都充满信心</p>
        </div>

        <div class="grid grid-cols-3 gap-8">
            <!-- 课程卡片1 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-2">职业生涯规划-基石班</h3>
                    <p class="text-gray-500 mb-4">4种理论+15种工具，科学梳理职业发展，帮助你建立系统的职业规划思维</p>
                    <div class="flex flex-wrap gap-2 mb-6">
                        <span class="px-3 py-1 bg-primary/10 text-primary text-sm rounded-full">0基础入门</span>
                        <span class="px-3 py-1 bg-primary/10 text-primary text-sm rounded-full">职场必备</span>
                    </div>
                    <a href="#course-details" class="inline-flex items-center text-primary font-medium hover:underline">
                        了解详情 <i class="fa fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>

            <!-- 课程卡片2 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-2">职业生涯咨询-实战班</h3>
                    <p class="text-gray-500 mb-4">掌握咨询全流程+提升咨询技术，从理论到实践，成为专业的职业规划师</p>
                    <div class="flex flex-wrap gap-2 mb-6">
                        <span class="px-3 py-1 bg-primary/10 text-primary text-sm rounded-full">咨询实战</span>
                        <span class="px-3 py-1 bg-primary/10 text-primary text-sm rounded-full">职业转型</span>
                    </div>
                    <a href="#course-details" class="inline-flex items-center text-primary font-medium hover:underline">
                        了解详情 <i class="fa fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>

            <!-- 课程卡片3 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-2">一对一职业规划咨询</h3>
                    <p class="text-gray-500 mb-4">专家定制化解决方案，案例式服务+多次预约直至问题解决，深度解决职业困惑</p>
                    <div class="flex flex-wrap gap-2 mb-6">
                        <span class="px-3 py-1 bg-primary/10 text-primary text-sm rounded-full">专家服务</span>
                        <span class="px-3 py-1 bg-primary/10 text-primary text-sm rounded-full">深度答疑</span>
                    </div>
                    <a href="#consult" class="inline-flex items-center text-primary font-medium hover:underline">
                        立即预约 <i class="fa fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- 特色服务 - 固定2列布局 -->
        <div class="grid grid-cols-2 gap-8 mt-16">
            <div class="flex items-start space-x-6">
                <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary flex-shrink-0">
                    <i class="fa fa-compass text-xl"></i>
                </div>
                <div>
                    <h3 class="text-xl font-bold text-dark mb-2">职业辅导「选对」平台</h3>
                    <p class="text-gray-500">帮助职场新人摆脱选择迷茫，导师1对1分析职业路径，提供科学的职业选择建议</p>
                </div>
            </div>

            <div class="flex items-start space-x-6">
                <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary flex-shrink-0">
                    <i class="fa fa-microphone text-xl"></i>
                </div>
                <div>
                    <h3 class="text-xl font-bold text-dark mb-2">超级个体IP营</h3>
                    <p class="text-gray-500">打造个人品牌，从职场人到自由咨询师的进阶之路，掌握个人IP打造核心技能</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 师资与实力展示区 -->
<section id="teachers" class="py-16 bg-white">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">专业师资团队</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">我们拥有行业顶尖的师资力量，每位讲师都具备丰富的实战经验和专业知识</p>
        </div>

        <!-- 明星讲师 - 固定3列布局 -->
        <div class="grid grid-cols-3 gap-8">
            <!-- 讲师1 -->
            <div class="bg-light rounded-xl overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1012/600/400" alt="古典老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">古典</h3>
                    <p class="text-primary mb-3">中国职业生涯教育专家 / 新精英执行总裁</p>
                    <p class="text-gray-500 mb-4">玛丽莲博士亲传弟子，国家一级职业指导师，著有《拆掉思维里的墙》《跃迁》等畅销书</p>
                    <div class="flex space-x-3">
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-weibo"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-wechat"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 讲师2 -->
            <div class="bg-light rounded-xl overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1027/600/400" alt="史延岩老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">史延岩</h3>
                    <p class="text-primary mb-3">新精英资深生涯咨询师 / TA人际沟通分析师</p>
                    <p class="text-gray-500 mb-4">国家二级心理咨询师，中科院心理所研究生，10年以上职业咨询经验，服务超过5000名客户</p>
                    <div class="flex space-x-3">
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-weibo"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-wechat"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 讲师3 -->
            <div class="bg-light rounded-xl overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1074/600/400" alt="王虹老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">王虹</h3>
                    <p class="text-primary mb-3">职业规划实战专家 / 新精英高级培训师</p>
                    <p class="text-gray-500 mb-4">前500强企业人力资源总监，15年HR经验，专注于职业转型与发展，著有《觉醒：把人生设计成你想要的样子》</p>
                    <div class="flex space-x-3">
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-weibo"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-wechat"></i>
                        </a>
                        <a href="#" class="text-gray-400 hover:text-primary transition-colors">
                            <i class="fa fa-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 企业实力数据 - 固定4列布局 -->
        <div class="mt-20 grid grid-cols-4 gap-8 text-center">
            <div class="p-6">
                <div class="text-4xl md:text-5xl font-bold text-primary mb-2 animate-number" data-target="128">0</div>
                <p class="text-gray-500">专业教师</p>
            </div>
            <div class="p-6">
                <div class="text-4xl md:text-5xl font-bold text-primary mb-2 animate-number" data-target="100000">0</div>
                <p class="text-gray-500">服务学员</p>
            </div>
            <div class="p-6">
                <div class="text-4xl md:text-5xl font-bold text-primary mb-2 animate-number" data-target="145">0</div>
                <p class="text-gray-500">遍及城市</p>
            </div>
            <div class="p-6">
                <div class="text-4xl md:text-5xl font-bold text-primary mb-2 animate-number" data-target="85">0</div>
                <p class="text-gray-500">客户满意度(%)</p>
            </div>
        </div>
    </div>
</section>

<!-- 社会证明模块 -->
<section id="stories" class="py-16 bg-light">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">学员成功故事</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">听听他们如何通过新精英的帮助，实现职业转型和个人成长的故事</p>
        </div>

        <!-- 学员故事 - 固定2列布局 -->
        <div class="grid grid-cols-2 gap-8">
            <!-- 故事1 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="flex flex-row">
                    <div class="w-1/3">
                        <img src="https://picsum.photos/id/1062/600/800" alt="CiCi" class="w-full h-full object-cover">
                    </div>
                    <div class="p-6 w-2/3">
                        <div class="flex items-center mb-4">
                            <img src="https://picsum.photos/id/1027/60/60" alt="CiCi" class="w-12 h-12 rounded-full object-cover">
                            <div class="ml-3">
                                <h3 class="text-lg font-bold text-dark">CiCi</h3>
                                <p class="text-gray-500 text-sm">大学教师</p>
                            </div>
                        </div>
                        <h4 class="text-xl font-bold text-dark mb-3">"在隧道里看到光"</h4>
                        <p class="text-gray-500 mb-4">通过咨询破开内心纠结，清晰职业目标，从迷茫的大学教师到自信的职业规划师，找到了真正热爱的事业。</p>
                        <a href="#story-details" class="inline-flex items-center text-primary font-medium hover:underline">
                            阅读完整故事 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- 故事2 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="flex flex-row">
                    <div class="w-1/3">
                        <img src="https://picsum.photos/id/1074/600/800" alt="张心悦" class="w-full h-full object-cover">
                    </div>
                    <div class="p-6 w-2/3">
                        <div class="flex items-center mb-4">
                            <img src="https://picsum.photos/id/1066/60/60" alt="张心悦" class="w-12 h-12 rounded-full object-cover">
                            <div class="ml-3">
                                <h3 class="text-lg font-bold text-dark">张心悦</h3>
                                <p class="text-gray-500 text-sm">情商专家</p>
                            </div>
                        </div>
                        <h4 class="text-xl font-bold text-dark mb-3">"从前台到自由咨询师的逆袭"</h4>
                        <p class="text-gray-500 mb-4">摆脱传统职场路径，通过系统学习和实践，从普通前台转变为专业的情商咨询师，实现了职业的华丽转身。</p>
                        <a href="#story-details" class="inline-flex items-center text-primary font-medium hover:underline">
                            阅读完整故事 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>

        <!-- 故事3 - 单独一行 -->
        <div class="mt-8 bg-white rounded-xl shadow-md overflow-hidden card-hover">
            <div class="flex flex-row">
                <div class="w-1/3">
                    <img src="https://picsum.photos/id/1011/600/800" alt="孙天一" class="w-full h-full object-cover">
                </div>
                <div class="p-6 w-2/3">
                    <div class="flex items-center mb-4">
                        <img src="https://picsum.photos/id/1025/60/60" alt="孙天一" class="w-12 h-12 rounded-full object-cover">
                        <div class="ml-3">
                            <h3 class="text-lg font-bold text-dark">孙天一</h3>
                            <p class="text-gray-500 text-sm">90后自由职业者</p>
                        </div>
                    </div>
                    <h4 class="text-xl font-bold text-dark mb-3">"三天找到梦想入口"</h4>
                    <p class="text-gray-500 mb-4">突破专业与工作的迷茫，通过三天的密集咨询和指导，发现了自己真正的职业兴趣，开启了新的职业篇章。</p>
                    <a href="#story-details" class="inline-flex items-center text-primary font-medium hover:underline">
                        阅读完整故事 <i class="fa fa-arrow-right ml-2"></i>
                    </a>
                </div>
            </div>
        </div>

        <!-- 媒体动态 - 固定3列布局 -->
        <div class="mt-20">
            <h3 class="text-2xl font-bold text-dark mb-8 text-center">最新动态</h3>
            <div class="grid grid-cols-3 gap-8">
                <!-- 动态1 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-6">
                        <div class="flex items-start space-x-4 mb-4">
                            <div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary flex-shrink-0">
                                <i class="fa fa-calendar"></i>
                            </div>
                            <div>
                                <h4 class="text-lg font-bold text-dark">斯坦福人生设计创始人见面会</h4>
                                <p class="text-gray-500 text-sm mt-1">国际大咖面对面，揭秘人生设计方法论</p>
                            </div>
                        </div>
                        <p class="text-gray-500 mb-4">6月28日，我们邀请到斯坦福大学人生设计项目创始人Bill Burnett教授，与大家分享人生设计的核心理念和实践方法...</p>
                        <a href="#news-details" class="inline-flex items-center text-primary font-medium hover:underline">
                            查看详情 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>

                <!-- 动态2 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-6">
                        <div class="flex items-start space-x-4 mb-4">
                            <div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary flex-shrink-0">
                                <i class="fa fa-coffee"></i>
                            </div>
                            <div>
                                <h4 class="text-lg font-bold text-dark">生涯咖啡日第2期</h4>
                                <p class="text-gray-500 text-sm mt-1">全天开放公益咨询，助力30位学生冲破春招困境</p>
                            </div>
                        </div>
                        <p class="text-gray-500 mb-4">5月20日，新精英生涯咖啡日第2期成功举办，30位面临春招的大学生通过1对1咨询，明确了职业方向，提升了求职竞争力...</p>
                        <a href="#news-details" class="inline-flex items-center text-primary font-medium hover:underline">
                            查看详情 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>

                <!-- 动态3 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                    <div class="p-6">
                        <div class="flex items-start space-x-4 mb-4">
                            <div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary flex-shrink-0">
                                <i class="fa fa-gift"></i>
                            </div>
                            <div>
                                <h4 class="text-lg font-bold text-dark">618十二重礼包</h4>
                                <p class="text-gray-500 text-sm mt-1">年中特惠，为未来发展投资最高省800元</p>
                            </div>
                        </div>
                        <p class="text-gray-500 mb-4">618年中促销活动火热进行中，报名任意课程即可享受十二重福利，包括免费咨询、学习资料、工具包等，最高可省800元...</p>
                        <a href="#promotion" class="inline-flex items-center text-primary font-medium hover:underline">
                            查看详情 <i class="fa fa-arrow-right ml-2"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 咨询预约模块 -->
<section id="consult" class="py-16 bg-primary">
    <div class="container mx-auto px-8">
        <div class="max-w-3xl mx-auto text-center text-white">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold mb-4">还在为职业选择感到迷茫？</h2>
            <p class="text-white/80 mb-8">我们的专业咨询师团队随时准备为你提供帮助，让我们一起规划你的职业未来</p>

            <c:if test="${not empty error}">
                <div class="text-red-500 text-sm mb-4 text-center">${error}</div>
            </c:if>

            <!-- 成功提示 -->
            <c:if test="${param.success eq 'true'}">
                <div class="bg-green-100 border border-green-400 text-green-800 px-4 py-3 rounded mb-6" role="alert">
                    <strong class="font-bold">提交成功！</strong>
                    <span class="block sm:inline">我们将在24小时内与你联系。</span>
                </div>
            </c:if>

            <form class="bg-white/10 backdrop-blur-sm p-8 rounded-xl" action="home" method="get">
                <div class="grid grid-cols-2 gap-6 mb-6">
                    <div>
                        <label for="name" class="block text-white/80 mb-2 text-sm">姓名</label>
                        <input type="text" name="appoint_name" id="name" class="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/50" placeholder="请输入你的姓名">
                    </div>
                    <div>
                        <label for="phone" class="block text-white/80 mb-2 text-sm">电话</label>
                        <input type="tel" name="appoint_phone" id="phone" class="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/50" placeholder="请输入你的电话">
                    </div>
                </div>

                <div class="mb-6">
                    <label for="problem" class="block text-white/80 mb-2 text-sm">你的职业困惑</label>
                    <textarea name="appoint_description" id="problem" rows="3" class="w-full px-4 py-3 rounded-lg bg-white/20 border border-white/30 text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/50" placeholder="请简要描述你的职业困惑..."></textarea>
                </div>

                <button type="submit" class="w-full bg-white text-primary hover:bg-gray-100 px-6 py-3 rounded-lg font-medium transition-colors">
                    提交咨询申请
                </button>
                <p class="text-white/60 text-sm mt-4">我们将在24小时内与你联系，保护你的隐私信息</p>
            </form>
        </div>
    </div>
</section>

<!-- 底部信息区 -->
<footer class="bg-dark text-white pt-16 pb-8">
    <div class="container mx-auto px-8">
        <div class="grid grid-cols-4 gap-8 mb-12">
            <!-- 联系信息 -->
            <div>
                <div class="flex items-center space-x-2 mb-6">
                    <div class="w-10 h-10 rounded-lg bg-primary flex items-center justify-center text-white">
                        <i class="fa fa-rocket text-xl"></i>
                    </div>
                    <div>
                        <h3 class="text-lg font-bold">新精英生涯</h3>
                        <p class="text-gray-400 text-sm">成长，长成自己的样子</p>
                    </div>
                </div>

                <div class="space-y-4 mb-6">
                    <div class="flex items-start space-x-3">
                        <i class="fa fa-map-marker text-primary mt-1"></i>
                        <p class="text-gray-400">中国（上海）自由贸易试验区奥纳路55号1幢607室</p>
                    </div>
                    <div class="flex items-center space-x-3">
                        <i class="fa fa-phone text-primary"></i>
                        <p class="text-gray-400">400-0000-182（24小时免费咨询）</p>
                    </div>
                    <div class="flex items-center space-x-3">
                        <i class="fa fa-clock-o text-primary"></i>
                        <p class="text-gray-400">周一至周日 9:00-21:00</p>
                    </div>
                </div>

                <div class="flex space-x-4">
                    <a href="#" class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center text-white hover:bg-primary transition-colors">
                        <i class="fa fa-weibo"></i>
                    </a>
                    <a href="#" class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center text-white hover:bg-primary transition-colors">
                        <i class="fa fa-wechat"></i>
                    </a>
                    <a href="#" class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center text-white hover:bg-primary transition-colors">
                        <i class="fa fa-linkedin"></i>
                    </a>
                    <a href="#" class="w-10 h-10 rounded-full bg-white/10 flex items-center justify-center text-white hover:bg-primary transition-colors">
                        <i class="fa fa-youtube-play"></i>
                    </a>
                </div>
            </div>

            <!-- 快捷入口 -->
            <div>
                <h3 class="text-lg font-bold mb-6">快捷入口</h3>
                <ul class="space-y-3">
                    <li><a href="#courses" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 课程试听申请</a></li>
                    <li><a href="#consult" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 咨询师预约</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 学员登录</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 生涯测评工具</a></li>
                    <li><a href="#stories" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 学员成功故事</a></li>
                    <li><a href="#news" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 生涯资讯</a></li>
                </ul>
            </div>

            <!-- 课程体系 -->
            <div>
                <h3 class="text-lg font-bold mb-6">课程体系</h3>
                <ul class="space-y-3">
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 职业生涯规划-基石班</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 职业生涯咨询-实战班</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 一对一职业规划咨询</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 超级个体IP营</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 职业辅导「选对」平台</a></li>
                    <li><a href="#" class="text-gray-400 hover:text-white transition-colors"><i class="fa fa-angle-right mr-2 text-primary"></i> 企业内训服务</a></li>
                </ul>
            </div>

            <!-- 微信公众号 -->
            <div>
                <h3 class="text-lg font-bold mb-6">关注我们</h3>
                <p class="text-gray-400 mb-4">扫描二维码，关注公众号获取更多生涯规划资讯</p>
                <div class="bg-white p-4 rounded-lg inline-block mb-4">
                    <img src="https://picsum.photos/id/1/120/120" alt="微信公众号二维码" class="w-32 h-32">
                </div>
                <p class="text-gray-400">IP创氪师</p>

                <h3 class="text-lg font-bold mt-8 mb-4">下载APP</h3>
                <p class="text-gray-400 mb-2">随时随地学习，开启你的职业成长之旅</p>
                <div class="flex space-x-2">
                    <a href="#" class="w-12 h-12 rounded-lg bg-white/10 flex items-center justify-center text-white hover:bg-primary transition-colors">
                        <i class="fa fa-apple text-xl"></i>
                    </a>
                    <a href="#" class="w-12 h-12 rounded-lg bg-white/10 flex items-center justify-center text-white hover:bg-primary transition-colors">
                        <i class="fa fa-android text-xl"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="border-t border-gray-700 pt-8 text-center text-gray-500 text-sm">
            <p>© <%= new java.util.Date().getYear() + 1900 %> IP创氪师 版权所有</p>
        </div>
    </div>
</footer>

<!-- 返回顶部按钮 -->
<button id="back-to-top" class="fixed bottom-6 right-6 w-12 h-12 rounded-full bg-primary text-white shadow-lg flex items-center justify-center opacity-0 invisible transition-all z-50">
    <i class="fa fa-chevron-up"></i>
</button>

<!-- JavaScript -->
<script src="js/home.js"></script>
</body>
</html>