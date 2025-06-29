<%--
  Created by IntelliJ IDEA.
  User: Hp
  Date: 2025/6/24
  Time: 16:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>一对一职业规划咨询-IP创氪师</title>
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
            .dropdown-shadow {
                box-shadow: 0 10px 15px -3px rgba(0, 0, 0, 0.1), 0 4px 6px -2px rgba(0, 0, 0, 0.05);
            }
            .opacity-0 { opacity: 0; }
            .invisible { visibility: hidden; }
            .scale-95 { transform: scale(0.95); }
            .scale-100 { transform: scale(1); }
            .transition-all { transition: all 0.3s ease; }
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
                <a href="home.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">首页</a>
                <a href="#courses" class="text-gray-700 hover:text-primary transition-colors font-medium">课程培训</a>
                <div class="relative group">
                    <a href="consult.jsp" class="text-primary hover:text-primary/80 transition-colors font-medium border-b-2 border-primary">职业规划咨询</a>

                    <!-- 下拉菜单结构 -->
                    <div class="absolute left-0 mt-2 w-48 bg-white rounded-md shadow-lg py-1 z-50 opacity-0 invisible group-hover:opacity-100 group-hover:visible transition-all duration-300">
                        <a href="#consult" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary hover:text-white">
                            一对一职业规划咨询
                        </a>
                        <a href="#ai-consult" class="block px-4 py-2 text-sm text-gray-700 hover:bg-primary hover:text-white">
                            AI职业规划咨询
                        </a>
                    </div>
                </div>
                <a href="evaluation.jsp" class="text-gray-700 hover:text-primary transition-colors font-medium">职业测评</a>
                <a href="#teachers" class="text-gray-700 hover:text-primary transition-colors font-medium">师资团队</a>
                <a href="#my" class="text-gray-700 hover:text-primary transition-colors font-medium">个人中心</a>
            </nav>

            <div class="flex items-center space-x-4">
                <a href="#login" class="text-gray-700 hover:text-primary transition-colors font-medium">登录</a>
                <a href="#register" class="text-gray-700 hover:text-primary transition-colors font-medium">注册</a>
                <a href="#consult" class="bg-secondary hover:bg-secondary/90 text-white px-5 py-2 rounded-full font-medium transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
                    立即咨询
                </a>
            </div>
        </div>
    </div>
</header>

<section class="pt-24 bg-gradient-hero min-h-screen flex items-center">
    <div class="container mx-auto px-8 relative z-10">
        <div class="max-w-3xl">
            <h2 class="text-[clamp(2rem,5vw,2.8rem)] font-bold text-white leading-tight text-shadow mb-4">
                职业规划一对一咨询
            </h2>
            <h2 class="text-[clamp(2rem,5vw,2.8rem)] font-bold text-white leading-tight text-shadow mb-4">
                开启你的理想职业之路
            </h2>
            <p class="text-[clamp(1rem,2vw,1.25rem)] text-white/90 mb-8 max-w-2xl">
                无论你是职场新人还是资深从业者，我们的专业咨询师将为你提供个性化解决方案，助你突破职业瓶颈，实现职业目标
            </p>

            <div class="flex flex-row gap-4 mb-10">
                <a href="#consult" id="appointment-btn" class="bg-white text-primary hover:bg-gray-100 px-8 py-3 rounded-full font-medium transition-all shadow-lg hover:shadow-xl transform hover:-translate-y-1 text-center">
                    立即预约
                </a>
                <a href="#book" class="bg-secondary hover:bg-secondary/90 text-white px-8 py-3 rounded-full font-medium transition-all shadow-lg hover:shadow-xl transform hover:-translate-y-1 text-center">
                    在线咨询
                </a>
            </div>
        </div>
    </div>
</section>

<!-- 预约弹窗 -->
<div id="appointment-modal" class="fixed inset-0 bg-black/50 z-50 flex items-center justify-center opacity-0 invisible transition-all duration-300">
    <div class="bg-white rounded-xl shadow-2xl w-full max-w-md mx-4 transform transition-all duration-300 scale-95">
        <div class="p-6">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-xl font-bold text-dark">请填写预约信息</h3>
                <button id="close-modal" class="text-gray-400 hover:text-gray-600">
                    <i class="fa fa-times text-xl"></i>
                </button>
            </div>

            <form id="appointment-form" class="space-y-4">
                <div>
                    <label for="name" class="block text-sm font-medium text-gray-700 mb-1">姓名</label>
                    <input type="text" id="name" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary" placeholder="请输入">
                </div>

                <div>
                    <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">电话</label>
                    <input type="tel" id="phone" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary" placeholder="请输入">
                </div>

                <div>
                    <label for="time" class="block text-sm font-medium text-gray-700 mb-1">方便时间</label>
                    <select id="time" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary appearance-none bg-white">
                        <option value="" disabled selected>请选择</option>
                        <option value="morning">上午</option>
                        <option value="afternoon">下午</option>
                        <option value="evening">晚上</option>
                        <option value="weekend">周末</option>
                    </select>
                </div>

                <div>
                    <label for="city" class="block text-sm font-medium text-gray-700 mb-1">选择城市</label>
                    <select id="city" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary appearance-none bg-white">
                        <option value="" disabled selected>请选择</option>
                        <option value="anhui">安徽省</option>
                        <option value="beijing">北京市</option>
                        <option value="shanghai">上海市</option>
                    </select>
                </div>

                <div class="grid grid-cols-2 gap-4">
                    <div>
                        <label for="industry" class="block text-sm font-medium text-gray-700 mb-1">行业职业</label>
                        <input type="text" id="industry" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary" placeholder="请输入">
                    </div>
                    <div>
                        <label for="experience" class="block text-sm font-medium text-gray-700 mb-1">入职年份</label>
                        <input type="text" id="experience" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary" placeholder="请输入">
                    </div>
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-2">是否愿意了解付费咨询</label>
                    <div class="flex space-x-6">
                        <label class="flex items-center">
                            <input type="radio" name="paid" value="yes" class="text-primary focus:ring-primary h-4 w-4">
                            <span class="ml-2 text-gray-700">是</span>
                        </label>
                        <label class="flex items-center">
                            <input type="radio" name="paid" value="no" class="text-primary focus:ring-primary h-4 w-4">
                            <span class="ml-2 text-gray-700">否</span>
                        </label>
                    </div>
                </div>

                <button type="submit" class="w-full bg-secondary hover:bg-secondary/90 text-white px-6 py-3 rounded-lg font-medium transition-all shadow-md hover:shadow-lg">
                    提交
                </button>
            </form>
        </div>
    </div>
</div>


<!-- 在线咨询弹窗 -->
<div id="online-consult-modal" class="fixed inset-0 bg-black/50 z-50 flex items-center justify-center opacity-0 invisible transition-all duration-300">
    <div class="bg-white rounded-xl shadow-2xl w-full max-w-md mx-4 transform transition-all duration-300 scale-95">
        <div class="p-4 bg-primary text-white flex justify-between items-center">
            <h3 class="text-lg font-bold">在线咨询</h3>
            <button id="close-consult-modal" class="text-white hover:text-gray-200">
                <i class="fa fa-times text-xl"></i>
            </button>
        </div>

        <div id="chat-messages" class="p-4 max-h-[400px] overflow-y-auto space-y-4">
            <div class="flex items-start">
                <img src="https://picsum.photos/id/1027/50/50" alt="客服头像" class="w-10 h-10 rounded-full object-cover mr-3">
                <div class="bg-gray-100 rounded-lg p-3 max-w-[80%]">
                    <p class="text-gray-700">您好！我是职业规划咨询客服，很高兴为您服务。请问有什么可以帮到您的吗？</p>
                </div>
            </div>
        </div>

        <div class="p-4 border-t">
            <div class="flex space-y-3">
                <div class="flex gap-2">
                    <input type="text" id="chat-input" class="flex-1 px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-primary/50 focus:border-primary" placeholder="输入您的问题...">
                    <button id="send-message" class="bg-primary hover:bg-primary/90 text-white px-4 py-2 rounded-lg transition-colors">
                        <i class="fa fa-paper-plane"></i>
                    </button>
                </div>
                <div class="flex flex-wrap gap-2">
                    <button class="quick-reply bg-gray-100 hover:bg-gray-200 text-gray-700 px-3 py-1 rounded-full text-sm transition-colors">我该如何选择咨询师？</button>
                    <button class="quick-reply bg-gray-100 hover:bg-gray-200 text-gray-700 px-3 py-1 rounded-full text-sm transition-colors">线上咨询有效果吗？</button>
                    <button class="quick-reply bg-gray-100 hover:bg-gray-200 text-gray-700 px-3 py-1 rounded-full text-sm transition-colors">咨询费用是多少？</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 核心服务模块 - 问题解决 -->
<section id="problems" class="py-16 bg-light">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">职业规划咨询解决哪些问题</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">专业的咨询师用专业的方法，帮你理清思路，认清环境，整合资源，找到专属于你的解决之道</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
            <!-- 问题1 -->
            <div class="bg-white rounded-xl shadow-md p-6 card-hover">
                <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                    <i class="fa fa-compass text-xl"></i>
                </div>
                <h3 class="text-xl font-bold text-dark mb-2">没方向</h3>
                <p class="text-gray-500">
                    感觉很迷茫，不知道该做啥？<br>
                    工作就是打杂，这样有发展吗？<br>
                    经过系统分析，定制化帮你找到合适方向
                </p>
            </div>

            <!-- 问题2 -->
            <div class="bg-white rounded-xl shadow-md p-6 card-hover">
                <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                    <i class="fa fa-tachometer text-xl"></i>
                </div>
                <h3 class="text-xl font-bold text-dark mb-2">发展慢</h3>
                <p class="text-gray-500">
                    薪资没同学高，想换好工作？<br>
                    工作遇到瓶颈，如何突破？<br>
                    帮你打掉"思维里的墙"，打通职业路径
                </p>
            </div>

            <!-- 问题3 -->
            <div class="bg-white rounded-xl shadow-md p-6 card-hover">
                <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                    <i class="fa fa-exclamation-triangle text-xl"></i>
                </div>
                <h3 class="text-xl font-bold text-dark mb-2">纠结选</h3>
                <p class="text-gray-500">
                    逃离体制家人不同意？<br>
                    面临好几个机会，选哪一个？<br>
                    打造1-3年发展路线，让规划具体落地
                </p>
            </div>

            <!-- 问题4 -->
            <div class="bg-white rounded-xl shadow-md p-6 card-hover">
                <div class="w-12 h-12 rounded-lg bg-primary/10 flex items-center justify-center text-primary mb-4">
                    <i class="fa fa-balance-scale text-xl"></i>
                </div>
                <h3 class="text-xl font-bold text-dark mb-2">难平衡</h3>
                <p class="text-gray-500">
                    想要娃担忧发展受阻？<br>
                    工作挤压生活难平衡？<br>
                    探讨可行转型方向和实施策略
                </p>
            </div>
        </div>
    </div>
</section>

<!-- 咨询流程 -->
<section id="process" class="py-16 bg-white">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">咨询流程</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">简单清晰的咨询流程，让你轻松开启职业规划之旅</p>
        </div>

        <div class="relative">
            <!-- 连接线 -->
            <div class="absolute left-1/2 transform -translate-x-1/2 h-full w-0.5 bg-primary/20 top-0 bottom-0"></div>

            <div class="space-y-12 relative">
                <!-- 步骤1 -->
                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 md:pr-12 md:text-right mb-6 md:mb-0">
                        <h3 class="text-xl font-bold text-dark mb-2">专业顾问一对一沟通</h3>
                        <p class="text-gray-500">首先与专业职业发展顾问进行沟通，梳理和澄清您的职业问题与需求</p>
                    </div>
                    <div class="w-12 h-12 rounded-full bg-primary text-white flex items-center justify-center text-xl font-bold z-10">1</div>
                    <div class="md:w-1/2 md:pl-12 hidden md:block"></div>
                </div>

                <!-- 步骤2 -->
                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 md:pr-12 hidden md:block"></div>
                    <div class="w-12 h-12 rounded-full bg-primary text-white flex items-center justify-center text-xl font-bold z-10">2</div>
                    <div class="md:w-1/2 md:pl-12 mt-6 md:mt-0">
                        <h3 class="text-xl font-bold text-dark mb-2">选择咨询师并完成报名缴费</h3>
                        <p class="text-gray-500">根据您的问题和需求，选择合适的咨询师并完成报名缴费流程</p>
                    </div>
                </div>

                <!-- 步骤3 -->
                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 md:pr-12 md:text-right mb-6 md:mb-0">
                        <h3 class="text-xl font-bold text-dark mb-2">完成信息收纳表及专业测评</h3>
                        <p class="text-gray-500">填写详细的信息收纳表并完成专业职业测评，为咨询做充分准备</p>
                    </div>
                    <div class="w-12 h-12 rounded-full bg-primary text-white flex items-center justify-center text-xl font-bold z-10">3</div>
                    <div class="md:w-1/2 md:pl-12 hidden md:block"></div>
                </div>

                <!-- 步骤4 -->
                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 md:pr-12 hidden md:block"></div>
                    <div class="w-12 h-12 rounded-full bg-primary text-white flex items-center justify-center text-xl font-bold z-10">4</div>
                    <div class="md:w-1/2 md:pl-12 mt-6 md:mt-0">
                        <h3 class="text-xl font-bold text-dark mb-2">与咨询师约定咨询时间</h3>
                        <p class="text-gray-500">与您选择的咨询师协商并确定具体的咨询时间</p>
                    </div>
                </div>

                <!-- 步骤5 -->
                <div class="flex flex-col md:flex-row items-center">
                    <div class="md:w-1/2 md:pr-12 md:text-right mb-6 md:mb-0">
                        <h3 class="text-xl font-bold text-dark mb-2">开启正式咨询</h3>
                        <p class="text-gray-500">按照约定时间，与咨询师开启正式的职业规划咨询服务</p>
                    </div>
                    <div class="w-12 h-12 rounded-full bg-primary text-white flex items-center justify-center text-xl font-bold z-10">5</div>
                    <div class="md:w-1/2 md:pl-12 hidden md:block"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 咨询形式 -->
<section id="form" class="py-16 bg-light">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">咨询形式</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">主要分为两种形式：计次式咨询和案例式咨询，并有专业的顾问提供咨询前、中、后期的服务</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- 计次式咨询 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-2 flex items-center">
                        <i class="fa fa-clock-o text-primary mr-2"></i>计次式咨询
                    </h3>
                </div>
                <div class="p-6">
                    <ul class="space-y-3 text-gray-600">
                        <li class="flex items-start">
                            <i class="fa fa-check text-primary mt-1 mr-2"></i>
                            <span>一次咨询时间为1-1.5小时</span>
                        </li>
                        <li class="flex items-start">
                            <i class="fa fa-check text-primary mt-1 mr-2"></i>
                            <span>根据需求自主决定咨询次数</span>
                        </li>
                        <li class="flex items-start">
                            <i class="fa fa-info-circle text-gray-400 mt-1 mr-2"></i>
                            <span>适合相对简单的职业问题，如能力优势探索、行职业信息了解等</span>
                        </li>
                    </ul>
                </div>
            </div>

            <!-- 案例式咨询 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <div class="p-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-2 flex items-center">
                        <i class="fa fa-tasks text-primary mr-2"></i>案例式咨询
                    </h3>
                </div>
                <div class="p-6">
                    <ul class="space-y-3 text-gray-600">
                        <li class="flex items-start">
                            <i class="fa fa-check text-primary mt-1 mr-2"></i>
                            <span>以解决一个职业问题为咨询目标</span>
                        </li>
                        <li class="flex items-start">
                            <i class="fa fa-check text-primary mt-1 mr-2"></i>
                            <span>第一次咨询前30分钟为试咨询期，不满意可退款</span>
                        </li>
                        <li class="flex items-start">
                            <i class="fa fa-check text-primary mt-1 mr-2"></i>
                            <span>2个月内多次咨询，平均3次左右</span>
                        </li>
                        <li class="flex items-start">
                            <i class="fa fa-check text-primary mt-1 mr-2"></i>
                            <span>案例结束后提供咨询结案报告，并开启3个月支持期</span>
                        </li>
                        <li class="flex items-start">
                            <i class="fa fa-info-circle text-gray-400 mt-1 mr-2"></i>
                            <span>适合复杂职业问题，如职业定位、转型、愿景平衡等</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>

        <div class="mt-12 bg-white rounded-xl shadow-md p-8">
            <h3 class="text-xl font-bold text-dark mb-6 flex items-center">
                <i class="fa fa-comments text-primary mr-2"></i>咨询方式
            </h3>
            <div class="flex flex-wrap gap-6">
                <div class="flex items-center">
                    <div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary mr-3">
                        <i class="fa fa-map-marker text-xl"></i>
                    </div>
                    <span class="text-gray-700">面对面咨询</span>
                </div>
                <div class="flex items-center">
                    <div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary mr-3">
                        <i class="fa fa-phone text-xl"></i>
                    </div>
                    <span class="text-gray-700">电话线上咨询</span>
                </div>
                <div class="flex items-center">
                    <div class="w-10 h-10 rounded-lg bg-primary/10 flex items-center justify-center text-primary mr-3">
                        <i class="fa fa-wechat text-xl"></i>
                    </div>
                    <span class="text-gray-700">微信线上咨询</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 咨询师等级与收费 -->
<section id="pricing" class="py-16 bg-white">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">咨询师等级与收费标准</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">新精英的签约咨询师，根据多个维度分为不同等级，满足不同咨询需求</p>
        </div>

        <div class="overflow-x-auto">
            <table class="w-full min-w-max border-collapse">
                <thead>
                <tr class="bg-gray-50">
                    <th class="py-4 px-6 text-left font-bold text-dark border-b">咨询师等级</th>
                    <th class="py-4 px-6 text-left font-bold text-dark border-b">专业背景</th>
                    <th class="py-4 px-6 text-left font-bold text-dark border-b">案例式咨询</th>
                    <th class="py-4 px-6 text-left font-bold text-dark border-b">计次式咨询</th>
                </tr>
                </thead>
                <tbody>
                <tr class="border-b hover:bg-gray-50 transition-colors">
                    <td class="py-4 px-6 font-medium text-dark">资深专家</td>
                    <td class="py-4 px-6 text-gray-600">具有10年以上咨询经验，行业领军人物，多项专业认证</td>
                    <td class="py-4 px-6 text-primary font-bold">6880元/案 起</td>
                    <td class="py-4 px-6 text-primary font-bold">1500元/次 起</td>
                </tr>
                <tr class="border-b hover:bg-gray-50 transition-colors">
                    <td class="py-4 px-6 font-medium text-dark">资深咨询师</td>
                    <td class="py-4 px-6 text-gray-600">具有8年以上咨询经验，丰富的实战经验和专业知识</td>
                    <td class="py-4 px-6 text-primary font-bold">5980元/案 起</td>
                    <td class="py-4 px-6 text-primary font-bold">1500元/次 起</td>
                </tr>
                <tr class="border-b hover:bg-gray-50 transition-colors">
                    <td class="py-4 px-6 font-medium text-dark">高级咨询师</td>
                    <td class="py-4 px-6 text-gray-600">具有5年以上咨询经验，专业认证齐全，客户满意度高</td>
                    <td class="py-4 px-6 text-primary font-bold">3880元/案 起</td>
                    <td class="py-4 px-6 text-primary font-bold">1000元/次 起</td>
                </tr>
                <tr class="hover:bg-gray-50 transition-colors">
                    <td class="py-4 px-6 font-medium text-dark">职业咨询师</td>
                    <td class="py-4 px-6 text-gray-600">经过专业培训认证，具有3年以上咨询经验</td>
                    <td class="py-4 px-6 text-primary font-bold">1980元/案 起</td>
                    <td class="py-4 px-6 text-primary font-bold">800元/次 起</td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
</section>

<!-- 咨询师团队 -->
<section id="consultants" class="py-16 bg-light">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">咨询师团队</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">我们拥有行业顶尖的师资力量，每位咨询师都具备丰富的实战经验和专业知识</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
            <!-- 咨询师1 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1012/600/400" alt="冰舒老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">冰舒</h3>
                    <p class="text-primary mb-3">国内资深生涯发展专家 / 叙事实践专家</p>
                    <p class="text-gray-500 text-sm mb-4">
                        国际注册高级叙事咨询师、国家认证二级心理咨询师、中澳国际叙事中心研究员、国际达利奇中心认证高级叙事咨询师
                    </p>
                </div>
            </div>

            <!-- 咨询师2 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1027/600/400" alt="王奕霖老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">王奕霖</h3>
                    <p class="text-primary mb-3">生涯咨询资深专家 / TA人际沟通分析师</p>
                    <p class="text-gray-500 text-sm mb-4">
                        国家认证生涯规划师(CMT)、国际沟通分析治疗师（CTA）、清华大学生涯规划课程客座讲师、石油大学特聘讲师
                    </p>
                </div>
            </div>

            <!-- 咨询师3 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1074/600/400" alt="史延岩老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">史延岩</h3>
                    <p class="text-primary mb-3">新精英资深生涯咨询师 / TA人际沟通分析师</p>
                    <p class="text-gray-500 text-sm mb-4">
                        国家二级心理咨询师、中国科学院心理研究所在职研究生、中国人民大学职业生涯人物访谈大赛评委
                    </p>
                </div>
            </div>

            <!-- 咨询师4 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1066/600/400" alt="薛向阳老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">薛向阳</h3>
                    <p class="text-primary mb-3">新精英资深生涯咨询师 / 注册会计师</p>
                    <p class="text-gray-500 text-sm mb-4">
                        国家认证生涯规划师(CMT)、ACCA英国特许公认会计师公会资深会员、CICPA中国注册会计师协会非执业会员
                    </p>
                </div>
            </div>

            <!-- 咨询师5 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1025/600/400" alt="何文姬老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">何文姬</h3>
                    <p class="text-primary mb-3">新精英资深生涯咨询师 / 叙事治疗师</p>
                    <p class="text-gray-500 text-sm mb-4">
                        国家认证生涯规划师(CMT)、新精英咨询实战班教练、国家二级心理咨询师、新精英生涯选对职场导师
                    </p>
                </div>
            </div>

            <!-- 咨询师6 -->
            <div class="bg-white rounded-xl shadow-md overflow-hidden card-hover">
                <img src="https://picsum.photos/id/1011/600/400" alt="郭农老师" class="w-full h-64 object-cover">
                <div class="p-6">
                    <h3 class="text-xl font-bold text-dark mb-1">郭农</h3>
                    <p class="text-primary mb-3">新精英资深生涯咨询师 / 人力资源管理顾问</p>
                    <p class="text-gray-500 text-sm mb-4">
                        国家认证高级职业生涯指导师、新精英咨询实战班督导、资深人力资源管理顾问、企业版权课授证讲师
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 客户反馈 -->
<section id="feedback" class="py-16 bg-white">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">客户反馈</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">听听他们如何通过我们的职业规划咨询，实现职业转型和个人成长的故事</p>
        </div>

        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            <!-- 反馈1 -->
            <div class="bg-light rounded-xl shadow-md p-6 card-hover">
                <div class="flex items-start mb-4">
                    <img src="https://picsum.photos/id/1027/60/60" alt="客户头像" class="w-12 h-12 rounded-full object-cover mr-4">
                    <div>
                        <h3 class="text-lg font-bold text-dark">张先生</h3>
                        <p class="text-gray-500 text-sm">互联网行业从业者</p>
                    </div>
                </div>
                <p class="text-gray-600 mb-4">
                    "老师，很高兴跟您说，去年结束咨询后一年，我现在进到了比较好的公司，是香港最top的app方案商，给政府、银行、铁路等做项目，我主攻AR增强现实。目前转正了，薪资比之前涨了一半，工作文化也很适合我。是咨询定的三个方向其中之一。去年很艰难，挨过来了。"
                </p>
                <p class="text-gray-500 text-sm">咨询时间：2024年3月</p>
            </div>

            <!-- 反馈2 -->
            <div class="bg-light rounded-xl shadow-md p-6 card-hover">
                <div class="flex items-start mb-4">
                    <img src="https://picsum.photos/id/1066/60/60" alt="客户头像" class="w-12 h-12 rounded-full object-cover mr-4">
                    <div>
                        <h3 class="text-lg font-bold text-dark">李女士</h3>
                        <p class="text-gray-500 text-sm">教育行业从业者</p>
                    </div>
                </div>
                <p class="text-gray-600 mb-4">
                    "昨天下午非常感谢Luc老师的职位生涯咨询，让我更好的看清了自己的现状，明确自己发展方向，专业！现在我在上海一家世界500强公司工作，各方面都非常好，我非常满意。"
                </p>
                <p class="text-gray-500 text-sm">咨询时间：2024年1月</p>
            </div>

            <!-- 反馈3 -->
            <div class="bg-light rounded-xl shadow-md p-6 card-hover md:col-span-2">
                <div class="flex items-start mb-4">
                    <img src="https://picsum.photos/id/1025/60/60" alt="客户头像" class="w-12 h-12 rounded-full object-cover mr-4">
                    <div>
                        <h3 class="text-lg font-bold text-dark">王同学</h3>
                        <p class="text-gray-500 text-sm">应届毕业生</p>
                    </div>
                </div>
                <p class="text-gray-600 mb-4">
                    "哈喽，我是[王同学]，感谢您的帮助，我终于找到了工作，在上海一家世界500强公司。各方面都非常好，我非常满意。亲爱的Cathy，不知道你还记得我不，我是[王同学]。记得你之前给我做职业生涯规划，告诉我我适合做小学老师。我现在正在这条路上，并且很爱这个职业。谢谢！"
                </p>
                <p class="text-gray-500 text-sm">咨询时间：2023年9月</p>
            </div>
        </div>

        <div class="mt-12 text-center">
            <div class="flex justify-center items-center mb-4">
                <div class="text-4xl font-bold text-primary mr-2 animate-number" data-target="10000">0</div>
                <span class="text-gray-500">+成功案例</span>
            </div>
            <div class="flex justify-center items-center">
                <div class="text-4xl font-bold text-primary mr-2 animate-number" data-target="98">0</div>
                <span class="text-gray-500">%客户满意度</span>
            </div>
        </div>
    </div>
</section>

<!-- 常见问题 -->
<section id="faq" class="py-16 bg-light">
    <div class="container mx-auto px-8">
        <div class="text-center mb-12">
            <h2 class="text-[clamp(1.5rem,3vw,2.5rem)] font-bold text-dark mb-4">常见问题</h2>
            <p class="text-gray-500 max-w-2xl mx-auto">解答您关于职业规划咨询的常见疑问</p>
        </div>

        <div class="max-w-3xl mx-auto">
            <div class="space-y-6">
                <!-- 问题1 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden">
                    <button class="faq-toggle w-full px-6 py-4 text-left font-medium text-dark flex justify-between items-center">
                        <span>我该如何选择咨询师？</span>
                        <i class="fa fa-chevron-down text-primary transition-transform"></i>
                    </button>
                    <div class="faq-content px-6 pb-4 text-gray-600 hidden">
                        <p>有专业的职业发展顾问跟您进行一对一沟通，帮您梳理和澄清问题，根据您的需求，帮您推荐符合您期待的咨询师；您也可以登录新精英的官网，详细了解每位咨询师的资料，自行选择咨询师。</p>
                    </div>
                </div>

                <!-- 问题2 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden">
                    <button class="faq-toggle w-full px-6 py-4 text-left font-medium text-dark flex justify-between items-center">
                        <span>线上咨询能够保证效果吗？</span>
                        <i class="fa fa-chevron-down text-primary transition-transform"></i>
                    </button>
                    <div class="faq-content px-6 pb-4 text-gray-600 hidden">
                        <p>现在互联网发达，70%以上的咨询都是线上远程进行，从我们过往对于咨询客户的跟进来判断，咨询方式不会影响咨询结果；选择咨询师时最重要的还是跟咨询师的匹配度。</p>
                    </div>
                </div>

                <!-- 问题3 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden">
                    <button class="faq-toggle w-full px-6 py-4 text-left font-medium text-dark flex justify-between items-center">
                        <span>案例式咨询与计次式咨询的区别？</span>
                        <i class="fa fa-chevron-down text-primary transition-transform"></i>
                    </button>
                    <div class="faq-content px-6 pb-4 text-gray-600 hidden">
                        <p>案例式咨询是结果导向的，以解决一个复杂职业问题为目标，在两个月内提供多次咨询的服务。像职业定位、职业转型、职业生涯愿景平衡等，这样需要多次咨询的情况推荐使用案例式咨询。</p>
                        <p>相对简单的能力优势探索、了解行职业信息、职业选择（比如拿了两个offer不知道选择哪个）这种单次可以解决的，推荐计次咨询，可根据实际需求选择咨询的次数。</p>
                    </div>
                </div>

                <!-- 问题4 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden">
                    <button class="faq-toggle w-full px-6 py-4 text-left font-medium text-dark flex justify-between items-center">
                        <span>职业规划咨询能给我带来那些帮助？</span>
                        <i class="fa fa-chevron-down text-primary transition-transform"></i>
                    </button>
                    <div class="faq-content px-6 pb-4 text-gray-600 hidden">
                        <p>职业规划咨询能让你对自己有更深的认识，帮你突破职业发展过程中的障碍点，让你实现各种平衡，帮你纾解工作中的负面情绪干扰让你更快乐的工作，还能让你不纠结的做出决策。</p>
                    </div>
                </div>

                <!-- 问题5 -->
                <div class="bg-white rounded-xl shadow-md overflow-hidden">
                    <button class="faq-toggle w-full px-6 py-4 text-left font-medium text-dark flex justify-between items-center">
                        <span>咨询前需要做哪些准备？</span>
                        <i class="fa fa-chevron-down text-primary transition-transform"></i>
                    </button>
                    <div class="faq-content px-6 pb-4 text-gray-600 hidden">
                        <p>在咨询前，你需要先与职业发展顾问进行沟通，明确自己的职业问题和需求。然后完成信息收纳表及专业测评，这些资料将帮助咨询师更好地了解你，为咨询做充分准备。</p>
                    </div>
                </div>
            </div>
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
                        <p class="text-gray-400">上海市浦东新区奥纳路55号1幢607室</p>
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
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
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
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
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
                    const increment = Math.ceil(target / 50); // 分50步完成动画

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

    // FAQ切换
    const faqToggles = document.querySelectorAll('.faq-toggle');
    faqToggles.forEach(toggle => {
        toggle.addEventListener('click', () => {
            const content = toggle.nextElementSibling;
            const icon = toggle.querySelector('i');

            content.classList.toggle('hidden');
            icon.classList.toggle('rotate-180');
        });
    });

    // 页面加载完成后执行动画
    window.addEventListener('load', () => {
        animateNumbers();
    });

    // 新增下拉菜单交互逻辑
    document.addEventListener('DOMContentLoaded', function() {
        const navItems = document.querySelectorAll('.group');

        navItems.forEach(item => {
            // 鼠标进入时显示下拉菜单
            item.addEventListener('mouseenter', function() {
                const dropdown = this.querySelector('.absolute');
                if (dropdown) {
                    dropdown.style.opacity = '1';
                    dropdown.style.visibility = 'visible';
                    dropdown.style.transform = 'translateY(0)';
                }
            });

            // 鼠标离开时隐藏下拉菜单
            item.addEventListener('mouseleave', function() {
                const dropdown = this.querySelector('.absolute');
                if (dropdown) {
                    dropdown.style.opacity = '0';
                    dropdown.style.visibility = 'hidden';
                    dropdown.style.transform = 'translateY(-10px)';
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function() {
        // 获取DOM元素
        const appointmentModal = document.getElementById('appointment-modal');
        const appointmentBtn = document.getElementById('appointment-btn');
        const closeModalBtn = document.getElementById('close-modal');
        const appointmentForm = document.getElementById('appointment-form');

        // 打开弹窗
        appointmentBtn.addEventListener('click', (e) => {
            e.preventDefault(); // 阻止默认跳转行为
            appointmentModal.classList.remove('opacity-0', 'invisible');
            appointmentModal.querySelector('div').classList.remove('scale-95');
            appointmentModal.querySelector('div').classList.add('scale-100');
        });

        // 关闭弹窗
        closeModalBtn.addEventListener('click', () => {
            appointmentModal.classList.add('opacity-0', 'invisible');
            appointmentModal.querySelector('div').classList.remove('scale-100');
            appointmentModal.querySelector('div').classList.add('scale-95');
        });

        // 点击弹窗背景关闭弹窗
        appointmentModal.addEventListener('click', (e) => {
            if (e.target === appointmentModal) {
                appointmentModal.classList.add('opacity-0', 'invisible');
                appointmentModal.querySelector('div').classList.remove('scale-100');
                appointmentModal.querySelector('div').classList.add('scale-95');
            }
        });

        // 表单提交处理
        appointmentForm.addEventListener('submit', (e) => {
            e.preventDefault();
            alert('预约信息已提交，我们将尽快与您联系！');
            // 提交后关闭弹窗
            appointmentModal.classList.add('opacity-0', 'invisible');
            appointmentModal.querySelector('div').classList.remove('scale-100');
            appointmentModal.querySelector('div').classList.add('scale-95');
            // 重置表单
            appointmentForm.reset();
        });
    });


    // 在线咨询弹窗交互
    document.addEventListener('DOMContentLoaded', function() {
        const onlineConsultModal = document.getElementById('online-consult-modal');
        const onlineConsultBtn = document.querySelector('a[href="#book"]');
        const closeConsultModalBtn = document.getElementById('close-consult-modal');
        const chatInput = document.getElementById('chat-input');
        const sendMessageBtn = document.getElementById('send-message');
        const quickReplies = document.querySelectorAll('.quick-reply');
        const chatMessages = document.getElementById('chat-messages');

        // 打开在线咨询弹窗
        onlineConsultBtn.addEventListener('click', (e) => {
            e.preventDefault(); // 阻止默认跳转行为
            onlineConsultModal.classList.remove('opacity-0', 'invisible');
            onlineConsultModal.querySelector('div').classList.remove('scale-95');
            onlineConsultModal.querySelector('div').classList.add('scale-100');

            // 自动滚动到底部
            chatMessages.scrollTop = chatMessages.scrollHeight;
        });

        // 关闭在线咨询弹窗
        closeConsultModalBtn.addEventListener('click', () => {
            onlineConsultModal.classList.add('opacity-0', 'invisible');
            onlineConsultModal.querySelector('div').classList.remove('scale-100');
            onlineConsultModal.querySelector('div').classList.add('scale-95');
        });

        // 点击弹窗背景关闭弹窗
        onlineConsultModal.addEventListener('click', (e) => {
            if (e.target === onlineConsultModal) {
                onlineConsultModal.classList.add('opacity-0', 'invisible');
                onlineConsultModal.querySelector('div').classList.remove('scale-100');
                onlineConsultModal.querySelector('div').classList.add('scale-95');
            }
        });

        // 发送消息功能
        function sendMessage() {
            const message = chatInput.value.trim();
            if (message) {
                // 添加用户消息
                const userMessage = document.createElement('div');
                userMessage.className = 'flex items-start justify-end';
                userMessage.innerHTML = `
                <div class="bg-primary text-white rounded-lg p-3 max-w-[80%]">
                    <p>${message}</p>
                </div>
                <img src="https://picsum.photos/id/1066/50/50" alt="用户头像" class="w-10 h-10 rounded-full object-cover ml-3">
            `;
                chatMessages.appendChild(userMessage);

                // 模拟客服回复
                setTimeout(() => {
                    const botMessage = document.createElement('div');
                    botMessage.className = 'flex items-start';
                    botMessage.innerHTML = `
                    <img src="https://picsum.photos/id/1027/50/50" alt="客服头像" class="w-10 h-10 rounded-full object-cover mr-3">
                    <div class="bg-gray-100 rounded-lg p-3 max-w-[80%]">
                        <p class="text-gray-700">感谢您的咨询！我们的专业顾问将尽快为您解答。请问您还有其他问题吗？</p>
                    </div>
                `;
                    chatMessages.appendChild(botMessage);

                    // 滚动到底部
                    chatMessages.scrollTop = chatMessages.scrollHeight;
                }, 1000);

                // 清空输入框
                chatInput.value = '';
            }
        }

        // 发送消息按钮点击事件
        sendMessageBtn.addEventListener('click', sendMessage);

        // 输入框回车发送消息
        chatInput.addEventListener('keypress', (e) => {
            if (e.key === 'Enter') {
                sendMessage();
            }
        });

        // 快捷回复点击事件
        quickReplies.forEach(reply => {
            reply.addEventListener('click', () => {
                chatInput.value = reply.textContent;
                sendMessage();
            });
        });
    });


</script>
</body>
</html>
