<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/13
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>工号添加</title>
</head>
<body>
<div class="row" style="margin-top: 30px;">
    <div class="col-lg-2"></div>
    <div class="col-lg-6">


        <form:form action="/user/add" method="post">
            <div class="form-group">
                <label for="username">用户名:</label>
                <input type="text" class="form-group" id="username" name="userName" value="${user.username}">
            </div>

            <div class="form-group">
                <label for="password">密   码:</label>
                <input type="text" id="password" name="password" value="${user.password}">
            </div>

            <button type="submit" class="btn btn-default">提交</button>
        </form:form>
    </div>
</div>
</body>
</html>
