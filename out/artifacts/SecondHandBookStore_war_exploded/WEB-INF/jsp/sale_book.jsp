<%--
  Created by IntelliJ IDEA.
  User: pan15
  Date: 008 12-8
  Time: 上午 9:02
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
    <xblock>
        <button id="saleBookBtn" class="layui-btn layui-btn-normal"> <i class="layui-icon">&#xe654;</i>添加 </button>
    </xblock>
    <table class="layui-table">
        <thead>
        <tr>
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
            <th>操作</th>
        </thead>
        <tbody>
        <c:forEach items="${bl}" var="book">
            <tr>
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
                <td>
                    <a title="添加图片" href="/addPic?bookId=${book.bookId}&userName=${book.userName}">
                        <i class="layui-icon">&#xe61f;</i>
                    </a>
                    <a title="下架" onclick="book_display(this,'${book.bookId}')" href="javascript:;">
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
                        <input type="text" name="bookId"   class="layui-input" placeholder="请输入书号">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">书名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookName"   class="layui-input" placeholder="请输入书名">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">成色：</label>
                    <div class="layui-input-block">
                        <input type="number" name="bookLevel"   class="layui-input" placeholder="请输入成色">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">价格：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookPrice"   class="layui-input" placeholder="请输入价格">
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
                        <input type="number" name="bookCount"   class="layui-input" placeholder="请输入数量">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">作者：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookAuthor"   class="layui-input" placeholder="请输入作者">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">出版社：</label>
                    <div class="layui-input-block">
                        <input type="text" name="bookPublisher"   class="layui-input" placeholder="请输入出版社">
                    </div>
                </div>

                <input type="hidden" name="display" value="否" >

                <input type="hidden" name="bookSales"  class="layui-input" value="0">

                <div class="layui-form-item">
                    <label class="layui-form-label">卖家：</label>
                    <div class="layui-input-block">
                        <input type="text" name="userName" value="${sessionScope.currentUser.userName}" class="layui-input" disabled>
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
    /*下架*/
    function book_display(obj,bookId){
        layer.confirm('确认要下架吗？',function(index){
            $.get("/displayBook",{"bookId":bookId},function (data) {
                if(data =true){
                    layer.msg('下架成功!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/mySaleBook?userName=${sessionScope.currentUser.userName}';},1000);

                }else {
                    layer.msg('下架失败!',{icon:1,time:2000});
                    setTimeout(function () {window.location.href='/mySaleBook?userName=${sessionScope.currentUser.userName}';},1000);
                }
            });
        });
    }
    layui.use(['jquery','form','layer'], function(){
        var form = layui.form,
            $ = layui.jquery;

        $("#saleBookBtn").click(function () {
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
                        setTimeout(function () {window.location.href='/mySaleBook?userName=${sessionScope.currentUser.userName}';},1000);

                    },
                    error:function(){
                        layer.msg('添加失败',{icon:0,time:2000});
                        setTimeout(function () {window.location.href='/mySaleBook?userName=${sessionScope.currentUser.userName}';},1000);
                    }
                });
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
