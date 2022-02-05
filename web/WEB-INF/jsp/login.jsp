<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 025 11-25
  Time: 下午 7:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/adminLogin.css">
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>
    <title>管理员登录</title>
</head>
<body>
<div class="header">
    <img src="/images/hand1.jpg">
</div>
<div class="body">
    <div class="panel">
        <div class="top">
            <p>登录</p>
        </div>
        <div class="middle">
            <span class="erro">${msg}</span>
            <form action="${pageContext.request.contextPath}/login" method="post">
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="adminNum" value=""  class="iputs"/>
                <input type="password" name="adminPassword" value="" class="iputs" />
                <input type="submit" value="登录"/>
            </form>
        </div>
    </div>
</div>

<div class="footer">
    <span>@Copyright © 2021-2022 版权所有 </span>
</div>
</body>
</html>
