
<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 025 11-25
  Time: 下午 10:29
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
    <link rel="stylesheet" href="/css/pg_btn.css">
    <script type="text/javascript" src="./js/jquery-1.3.2.min.js"></script>
    <script type="text/javascript" src="/js/xadmin.js"></script>
    <script src="lib/layui/layui.js"></script>
    <script type="text/javascript" src="/echarts/echarts.min.js"></script>
    <title>后台管理</title>

</head>
<body>
<%--顶部--%>
<div class="container">
    <div class="logo"><a>二手书店管理系统</a></div>
    <div class="left_open">
        <i title="展开左侧栏" class="iconfont">&#xe699;</i>
    </div>
    <ul class="layui-nav right" lay-filter="">
        <li class="layui-nav-item">
            <a href="javascript:;"><img src="/images/avatar1.jpg" class="layui-nav-img">${sessionScope.adminInfo.adminName}</a>
            <!-- 二级菜单 -->
            <dl class="layui-nav-child">
                <dd><a href="/loginOut">退出</a></dd>
            </dl>
        </li>
        <li class="layui-nav-item to-index"><a href="/toStorePage">前台首页</a></li>
    </ul>
</div>
<%--中部--%>
<%--左侧--%>
<div class="left-nav">
    <div id="side-nav">
        <ul id="nav">
            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>个人信息</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/myInfo">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>个人资料</cite>
                        </a>
                    </li >
                </ul>
            </li>
            <c:if test="${sessionScope.currentAdminType>2}">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe6b8;</i>
                        <cite>用户管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="/findUser">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>用户信息</cite>
                            </a>
                        </li >

                    </ul>
                </li>
            </c:if>

            <li>
                <a href="javascript:;">
                    <i class="iconfont">&#xe723;</i>
                    <cite>图书管理</cite>
                    <i class="iconfont nav_right">&#xe697;</i>
                </a>
                <ul class="sub-menu">
                    <li>
                        <a _href="/findBook">
                            <i class="iconfont">&#xe6a7;</i>
                            <cite>图书列表</cite>
                        </a>
                    </li >
                    <c:if test="${sessionScope.currentAdminType>1}">
                        <li>
                            <a _href="/findSort">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>图书类型</cite>
                            </a>
                        </li >
                    </c:if>
                </ul>
            </li>

            <c:if test="${sessionScope.currentAdminType>3}">
                <li>
                    <a href="javascript:;">
                        <i class="iconfont">&#xe726;</i>
                        <cite>管理员管理</cite>
                        <i class="iconfont nav_right">&#xe697;</i>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a _href="/getAdminList">
                                <i class="iconfont">&#xe6a7;</i>
                                <cite>管理员列表</cite>
                            </a>
                        </li >
                        <c:if test="${sessionScope.currentAdminType>4}">
                            <li>
                                <a _href="/getTypeList">
                                    <i class="iconfont">&#xe6a7;</i>
                                    <cite>管理员权限</cite>
                                </a>
                            </li >
                        </c:if>
                    </ul>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<%--右侧--%>
<div class="page-content">
    <div class="layui-tab tab" lay-filter="xbs_tab" lay-allowclose="false">
        <ul class="layui-tab-title">
            <li class="home"><i class="layui-icon">&#xe68e;</i>书店数据</li>
        </ul>
        <div class="layui-tab-content" >
            <div class="layui-tab-item layui-show o_div">
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div id="div_sale_chart" style="height:300px;margin: auto;"></div>
                    </div>
                </div>
                <div class="layui-card">
                    <div class="layui-card-body">
                        <div id="div_compare_chart" style="width: 600px;height:300px;margin: auto;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--底部--%>
<div class="footer">
    <div class="copyright">@Copyright © 2021-2022 版权所有</div>
</div>
<script type="text/javascript">
    layui.use(['jquery','form','layer'],function () {
        var $ = layui.jquery;
        var layer = layui.layer,
            form = layui.form;

        // 初始化 销售量
        var saleChart = echarts.init(document.getElementById('div_sale_chart'));
        // 销售量--显示标题，图例和空的坐标轴
        saleChart.setOption({
            title: {
                text: '各类图书销售量'
            },
            tooltip: {},
            legend: {
                data:['销售量(本)']
            },
            xAxis: {
                data: []
            },
            yAxis: {},
            series: [{
                name: '销售量(本)',
                type: 'bar',
                data: []
            }]
        });

        // 初始化 年龄比较
        var compareChart = echarts.init(document.getElementById('div_compare_chart'));
        // 年龄比较---配置相关信息
        compareChart.setOption({
            title: {
                text: '用户年龄分布图',
            },
            tooltip: {},
            legend: {
                data:['年龄(岁)']
            },
            series: [{
                name: '年龄(岁)',
                type: 'pie',
                itemStyle: {
                    // 阴影的大小
                    shadowBlur: 200,
                    // 阴影水平方向上的偏移
                    shadowOffsetX: 0,
                    // 阴影垂直方向上的偏移
                    shadowOffsetY: 0,
                    // 阴影颜色
                    shadowColor: 'rgba(0, 0, 0, 0)'
                },
                radius: '80%',
                data:[]
            }]
        });

        $.ajax({
            url: '/getChartData',
            type: "post",
            success: function (result) {
                if(result.code==0){
                    //填入 销售数据
                    saleChart.setOption({
                        xAxis: {
                            data: result.data.sale.bookSort
                        },
                        series: [{
                            // 根据名字对应到相应的系列
//                            name: '销售量(本)',
                            data: result.data.sale.bookSale
                        }]
                    });
                    compareChart.setOption({
                        series: [{
//                            name: '年龄(岁)',
                            // 根据名字对应到相应的系列
                            data: result.data.age
                        }]
                    });
                }else{

                }
            },
            error: function () {
                layer.alert("error");
            }
        });
    })
</script>
</body>
</html>
