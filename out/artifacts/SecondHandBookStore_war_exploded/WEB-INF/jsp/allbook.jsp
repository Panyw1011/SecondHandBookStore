<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 005 12-5
  Time: 下午 9:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="icon" href="/images/favicon.ico">
    <link rel="stylesheet" href="/css/font.css">
    <link rel="stylesheet" href="/css/xadmin.css">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="/js/storepage.js"></script>
    <link href="/lib/layui/css/layui.css" rel="stylesheet"/>
    <script src="/lib/layui/layui.all.js"></script>
    <title>图书分类</title>
</head>
<body class="layui-form">
<div class="layui-row" style="height: 648px;">
    <div class="layui-col-xs12" style="height: 60px; background-color: rgb(0, 0, 0);">
        <ul class="layui-nav layui-bg-black" style="height: 0px;">
            <li class="layui-nav-item"><a href="/storePage">首页</a></li>
            <li class="layui-nav-item"><a href="/myList?userId=${sessionScope.currentUser.userId}">我的</a></li>
            <li class="layui-nav-item"><a href="/shoppingCart?userId=${sessionScope.currentUser.userId}">购物车</a></li>
            <li class="layui-nav-item"><a href="/allBook">所有图书</a></li>
            <li class="layui-nav-item"><a href="javascript:;">联系客服</a></li>
            <li class="layui-nav-item" style="float:right">
                <c:if test="${sessionScope.isLogin==1}">
                    <a style="float: right;" href="/userLoginOut">退出登录</a>
                    <a style="float: right;" href="">${sessionScope.currentUser.userName}</a>
                </c:if>
                <c:if test="${sessionScope.isLogin!=1}">
                    <a style="float: right;" href="/userLogin">登录</a>
                </c:if>
            </li>
        </ul>
    </div>
    <div class="layui-col-xs12" style="padding-top: 20px;width: 1400px;padding-left: 500px">
        <div class="layui-row" style="">
            <form class="layui-form layui-col-md12 x-so" action="/findBookImage">
                <input class="layui-input" placeholder="请输入书名或作者" name="searchBook" id="searchBook" style="width: 40%">
                <button class="layui-btn"  lay-submit="" lay-filter="search"><i class="layui-icon">&#xe615;</i></button>
            </form>
        </div>
    </div>
    <div class="layui-col-xs12" style="padding-top: 20px;width: 1400px;padding-left: 160px">
        <label class="layui-form-label" style="width: 200px;font-family:Lucida Calligraphy, cursive, serif, sans-serif;font-size: 25px;font-weight: 500">图书分类 Sort.</label>
        <div class="layui-row" style="border: 1px solid lightgray;">
            <label class="layui-form-label" style="width: 90px;font-size: 15px;font-weight: 500;"><a href="/allBook">所有图书</a></label>
            <c:forEach items="${bsl}" var="sort">
                <label class="layui-form-label" style="width: 90px;font-size: 15px;font-weight: 500;"><a href="/allBook?bookSortId=${sort.bookSortId}">${sort.bookSort}</a></label>
            </c:forEach>
        </div>
    </div>
    <div class="layui-col-xs12" style="">
        <div class="layui-row" style="width: 80%;padding-left: 200px;padding-top: 30px">
            <c:forEach items="${bil}" var="bil">
                <div class="layui-col-md6" style="width: 20%; height: 280px;">
                    <a href="/bookDetail?bookId=${bil.bookId}">
                        <img src="/images/${bil.url}">
                    </a>
                    <p>《${bil.bookName}》</p>
                    <p>${bil.bookAuthor}</p>
                    <p style="color: red">￥${bil.bookPrice}</p>
                    <p>销售量：${bil.bookSales}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<script>
    var $ = layui.jquery, form = layui.form, slider = layui.slider, element = layui.element, colorpicker = layui.colorpicker, carousel = layui.carousel, table = layui.table, flow = layui.flow;
    var magicalDragLayuiUtil = {
        rebuildLayUiControls: function () {
            var _t = this;
            //外键
            $(".magicalcoder-foreign-select2").each(function (idx, item) {
                var mcDataId = $(item).attr("id");
                if (mcDataId) {
                    $("#" + mcDataId).select2({
                        allowClear: true,
                        width: "150px",
                        delay: 500,
                    });
                }
            })
            //颜色选择器
            $(".magicalcoder-color-picker").each(function (idx, item) {
                colorpicker.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //滑块
            $(".magicalcoder-slider").each(function (idx, item) {
                slider.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //轮播
            $(".layui-carousel").each(function (idx, item) {
                carousel.render(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //流加载
            $(".magicalcoder-flow").each(function (idx, item) {
                flow.load(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //代码
            $(".magicalcoder-code").each(function (idx, item) {
                layui.code(_t.iteratorAttr({
                    elem: $(item)}, item));
            })
            //弹窗
            $(".magicalcoder-layer").each(function (idx, item) {
                //先隐藏起来
                $(this).next().hide();
                $(this).click(function () {
                    var config = _t.iteratorAttr({
                        elem: $(item)}, item);
                    var type = config.type;
                    if (type + '' == 1) {
                        config.content = $(this).next();
                        if (!config.content.hasClass("magicalcoder-layer-content")) {
                            config.content = config.content.find(".magicalcoder-layer-content")
                        }
                    }
                    if (config.btn) {
                        config.btn = config.btn.split(",")
                    }
                    if (config.area) {
                        config.area = config.area.split(",")
                    }
                    layer.open(config)
                })
            })
            //部分组件初始化
            element.init();
        },
        //将标签上的属性 转换成layui函数初始化时的参数名:参数值
        iteratorAttr: function (renderConfig, dom) {
            var attrs = dom.attributes;
            for (var i = 0; i < attrs.length; i++) {
                var attr = attrs[i];
                var name = attr.name;
                var value = attr.value;
                if (name.indexOf("mc-") === 0) {
                    name = name.replace("mc-attr-", '');
                    name = name.replace("mc-event-", '');
                    if (name.indexOf('str-') === 0) {
                        name = name.replace('str-', '');
                    } else if (name.indexOf('bool-') === 0) {
                        name = name.replace('bool-', '');
                        value == 'true' || value === '' ? value = true: value = value;
                        value == 'false' ? value = false: value = value;
                    } else if (name.indexOf('num-') === 0) {
                        name = name.replace('num-', '');
                        if (value !== '' && !isNaN(value)) {
                            value = parseFloat(value);
                        }
                    } else if (name.indexOf('json-') === 0) {
                        name = name.replace('json-', '');
                        if (value !== '') {
                            value = JSON.parse(value);
                        }
                    }
                    renderConfig[this.htmlAttrNameToTuoFeng(name)] = value;
                }
            }
            return renderConfig;
        },
        //user-name -> userName html上的标签名转换成驼峰名称
        htmlAttrNameToTuoFeng: function (name) {
            var arr = name.split("-");
            var newArr = []
            for (var i = 0; i < arr.length; i++) {
                if (i != 0) {
                    if (arr[i] != '') {
                        newArr.push(this.firstCharToUpLower(arr[i]));
                    }
                } else {
                    newArr.push(arr[i]);
                }
            }
            return newArr.join('');
        },
        //首字母大写
        firstCharToUpLower: function (name) {
            var arr = name.split("");
            arr[0] = arr[0].toUpperCase();
            return arr.join('');
        },
    }
    magicalDragLayuiUtil.rebuildLayUiControls();
</script>
</body>
</html>

