<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 026 11-26
  Time: 下午 6:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script src="lib/layui/layui.js"></script>
    <title>用户列表</title>
    <style type="text/css">
        .layui-table{
            text-align: center;
        }
        .layui-table th{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="/findStudent">学生信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findUser" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe9aa;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findUser" >
            <input class="layui-input" placeholder="请输入姓名" name="userName" id="userName">
            <input class="layui-input" placeholder="请输入电话" name="userPhone" id="userPhone">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addUserBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button id="deleteUserBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="deleteCk"> <i class="layui-icon">&#xe640;</i>删除选中用户 </button>
        <span class="x-right" style="line-height:40px">共有数据：${count} 条</span>
    </xblock>

    <%--用户信息表--%>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<th><input type="checkbox" lay-skin="primary" id="checkall" name="type" lay-filter="allChoose" value="checkall"></th>--%>
            <th>选择</th>
            <th>ID</th>
            <th>姓名</th>
            <th>性别</th>
            <th>电话</th>
            <th>年龄</th>
            <th>注册时间</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${ul}" var="user">
            <tr>
                <td class="ck"><input type="checkbox" name="ck" value="${user.userId}" lay-skin="primary" ></td>
                <td>${user.userId}</td>
                <td>${user.userName}</td>
                <td>${user.userSex}</td>
                <td>${user.userPhone}</td>
                <td>${user.userAge}</td>
                <td>${user.userCreateTime}</td>
                <td>
                    <a title="编辑" id= "updateEdit" href="/findUserById?userId=${user.userId}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="user_del(this,'${user.userId}')" href="javascript:;">
                        <i class="layui-icon">&#xe640;</i>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <%--添加模态框--%>
    <div class="layui-row" id="test" style="display: none;">
        <div class="layui-col-md10">
            <form class="layui-form" id="addUserForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="userName"   class="layui-input" placeholder="请输入姓名">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">电话：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="userPhone"  class="layui-input" placeholder="请输入电话">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="userSex" value="男" title="男" checked="">
                        <input type="radio" name="userSex" value="女" title="女">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">年龄：</label>
                    <div class="layui-input-block">
                        <input type="text" name="userAge" class="layui-input" placeholder="请输入年龄">
                    </div>
                </div>

                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button type="button" class="layui-btn layui-btn-normal" lay-submit lay-filter="formDemo">提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    layui.use(['jquery','form','layer'], function(){
        var form = layui.form,
            $ = layui.jquery;
//        添加弹出框
        $("#addUserBtn").click(function () {
            layer.open({
                type:1,
                title:"添加用户",
                area:["50%"],
                anim:5,
                content:$("#test").html()
            });
            $("#addUserForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addUser',
                    type: "post",
                    data:JSON.stringify(param),
                    dataType:"text",
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/findUser';},1000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/findUser';},1000);
                    }
                });
            });
        });

//        获取复选框值
        form.on('submit(deleteCk)',function (data) {
            var ck = [];
            $('.ck input[type=checkbox]:checked').each(function () {
                ck.push($(this).val());
            });
            ck = ck.toString();
            layer.confirm('确认要删除吗？',function(index){
                $.get("/deleteSelectedUser",{"ck":ck},function (data) {
                    if(data =true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findUser';},1000);

                    }else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findUser';},1000);
                    }
                });
            });
        })
    });
//    删除
    function user_del(obj,userId){
        layer.confirm('确认要删除吗？',function(index){
            $.get("/deleteUser",{"userId":userId},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findUser';},1000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findUser';},1000);
                }
            });
        });
    }
</script>
</body>
</html>
