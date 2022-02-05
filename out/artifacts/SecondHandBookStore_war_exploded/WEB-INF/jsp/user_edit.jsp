<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 029 11-29
  Time: 上午 10:23
  To change this template use File | Settings | File Templates.
--%>
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
    <title>修改信息</title>
</head>
<body>
<div class="x-body">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findUser" title="返回">
        <i class="layui-icon" style="line-height:30px">&#xe65c;</i></a>
    <form class="layui-form" action="/updateUser" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${modifyUser.userId}" name="userId" id="userId"/>
        <div class="layui-form-item">
            <label for="s_id" class="layui-form-label">
                <span class="f_sp">ID</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="s_id" name="s_id"
                       autocomplete="off" value="${modifyUser.userId}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="userName" class="layui-form-label">
                <span class="f_sp">姓名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="userName" name="userName"
                       autocomplete="off" value="${modifyUser.userName}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="userSex" class="layui-form-label">
                <span class="f_sp">性别</span>
            </label>
            <div class="layui-input-inline" id="userSex">
                <input type="radio" name="userSex" id="s_male" value="男" title="男" ${male}>
                <input type="radio" name="userSex" id="s_female" value="女" title="女" ${female} >
            </div>
        </div>

        <div class="layui-form-item">
            <label for="userPhone" class="layui-form-label">
                <span class="f_sp">电话</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="userPhone" name="userPhone"
                       autocomplete="off" value="${modifyUser.userPhone}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="userAge" class="layui-form-label">
                <span class="f_sp">年龄</span>
            </label>
            <div class="layui-input-inline">
                <input type="number" id="userAge" name="userAge"
                       autocomplete="off" value="${modifyUser.userAge}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="userCreateTime" class="layui-form-label">
                <span class="f_sp">注册时间</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="userCreateTime" name="userCreateTime"
                       autocomplete="off" value="${modifyUser.userCreateTime}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item" id="btn_xg">
            <button  class="layui-btn"  id="btn_on" lay-filter="updateForm" lay-submit="">
                修改
            </button>
        </div>
    </form>
</div>
</body>
</html>
