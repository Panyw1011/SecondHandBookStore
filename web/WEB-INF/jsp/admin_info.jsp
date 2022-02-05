<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 002 12-2
  Time: 下午 9:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script src="lib/layui/layui.js"></script>
    <title>个人资料</title>
</head>
<body>
<div class="x-body">
    <form class="layui-form" action="/updateAdmin2" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${sessionScope.adminInfo.adminId}" name="adminId" id="adminId"/>
        <div class="layui-form-item">
            <label for="adminId2" class="layui-form-label">
                <span class="f_sp">ID</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="adminId2" name="adminId2"
                       autocomplete="off" value="${sessionScope.adminInfo.adminId}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="adminName" class="layui-form-label">
                <span class="f_sp">姓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="adminName" name="adminName"
                       autocomplete="off" value="${sessionScope.adminInfo.adminName}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="adminPhone" class="layui-form-label">
                <span class="f_sp">电话</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="adminPhone" name="adminPhone"
                       autocomplete="off" value="${sessionScope.adminInfo.adminPhone}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="adminSex" class="layui-form-label">
                <span class="f_sp">性别</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="adminSex" name="adminSex"
                       autocomplete="off" value="${sessionScope.adminInfo.adminSex}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="adminAge" class="layui-form-label">
                <span class="f_sp">年龄</span>
            </label>
            <div class="layui-input-inline">
                <input type="number" id="adminAge" name="adminAge"
                       autocomplete="off" value="${sessionScope.adminInfo.adminAge}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="adminCreateTime" class="layui-form-label">
                <span class="f_sp">注册时间</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="adminCreateTime" name="adminCreateTime"
                       autocomplete="off" value="${sessionScope.adminInfo.adminCreateTime}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="typeName" class="layui-form-label">
                <span class="f_sp">类型</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="typeName" name="typeName"
                       autocomplete="off" value="${sessionScope.adminInfo.typeName}" class="layui-input" disabled>
            </div>
        </div>
    </form>
</div>
</body>
</html>
