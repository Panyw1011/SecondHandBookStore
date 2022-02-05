<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 008 12-8
  Time: 上午 10:57
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
    <title>添加图片</title>
</head>
<body>
<div class="x-body" style="width: 40%;padding-left: 30%;padding-top: 10%">
    <form action="/addBookPic" method="post" enctype="multipart/form-data">
        <input type="file" name="bookPic">
        <input type="hidden" name="bookId" value="${bookId}">
        <input type="hidden" name="userName" value="${userName}">
        <input type="submit" value="上传">
    </form>
</div>
</body>
</html>
