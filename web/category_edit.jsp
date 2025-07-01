<%--
  Created by IntelliJ IDEA.
  User: nanlu
  Date: 2025/7/1
  Time: 15:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<title>IP创氪师-管理后台</title>

<%@ include file="sidebar.jsp" %>

<div class="ml-64 p-8 bg-gray-100 min-h-screen">
  <h1 class="text-2xl font-bold mb-6">编辑课程分类</h1>

  <div class="bg-white rounded shadow p-6 max-w-xl">
    <form action="categoryEdit" method="post" class="space-y-4">
      <input type="hidden" name="id" value="${category.id}" />

      <div>
        <label class="block mb-1 font-medium">分类名称</label>
        <input type="text" name="name" value="${category.name}" required
               class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-300" />
      </div>

<%--      <div>--%>
<%--        <label class="block mb-1 font-medium">分类类型</label>--%>
<%--        <input type="text" name="type" value="${category.type}" required--%>
<%--               class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-300" />--%>
<%--      </div>--%>

      <div>
        <label class="block mb-1 font-medium">分类类型</label>
        <select name="type" required
                class="w-full border rounded px-4 py-2 focus:ring focus:ring-blue-300">
          <c:forEach var="t" items="${typeList}">
            <option value="${t}" ${category.type == t ? 'selected' : ''}>${t}</option>
          </c:forEach>
        </select>
      </div>

      <div class="pt-2">
        <button type="submit"
                class="bg-blue-600 text-white px-6 py-2 rounded hover:bg-blue-700">保存修改</button>
        <a href="categoryList" class="ml-4 text-gray-600 hover:underline">取消</a>
      </div>
    </form>
  </div>
</div>

