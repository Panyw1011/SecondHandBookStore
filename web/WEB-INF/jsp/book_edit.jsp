<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 001 12-1
  Time: 上午 11:14
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
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="/findBook" title="返回">
        <i class="layui-icon" style="line-height:30px">&#xe65c;</i></a>
    <form class="layui-form" action="/updateBook" method="post"  id="f_auto" accept-charset="UTF-8">
        <input type="hidden" value="${modifyBook.bookId}" name="bookId" id="bookId"/>
        <div class="layui-form-item">
            <label for="s_id" class="layui-form-label">
                <span class="f_sp">书号</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="s_id" name="s_id"
                       autocomplete="off" value="${modifyBook.bookId}" class="layui-input" disabled>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookName" class="layui-form-label">
                <span class="f_sp">书名</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookName" name="bookName"
                       autocomplete="off" value="${modifyBook.bookName}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookLevel" class="layui-form-label">
                <span class="f_sp">成色</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookLevel" name="bookLevel"
                       autocomplete="off" value="${modifyBook.bookLevel}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookPrice" class="layui-form-label">
                <span class="f_sp">价格</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookPrice" name="bookPrice"
                       autocomplete="off" value="${modifyBook.bookPrice}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookSort" class="layui-form-label">
                <span class="f_sp">类别</span>
            </label>
            <div class="layui-input-inline">
                <select class="layui-select" name="bookSort"  id="bookSort" lay-submit lay-filter="cUserName" lay-search>
                    <c:forEach items="${sl}" var="sl">
                        <option value="${sl}">${sl}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookCount" class="layui-form-label">
                <span class="f_sp">数量</span>
            </label>
            <div class="layui-input-inline">
                <input type="number" id="bookCount" name="bookCount"
                       autocomplete="off" value="${modifyBook.bookCount}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookAuthor" class="layui-form-label">
                <span class="f_sp">作者</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookAuthor" name="bookAuthor"
                       autocomplete="off" value="${modifyBook.bookAuthor}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookPublisher" class="layui-form-label">
                <span class="f_sp">出版社</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookPublisher" name="bookPublisher"
                       autocomplete="off" value="${modifyBook.bookPublisher}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="display" class="layui-form-label">
                <span class="f_sp">下架</span>
            </label>
            <div class="layui-input-inline" id="display">
                <input type="radio" name="display" id="s_yes" value="是" title="是" ${yes}>
                <input type="radio" name="display" id="s_no" value="否" title="否" ${no} >
            </div>
        </div>

        <div class="layui-form-item">
            <label for="bookSales" class="layui-form-label">
                <span class="f_sp">销售量</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="bookSales" name="bookSales"
                       autocomplete="off" value="${modifyBook.bookSales}" class="layui-input">
            </div>
        </div>

        <div class="layui-form-item">
            <label for="userName" class="layui-form-label">
                <span class="f_sp">卖家</span>
            </label>
            <div class="layui-input-inline">
                <input type="text" id="userName" name="userName"
                       autocomplete="off" value="${modifyBook.userName}" class="layui-input" disabled>
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
