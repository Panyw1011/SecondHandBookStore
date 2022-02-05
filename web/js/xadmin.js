$(function () {
    //加载弹出层
    layui.use(['form','element'],
    function() {
        layer = layui.layer;
        element = layui.element;
    });

    //触发事件
    var tab = {
        tabAdd: function(title,url,id){
          //新增一个Tab项
          element.tabAdd('xbs_tab', {
              title: title,
              content: '<iframe tab-id="'+id+'" frameborder="0" src="'+url+'" scrolling="yes" class="x-iframe"></iframe>',
              id: id
          })
        }
        ,tabDelete: function(othis){
          //删除指定Tab项
            element.tabDelete('xbs_tab', '44');
          
          
          othis.addClass('layui-btn-disabled');
        }
        ,tabChange: function(id){
          //切换到指定Tab项
          element.tabChange('xbs_tab', id);
        }
    };

    // 展开侧边栏效果
    $('.container .left_open i').click(function(event) {
        if($('.left-nav').css('left')=='0px'){
            $('.left-nav').animate({left: '-221px'}, 100);
            $('.page-content').animate({left: '0px'}, 100);
        }else{
            $('.left-nav').animate({left: '0px'}, 100);
            $('.page-content').animate({left: '221px'}, 100);
        }
    });

    // 关闭标签页
    $('.layui-tab-close').click(function(event) {
        $('.layui-tab-title li').eq(0).find('i').remove();
    });

    //左侧菜单点击效果
    $('.left-nav #nav li').click(function (event) {
        // 若菜单下有子菜单
        if($(this).children('.sub-menu').length){
            if($(this).hasClass('open')){
                $(this).removeClass('open');
                $(this).find('.nav_right').html('&#xe697;');
                $(this).children('.sub-menu').stop().slideUp();
                $(this).siblings().children('.sub-menu').slideUp();
            }else{
                $(this).addClass('open');
                $(this).children('a').find('.nav_right').html('&#xe6a6;');
                $(this).children('.sub-menu').stop().slideDown();
                $(this).siblings().children('.sub-menu').stop().slideUp();
                $(this).siblings().find('.nav_right').html('&#xe697;');
                $(this).siblings().removeClass('open');
            }
        }else{
            // 若菜单下没有子菜单
            var url = $(this).children('a').attr('_href');
            var title = $(this).find('cite').html();
            var index  = $('.left-nav #nav li').index($(this));
            // 遍历是否已经存在
            for (var i = 0; i <$('.x-iframe').length; i++) {
                if($('.x-iframe').eq(i).attr('tab-id')==index+1){
                    tab.tabChange(index+1);
                    // 阻止事件
                    event.stopPropagation();
                    return;
                }
            };
            // 创建标签页
            tab.tabAdd(title,url,index+1);
            tab.tabChange(index+1);
        }
        // 阻止事件
        event.stopPropagation();
    })
})

/*弹出层*/
/*
    参数：
    title   标题
    url     请求的url
    id      需要操作的数据id
    w       弹出层宽度（缺省调默认值）
    h       弹出层高度（缺省调默认值）
*/
function x_admin_show(title,url,w,h){
    if (title == null || title == '') {
        title=false;
    };
    if (url == null || url == '') {
        url="404.html";
    };
    if (w == null || w == '') {
        w=($(window).width()*0.9);
    };
    if (h == null || h == '') {
        h=($(window).height() - 50);
    };
    layer.open({
        type: 2,
        area: [w+'px', h +'px'],
        fix: false,
        maxmin: true,
        shadeClose: true,
        shade:0.4,
        title: title,
        content: url
    });
}

/*关闭弹出框口*/
function x_admin_close(){
    var index = parent.layer.getFrameIndex(window.name);
    parent.layer.close(index);
}


