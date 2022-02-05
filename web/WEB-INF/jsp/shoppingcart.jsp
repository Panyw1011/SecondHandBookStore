<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 007 12-7
  Time: 上午 12:13
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
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <script src="/js/storepage.js"></script>
    <link href="/lib/layui/css/layui.css" rel="stylesheet"/>
    <script src="/lib/layui/layui.all.js"></script>
    <title>购物车</title>
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
    <div style="padding-left: 10%;">
        <table class="layui-table" style="width: 80%;">
            <tbody>
            <c:forEach items="${cl}" var="cl">
                <tr>
                    <td class="ck" style="width: 40px"><input type="checkbox" name="ck" value="${cl.cartId}" lay-skin="primary" style="display: inline;width: 30px;height: 30px;"></td>
                    <td>
                        <p>商家：${cl.userName}</p>
                        <img src="/images/${cl.url}">
                        <p>${cl.bookName}</p>
                        <p style="color: red">￥${cl.bookPrice}</p>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div style="float: right;padding-right: 20%">
        <button id="addCartBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="delSelectedCartBtn"> <i class="layui-icon"></i>删除所选 </button>
        <button id="buyBtn" class="layui-btn layui-btn-normal" lay-submit lay-filter="buySelectedBtn"> <i class="layui-icon"></i>立即购买 </button>
    </div>
</div>


<script>
    layui.use(['jquery','form','layer'], function(){
        var form = layui.form,
            $ = layui.jquery;

        form.on('submit(delSelectedCartBtn)',function (data) {
            var ck = [];
            $('.ck input[type=checkbox]:checked').each(function () {
                ck.push($(this).val());
            });

            ck = ck.toString();
            if(ck==''){
                layer.msg('请选择!',{icon:2,time:2000});
            }else {
                layer.confirm('确认要删除吗？',function(index){
                    $.get("/deleteSelectedCart",{"ck":ck},function (data) {
                        if(data =true){
                            layer.msg('删除成功!',{icon:1,time:2000});
                            setTimeout(function () {window.location.href='/shoppingCart?userId=${sessionScope.currentUser.userId}';},1000);

                        }else {
                            layer.msg('删除失败!',{icon:0,time:2000});
                            setTimeout(function () {window.location.href='/shoppingCart?userId=${sessionScope.currentUser.userId}';},1000);
                        }
                    });
                });
            }
        });

        form.on('submit(buySelectedBtn)',function (data) {
            var ck = [];
            $('.ck input[type=checkbox]:checked').each(function () {
                ck.push($(this).val());
            });

            ck = ck.toString();
            if(ck==''){
                layer.msg('请选择!',{icon:2,time:2000});
            }else {
                var img = '<img src="/images/zhifu.jpg" width="300px" height="300px">';
                layer.msg(img,{
                    time: 0 //不自动关闭
                    ,btn: ['已完成支付', '未完成支付']
                    ,yes:function(index){
                        $.get("/buySelected",{"ck":ck},function (data) {
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
            }
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



