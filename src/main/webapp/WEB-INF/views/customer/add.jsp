<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/6/13
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html" pageEncoding="utf-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <title>客户添加</title>
</head>
<body>
    <div class="row" style="margin-top: 30px;">
        <div class="col-lg-2"></div>
        <div class="col-lg-6">
            <c:if test="${!empty error}">
                <div class="alert alert-danger" role="alert">${error}</div>
            </c:if>

            <h2 align="center" class="h2">池州智慧营销</h2>
            <br>
            <h3 align="center" class="h3">登记用户信息</h3>
            <form:form action="/customer/add" method="post">

                <div>
                <div class="form-group" align="center">
                    <label for="customerName">用户名称:</label>
                    <input type="text" class="form-group" id="customerName" name="customerName" value="${customer.customerName}">
                </div>

                <div class="form-group" align="center">
                    <label for="mobile">电信号码:</label>
                    <input type="text" class="form-group" id="mobile" name="mobile" value="${customer.mobile}">
                </div>

                <div class="form-group" align="center">
                    <label for="password">其他号码:</label>
                    <input type="text" id="password" name="password" value="${customer.password}">
                </div>

                <div class="form-group" align="center">
                    <label for="idcardNum">身份证号:</label>
                    <input type="text" id="idcardNum" name="idcardNum">
                </div>

                </div>
                <div>
                <div class="form-group" align="center">
                    <label for="bankCard">登记人号码:</label>
                    <input type="text" id="bankCard" name="bankCard">
                </div>
                </div>
                <!--
                <div class="form-group">
                    <label for="effective">有效性:</label>
                    <select id="effective" name="effective">
                        <option value="0" ${customer.effective == 0 ? "selected=selected" : ""}>未验证</option>
                        <option value="1" ${customer.effective == 1 ? "selected=selected" : ""}>验证无效</option>
                        <option value="2" ${customer.effective == 2 ? "selected=selected" : ""}>验证有效</option>
                    </select>
                </div>
                -->

                <div class="form-group" align="center">
                <button type="submit"  align="center" class="btn btn-primary btn-sm">提交资料</button>
                </div>
            </form:form>
        </div>
    </div>

    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
