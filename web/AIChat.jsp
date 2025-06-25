<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/6/26
  Time: 01:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>IP创氪师 -AI职业规划咨询</title>
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
          },
        }
      }
    </script>

    <style type="text/tailwindcss">
    @layer utilities {
      .content-auto { content-visibility: auto; }
      .text-shadow { text-shadow: 0 2px 4px rgba(0,0,0,0.1); }
      .transition-navbar { transition: background-color 0.3s, box-shadow 0.3s, padding 0.3s; }

      .card-hover {
        transition: transform 0.3s, box-shadow 0.3s, border-color 0.3s;
      }
      .card-hover:hover {
        transform: translateY(-5px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.06);
        border-color: theme('colors.primary');
      }

      .category-item {
        @apply relative cursor-pointer px-4 py-2 text-gray-700 hover:text-primary transition-colors;
      }
      .category-item.active {
        @apply text-primary border-b-2 border-primary;
      }

      .subcategory-item {
        @apply px-4 py-2 text-gray-600 hover:text-primary transition-colors cursor-pointer;
      }
      .subcategory-item.active {
        @apply text-primary;
      }

      .nav-link {
        @apply relative inline-block font-medium text-gray-700 hover:text-primary transition-colors;
      }
      .nav-link::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: -4px;
        height: 2px;
        width: 0%;
        background-color: theme('colors.primary');
        transition: width 0.3s;
      }
      .nav-link:hover::after {
        width: 100%;
      }

      .tag-hover {
        @apply px-3 py-1 text-sm rounded-full cursor-pointer transition-all bg-gray-100 text-gray-600;
      }
      .tag-hover:hover {
        @apply bg-primary text-white;
      }

      #back-to-top:hover {
        transform: scale(1.1) translateY(-2px);
        box-shadow: 0 8px 16px rgba(22, 93, 255, 0.3);
      }

      .social-icon {
        @apply w-10 h-10 rounded-full bg-white/10 flex items-center justify-center text-white transition-transform;
      }
      .social-icon:hover {
        @apply bg-primary scale-110;
      }

      .search-input {
        @apply w-full px-6 py-4 rounded-full border border-gray-300 shadow-sm backdrop-blur-md bg-white/70 focus:ring-2 focus:ring-primary focus:border-primary transition-all pl-12 pr-40;
      }

      .course-card {
        @apply bg-white rounded-xl border border-gray-100 p-6 shadow-sm hover:shadow-lg transition-transform hover:-translate-y-1 hover:border-primary;
      }

      .tab-btn {
        @apply px-6 py-2 rounded-full border border-gray-300 text-gray-700 hover:bg-gray-100 transition duration-300;
      }
      .active-tab {
        @apply bg-primary text-white border-primary;
      }
      .tab-section {
        @apply transition-opacity duration-300;
      }
      .content-fade {
        animation: fadeIn 0.5s ease-in-out;
      }
      @keyframes fadeIn {
        from { opacity: 0; transform: translateY(10px); }
        to { opacity: 1; transform: translateY(0); }
      }
    }
  </style>
</head>
<body class="font-inter text-dark antialiased bg-light">
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
        <a href="#courses" class="text-gray-700 hover:text-primary transition-colors font-medium">课程培训</a>
        <a href="#consulting" class="text-gray-700 hover:text-primary transition-colors font-medium">职业规划咨询</a>
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

          <a href="#" id="recommendBtn"
             class="bg-secondary hover:bg-secondary/90 text-white px-5 py-2 rounded-full font-medium transition-all shadow-md hover:shadow-lg transform hover:-translate-y-0.5">
            课程推荐
          </a>
        </div>
      </div>
    </div>
  </div>
</header>

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

</body>
</html>
