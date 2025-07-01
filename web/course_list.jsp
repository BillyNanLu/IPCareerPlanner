<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/7/1
  Time: 17:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="sidebar.jsp" %>

<div class="ml-64 p-8 bg-gray-100 min-h-screen">
  <h1 class="text-2xl font-bold mb-6">课程信息管理</h1>

  <div class="bg-white p-6 rounded shadow overflow-x-auto">
    <table class="min-w-full text-sm text-left border">
      <thead>
      <tr class="bg-gray-100 text-gray-600 uppercase">
        <th class="px-4 py-3">课程图片｜课程名称</th>
        <th class="px-4 py-3">分类</th>
        <th class="px-4 py-3">标签</th>
        <th class="px-4 py-3">讲师</th>
        <th class="px-4 py-3">价格</th>
        <th class="px-4 py-3">创建时间</th>
        <th class="px-4 py-3 text-right">操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="course" items="${courseList}">
        <tr class="border-t">
          <td class="px-4 py-2">
            <img src="${pageContext.request.contextPath}${course.image}" alt="${course.name}"
                 class="w-14 h-14 object-cover rounded border cursor-pointer"
                 onclick="showImageModal('${pageContext.request.contextPath}${course.image}')"/>
          </td>
          <td class="px-4 py-2 leading-snug text-sm text-gray-800">
            <c:forEach var="part" items="${fn:split(course.fullCategoryPath, '/')}">
              <div>${fn:trim(part)}</div>
            </c:forEach>
          </td>

          <td class="px-4 py-2">${course.tags}</td>
          <td class="px-4 py-2">
            <div class="flex flex-col gap-1">
              <c:forEach var="t" items="${course.teachers}">
                <span class="bg-gray-100 text-gray-800 px-2 py-1 rounded">${t}</span>
              </c:forEach>
            </div>
          </td>
          <td class="px-4 py-2 leading-snug">
            <div class="text-primary font-bold">
              ¥<fmt:formatNumber value="${course.price}" type="number" minFractionDigits="2" />
            </div>
            <c:if test="${course.discount < 1}">
              <div class="text-sm text-gray-400 line-through">
                ¥<fmt:formatNumber value="${course.price * course.discount}" type="number" minFractionDigits="2" />
              </div>
            </c:if>
          </td>
          <td class="px-4 py-2">${course.createdAt}</td>
          <td class="px-4 py-2 text-right whitespace-nowrap">
            <a href="courseView?id=${course.id}" class="text-blue-600 hover:underline mr-2">查看</a>
            <a href="courseEdit?id=${course.id}" class="text-green-600 hover:underline mr-2">编辑</a>
            <a href="course-delete?id=${course.id}" class="text-red-600 hover:underline"
               onclick="return confirm('确认删除该课程？')">删除</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>
</div>

<!-- 模态框 -->
<div id="imageModal" class="fixed inset-0 bg-black/70 hidden items-center justify-center z-50">
  <div class="bg-white p-4 rounded shadow-lg">
    <img id="modalImage" src="" class="max-w-[80vw] max-h-[80vh] rounded" />
    <button onclick="closeImageModal()" class="mt-4 block mx-auto px-4 py-1 bg-red-500 text-white rounded">关闭</button>
  </div>
</div>


<script>
  function showImageModal(src) {
    document.getElementById("modalImage").src = src;
    document.getElementById("imageModal").classList.remove("hidden");
    document.getElementById("imageModal").classList.add("flex");
  }
  function closeImageModal() {
    document.getElementById("imageModal").classList.add("hidden");
    document.getElementById("imageModal").classList.remove("flex");
  }
</script>


