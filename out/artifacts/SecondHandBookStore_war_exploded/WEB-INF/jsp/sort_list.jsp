<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 002 12-2
  Time: 下午 4:24
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
    <title>图书类型</title>
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
        <a href="/findSort">图书类型</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findSort" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe9aa;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findSort" >
            <input class="layui-input" placeholder="请输入类型" name="bookSort" id="bookSort">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addSortBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button id="deleteSortBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="deleteCk"> <i class="layui-icon">&#xe640;</i>删除选中类型 </button>
        <span class="x-right" style="line-height:40px">共有数据：${sCount} 条</span>
    </xblock>

    <%--类型信息表--%>
    <table class="layui-table">
        <thead>
        <tr>
            <th>选择</th>
            <th>ID</th>
            <th>类型</th>
            <th>备注</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${bsl}" var="sort">
            <tr>
                <td class="ck"><input type="checkbox" name="ck" value="${sort.bookSortId}" lay-skin="primary" ></td>
                <td>${sort.bookSortId}</td>
                <td>${sort.bookSort}</td>
                <td>${sort.note}</td>
                <td>
                    <a title="编辑" id= "updateEdit" href="/findSortById?bookSortId=${sort.bookSortId}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="sort_del(this,'${sort.bookSortId}')" href="javascript:;">
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
            <form class="layui-form" id="addSortForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">类型：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookSort"   class="layui-input" placeholder="请输入类型">
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
        $("#addSortBtn").click(function () {
            layer.open({
                type:1,
                title:"添加类型",
                area:["50%"],
                anim:5,
                content:$("#test").html()
            });
            $("#addSortForm")[0].reset();
            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addSort',
                    type: "post",
                    data:JSON.stringify(param),
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/findSort';},1000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/findSort';},1000);
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
                //发异步删除数据
                $.get("/deleteSelectedSort",{"ck":ck},function (data) {
                    if(data =true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findSort';},1000);

                    }else {
                        layer.msg('删除失败!',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/findSort';},1000);
                    }
                });
            });
        })
    });
    /*删除*/
    function sort_del(obj,bookSortId){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("/deleteSort",{"bookSortId":bookSortId},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findSort';},1000);

                }else {
                    layer.msg('删除失败!',{icon:0,time:2000});
                    setTimeout(function () {window.location.href='/findSort';},1000);
                }
            });
        });
    }
</script>
</body>
</html>
