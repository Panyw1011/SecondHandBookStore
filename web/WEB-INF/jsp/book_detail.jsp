<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 006 12-6
  Time: 下午 7:07
  To change this template use File | Settings | File Templates.
--%>
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
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="/js/storepage.js"></script>
    <link href="/lib/layui/css/layui.css" rel="stylesheet"/>
    <script src="/lib/layui/layui.all.js"></script>
    <title>${clickBook.bookName}</title>
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
                    <input type="hidden" id="currentUserId" value="${sessionScope.currentUser.userId}">
                </c:if>
                <c:if test="${sessionScope.isLogin!=1}">
                    <a style="float: right;" href="/userLogin">登录</a>
                </c:if>
            </li>
        </ul>
    </div>
    <div class="layui-col-xs12" style="">
        <div class="layui-row" style="width: 80%;padding-left: 70px;padding-top: 30px">
            <label class="layui-form-label" style="width: 300px;font-size: 16px;font-weight: 500">
                图书&nbsp;>&nbsp;${clickBook.bookSort}&nbsp;>&nbsp;${clickBook.bookName}
            </label>
        </div>
        <div id="magicalDragScene" class="mc-root mc-ui-absolute-pane">
            <div class="layui-row" style="position: absolute; left: 8%; top: 10%; width: 85%; height: 449px;padding-top: 80px">
                <div class="layui-col-md6" style="width: 40%; height: 262px;">
                    <img src="/images/${clickBookImage.url}" style="width: 400px;height: 400px">
                </div>
                <div class="layui-col-md6" style="width: 60%; height: 293px;">
                    <div class="layui-row" style="height: 240px;">
                        <div class="layui-col-xs12" style="height: 39px;">
                            <input type="hidden" id="bookId" value="${clickBook.bookId}">
                            <p style="font-size: 22px">
                                ${clickBook.bookName}
                            </p>
                        </div>
                        <div class="layui-col-xs12">
                            <p>作者：${clickBook.bookAuthor}</p>&nbsp;
                            <p>出版社：${clickBook.bookPublisher}</p>&nbsp;
                            <p>商家：${clickBook.userName}</p>&nbsp;
                            <p>销量：${clickBook.bookSales}</p>&nbsp;
                            <p>成色：${clickBook.bookLevel}</p>&nbsp;
                        </div>
                        <div class="layui-col-xs12" style="height: 0px;">
                            售价：<p style="color: red;font-size: 30px">￥${clickBook.bookPrice}</p>
                            <button id="addCartBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="addCartBtn"> <i class="layui-icon">&#xe654;</i>加入购物车 </button>
                            <button id="buyBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="buyBtn"> <i class="layui-icon"></i>立即购买 </button>
                        </div>
                    </div>
                </div>
                <div class="layui-col-md6" style="width: 95%; height: 143px;padding-top: 150px">
                    <p style="padding-bottom: 30px;width: 300px;font-size: 16px;font-weight: 500">
                        类似图书
                    </p>
                    <div class="layui-row" style="height: 355px;">
                        <c:forEach items="${bimg}" var="bimg">
                            <div class="layui-col-md6" style="width: 20%; height: 280px;">
                                <a href="/bookDetail?bookId=${bimg.bookId}">
                                    <img src="/images/${bimg.url}">
                                </a>
                                <p>《${bimg.bookName}》</p>
                                <p>${bimg.bookAuthor}</p>
                                <p style="color: red">￥${bimg.bookPrice}</p>
                                <p>销售量：${bimg.bookSales}</p>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['jquery','form','layer'], function(){
        var form = layui.form,
            $ = layui.jquery;
        form.on('submit(addCartBtn)',function (data) {
            var userName = document.getElementById("userName");
            var bookId = document.getElementById("bookId").value;
            var currentUserId = document.getElementById("currentUserId").value;
//            if (userName === null){
//                window.location = "/userLogin";
//            }else {
                $.get("/addCart",{"bookId":bookId,"userId":currentUserId},function (data) {
                    if(data){
                        layer.msg('添加成功!',{icon:1,time:2000});

                    }else {
                        layer.msg('添加失败!',{icon:1,time:2000});
                    }
                });
//            }
        });
        form.on('submit(buyBtn)',function (data) {
            var img = '<img src="/images/zhifu.jpg" width="300px" height="300px">';
            layer.msg(img,{
                time: 0 //不自动关闭
                ,btn: ['已完成支付', '未完成支付']
                ,yes:function(index){
                    $.get("/buySelected",{"ck":${clickBook.bookId}},function (data) {
                        if(data =true){
                            layer.msg('购买成功!',{icon:1,time:2000});
                            setTimeout(function () {window.location.href='/shoppingCart?userId=${sessionScope.currentUser.userId}';},1000);

                        }else {
                            layer.msg('购买失败!',{icon:0,time:2000});
                            setTimeout(function () {window.location.href='/shoppingCart?userId=${sessionScope.currentUser.userId}';},1000);
                        }
                    });
                }
            });
        });
    });

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


