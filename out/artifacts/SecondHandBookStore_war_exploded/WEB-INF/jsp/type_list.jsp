<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 002 12-2
  Time: 下午 5:59
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
    <title>管理员权限</title>
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
        <a href="/getTypeList">管理员权限</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/getTypeList" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe9aa;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/getTypeList" >
            <input class="layui-input" placeholder="请输入权限" name="typeName" id="typeName">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addTypeBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <span class="x-right" style="line-height:40px">共有数据：${tCount} 条</span>
    </xblock>

    <%--类型信息表--%>
    <table class="layui-table">
    <thead>
    <tr>
        <th>ID</th>
        <th>类型</th>
        <th>备注</th>
        <th>操作</th>
    </thead>
    <tbody>
    <c:forEach items="${atl}" var="type">
        <tr>
            <td>${type.adminTypeId}</td>
            <td>${type.typeName}</td>
            <td>${type.note}</td>
            <td>
                <a title="编辑" id= "updateEdit" href="/findTypeById?adminTypeId=${type.adminTypeId}">
                    <i class="layui-icon">&#xe642;</i>
                </a>
                <a title="删除" onclick="type_del(this,'${type.adminTypeId}')" href="javascript:;">
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
            <form class="layui-form" id="addTypeForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">类型：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="typeName"   class="layui-input" placeholder="请输入类型">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">备注：</label>
                    <div class="layui-input-block">
                        <input type="text" name="note"  class="layui-input" placeholder="请输入备注">
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
        /*添加弹出框*/
        $("#addTypeBtn").click(function () {
            layer.open({
                type:1,
                title:"添加权限",
                area:["50%"],
                anim:5,
                content:$("#test").html()
            });
            $("#addTypeForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addType',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/getTypeList';},1000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/getTypeList';},1000);
                    }
                });
            });
        });
    });

    /*删除*/
    function type_del(obj,adminTypeId){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("/deleteType",{"adminTypeId":adminTypeId},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/getTypeList';},1000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/getTypeList';},1000);
                }
            });
        });
    }

</script>
</body>
</html>