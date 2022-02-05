<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 002 12-2
  Time: 下午 5:59
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
    <title>修改信息</title>
</head>
<body>
<div class="x-body">
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/getTypeList" title="返回">
        <i class="layui-icon" style="line-height:30px">&#xe65c;</i></a>
    <form class="layui-form" action="/updateType" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${modifyType.adminTypeId}" name="adminTypeId" id="adminTypeId"/>
        <div class="layui-form-item">
            <label for="s_id" class="layui-form-label">
                <span class="f_sp">ID</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="s_id" name="s_id"
                       autocomplete="off" value="${modifyType.adminTypeId}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="typeName" class="layui-form-label">
                <span class="f_sp">类型</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="typeName" name="typeName"
                       autocomplete="off" value="${modifyType.typeName}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="note" class="layui-form-label">
                <span class="f_sp">备注</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="note" name="note"
                       autocomplete="off" value="${modifyType.note}" class="layui-input">
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
