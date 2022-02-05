<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 029 11-29
  Time: 下午 9:51
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
    <title>图书列表</title>
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
        <a href="/findStudent">图书信息</a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findBook" title="刷新">
        <i class="layui-icon" style="line-height:30px">&#xe9aa;</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so" action="/findBook" >
            <input class="layui-input" placeholder="请输入书号" name="bookId" id="bookId">
            <input class="layui-input" placeholder="请输入书名" name="bookName" id="bookName">
            <input class="layui-input" placeholder="请输入类别" name="bookSort" id="bookSort">
            <input class="layui-input" placeholder="请输入作者" name="bookAuthor" id="bookAuthor">
            <input class="layui-input" placeholder="请输入出版社" name="bookPublisher" id="bookPublisher">
            <input class="layui-input" placeholder="请输入用户" name="userName" id="userName">
            <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button id="addBookBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
        <button id="deleteBookBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="deleteCk"> <i class="layui-icon">&#xe640;</i>删除选中图书 </button>
        <span class="x-right" style="line-height:40px">共有数据：${bCount} 条</span>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
            <%--<th><input type="checkbox" lay-skin="primary" id="checkall" name="type" lay-filter="allChoose" value="checkall"></th>--%>
            <th>选择</th>
            <th>书号</th>
            <th>书名</th>
            <th>成色</th>
            <th>价格</th>
            <th>类别</th>
            <th>数量</th>
            <th>作者</th>
            <th>出版社</th>
            <th>下架</th>
            <th>销售量</th>
            <th>卖家</th>
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${bl}" var="book">
            <tr>
                <td class="ck"><input type="checkbox" name="ck" value="${book.bookId}" lay-skin="primary" ></td>
                <td>${book.bookId}</td>
                <td>${book.bookName}</td>
                <td>${book.bookLevel}</td>
                <td>${book.bookPrice}</td>
                <td>${book.bookSort}</td>
                <td>${book.bookCount}</td>
                <td>${book.bookAuthor}</td>
                <td>${book.bookPublisher}</td>
                <td>${book.display}</td>
                <td>${book.bookSales}</td>
                <td>${book.userName}</td>
                <td>
                    <a title="编辑" id= "updateEdit" href="/findBookById?bookId=${book.bookId}">
                        <i class="layui-icon">&#xe642;</i>
                    </a>
                    <a title="删除" onclick="book_del(this,'${book.bookId}')" href="javascript:;">
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
            <form class="layui-form" id="addBookForm">
                <div class="layui-form-item">
                    <label class="layui-form-label">书号：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookId"   class="layui-input" placeholder="请输入书号">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">书名：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookName"   class="layui-input" placeholder="请输入书名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">成色：</label>
                    <div class="layui-input-block">
                        <input type="number" lay-verify="required" name="bookLevel"   class="layui-input" placeholder="请输入成色">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">价格：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookPrice"   class="layui-input" placeholder="请输入价格">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">类别：</label>
                    <div class="layui-input-block">
                        <select class="layui-select" name="bookSort" lay-submit lay-filter="cUserName" lay-search >
                            <c:forEach items="${sl}" var="sl">
                                <option value="${sl}">${sl}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">数量：</label>
                    <div class="layui-input-block">
                        <input type="number" lay-verify="required" name="bookCount"   class="layui-input" placeholder="请输入数量">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">作者：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookAuthor"   class="layui-input" placeholder="请输入作者">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">出版社：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookPublisher"   class="layui-input" placeholder="请输入出版社">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">下架</label>
                    <div class="layui-input-block">
                        <input type="radio" name="display" value="是" title="是">
                        <input type="radio" name="display" value="否" title="否" checked="">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">销售量：</label>
                    <div class="layui-input-block">
                        <input type="text" lay-verify="required" name="bookSales"  class="layui-input" placeholder="请输入销售量">
                    </div>
                </div>

                <div class="layui-form-item">
                    <label class="layui-form-label">卖家：</label>
                    <div class="layui-input-block">
                        <select class="layui-select" name="userName" lay-submit lay-filter="cUserName" lay-search>
                            <c:forEach items="${nl}" var="nl">
                                <option value="${nl}">${nl}</option>
                            </c:forEach>
                        </select>
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
        $("#addBookBtn").click(function () {
            layer.open({
                type:1,
                title:"添加图书",
                area:["50%"],
                anim:5,
                content:$("#test").html()
            });
            $("#addBookForm")[0].reset();

            form.on('submit(formDemo)', function(data) {
                var param=data.field;
                $.ajax({
                    url: '/addBook',
                    type: "post",
                    data:JSON.stringify(param),
                    dataType:"text",
                    contentType: "application/json; charset=utf-8",
                    success:function(){
                        layer.msg('添加成功', {icon: 1, time: 2000});
                        setTimeout(function () {window.location.href='/findBook';},1000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/findBook';},1000);
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
                $.get("/deleteSelectedBook",{"ck":ck},function (data) {
                    if(data =true){
                        layer.msg('删除成功!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findBook';},1000);

                    }else {
                        layer.msg('删除失败!',{icon:1,time:2000});
                        setTimeout(function () {window.location.href='/findBook';},1000);
                    }
                });
            });
        })
    });
    /*删除*/
    function book_del(obj,bookId){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $.get("/deleteBook",{"bookId":bookId},function (data) {
                if(data =true){
                    layer.msg('删除成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findBook';},1000);

                }else {
                    layer.msg('删除失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/findBook';},1000);
                }
            });
        });
    }
</script>
</body>
</html>

