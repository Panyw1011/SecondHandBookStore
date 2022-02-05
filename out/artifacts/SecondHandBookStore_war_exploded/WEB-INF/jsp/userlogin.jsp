<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 004 12-4
  Time: 下午 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/adminLogin.css">
    <script src="/js/jquery-1.3.2.min.js"></script>
    <script src="js/login.js"></script>
    <title>登录</title>
</head>
<body>
<div class="header">
    <img src="/images/hand1.jpg">
</div>
<div class="body">
    <div class="panel">
        <div class="top">
            <p>用户登录</p>
        </div>
        <div class="middle">
            <span class="erro">${msg}</span>
            <form action="/doUserLogin" method="post">
                <span class="s1"></span>
                <span class="s2"></span>
                <input type="text" name="userNum" value=""  class="iputs"/>
                <input type="password" name="userPassword" value="" class="iputs" />
                <input type="submit" value="登录"/>
            </form>
        </div>
        <span style="float: left;padding-left: 10px"><a href="/toUserRegister" style="text-decoration: none;color: red">没有账号？立即注册</a></span>
        <span style="float: right;padding-right: 10px"><a href="/toAdminLogin" style="text-decoration: none;color: red">管理员登录</a></span>
    </div>
</div>

<div class="footer">
    <span>@Copyright © 2021-2022 版权所有 </span>
</div>
