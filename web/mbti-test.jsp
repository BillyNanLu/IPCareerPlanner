<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MBTI职业性格测试 - IP创氪师</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css" rel="stylesheet">
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
                <h2 class="text-[clamp(1.5rem,3vw,2rem)] font-bold text-dark mb-4">MBTI职业性格测试</h2>
                <p class="text-gray-600 text-lg mb-6">基于MBTI性格理论，本测试将帮助你探索性格类型与职业适配方向</p>
                <p class="text-gray-500 mb-8">请根据真实感受选择答案，测试共20题，预计耗时8-10分钟</p>
            </div>
        </div>
    </section>
    <section class="py-12 bg-white">
        <div class="container mx-auto px-8 max-w-4xl">
            <form action="mbti-result.jsp" method="post" id="test-form">
                <input type="hidden" name="answers" id="answers">
                <div id="question-1" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">1. 你更倾向于从何处获取能量？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="E" class="mr-3 text-primary"><span>与他人相处互动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q1" value="I" class="mr-3 text-primary"><span>独自思考或安静环境</span></label>
                    </div>
                </div>
                <div id="question-2" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">2. 你更关注什么信息？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="S" class="mr-3 text-primary"><span>具体事实和实际情况</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q2" value="N" class="mr-3 text-primary"><span>可能性和抽象概念</span></label>
                    </div>
                </div>
                <div id="question-3" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">3. 做决定时，你更依赖？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="T" class="mr-3 text-primary"><span>逻辑分析和客观判断</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q3" value="F" class="mr-3 text-primary"><span>个人价值观和他人感受</span></label>
                    </div>
                </div>
                <div id="question-4" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">4. 你偏好的生活方式是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="J" class="mr-3 text-primary"><span>有计划、有组织</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q4" value="P" class="mr-3 text-primary"><span>灵活随意、顺其自然</span></label>
                    </div>
                </div>
                <div id="question-5" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">5. 会议中你更可能？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="E" class="mr-3 text-primary"><span>积极发言，分享想法</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q5" value="I" class="mr-3 text-primary"><span>先听后想，谨慎表达</span></label>
                    </div>
                </div>
                <div id="question-6" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">6. 学习新事物时，你更关注？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="S" class="mr-3 text-primary"><span>具体方法和实际应用</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q6" value="N" class="mr-3 text-primary"><span>整体框架和未来潜力</span></label>
                    </div>
                </div>
                <div id="question-7" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">7. 做选择时，你更重视？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="T" class="mr-3 text-primary"><span>公平合理，有逻辑</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q7" value="F" class="mr-3 text-primary"><span>和谐友好，照顾他人</span></label>
                    </div>
                </div>
                <div id="question-8" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">8. 工作任务截止前，你会？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="J" class="mr-3 text-primary"><span>提前完成，确保稳妥</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q8" value="P" class="mr-3 text-primary"><span>灵活安排，临近完成</span></label>
                    </div>
                </div>
                <div id="question-9" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">9. 社交活动后你通常感觉？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="E" class="mr-3 text-primary"><span>精力充沛，很有收获</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q9" value="I" class="mr-3 text-primary"><span>需要独处恢复精力</span></label>
                    </div>
                </div>
                <div id="question-10" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">10. 你对细节的态度是？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="S" class="mr-3 text-primary"><span>关注细节，确保准确</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q10" value="N" class="mr-3 text-primary"><span>更看重整体，忽略细节</span></label>
                    </div>
                </div>
                <div id="question-11" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">11. 处理冲突时你倾向于？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="T" class="mr-3 text-primary"><span>就事论事，理性解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q11" value="F" class="mr-3 text-primary"><span>顾及感受，寻求和谐</span></label>
                    </div>
                </div>
                <div id="question-12" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">12. 你更喜欢的计划方式？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="J" class="mr-3 text-primary"><span>详细规划，按部就班</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q12" value="P" class="mr-3 text-primary"><span>大致方向，灵活调整</span></label>
                    </div>
                </div>
                <div id="question-13" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">13. 你更擅长？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="E" class="mr-3 text-primary"><span>与人沟通协调</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q13" value="I" class="mr-3 text-primary"><span>独立思考分析</span></label>
                    </div>
                </div>
                <div id="question-14" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">14. 你对未来的看法？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="N" class="mr-3 text-primary"><span>充满可能性，值得探索</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q14" value="S" class="mr-3 text-primary"><span>基于现实，逐步推进</span></label>
                    </div>
                </div>
                <div id="question-15" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">15. 你做决定的速度？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="T" class="mr-3 text-primary"><span>较快，基于逻辑判断</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q15" value="F" class="mr-3 text-primary"><span>较慢，考虑多方感受</span></label>
                    </div>
                </div>
                <div id="question-16" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">16. 你对规则的态度？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="J" class="mr-3 text-primary"><span>遵守规则，维持秩序</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q16" value="P" class="mr-3 text-primary"><span>灵活对待，不必拘泥</span></label>
                    </div>
                </div>
                <div id="question-17" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">17. 空闲时间你更可能？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="E" class="mr-3 text-primary"><span>参加聚会或社交活动</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q17" value="I" class="mr-3 text-primary"><span>阅读、思考或独处</span></label>
                    </div>
                </div>
                <div id="question-18" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">18. 你解决问题的方式？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="S" class="mr-3 text-primary"><span>用已知方法逐步解决</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q18" value="N" class="mr-3 text-primary"><span>寻找新方法或灵感</span></label>
                    </div>
                </div>
                <div id="question-19" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">19. 你更在意他人的？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="F" class="mr-3 text-primary"><span>感受和需求</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q19" value="T" class="mr-3 text-primary"><span>观点的逻辑性</span></label>
                    </div>
                </div>
                <div id="question-20" class="mb-10 pb-6 border-b border-gray-100">
                    <h3 class="text-xl font-bold text-dark mb-4">20. 你对日程的态度？</h3>
                    <div class="space-y-3">
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="J" class="mr-3 text-primary"><span>喜欢提前安排好日程</span></label>
                        <label class="flex items-center p-3 border rounded-lg hover:border-primary cursor-pointer transition-colors"><input type="radio" name="q20" value="P" class="mr-3 text-primary"><span>偏好灵活，不喜欢被束缚</span></label>
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
            console.group('【MBTI职业性格测试】表单验证流程');
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
                alert(`请先完成所有题目`);
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