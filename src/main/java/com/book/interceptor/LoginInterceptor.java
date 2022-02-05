package com.book.interceptor;

import com.book.pojo.Admin;
import com.book.pojo.UserInfo;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
        // 获取请求的URL
        String url = request.getRequestURI();
        // URL:除了login.jsp是可以公开访问的，其它的URL都进行拦截控制
        if(url.indexOf("/login")>=0 || url.indexOf("/storePage")>=0 ||  url.indexOf("/allBook")>=0 || url.indexOf("/bookDetail")>=0
                || url.indexOf("/toAdminLogin")>=0 || url.indexOf("/toUserRegister")>=0 || url.indexOf("/userLogin")>=0 || url.indexOf("/doUserLogin")>=0
                || url.indexOf("doUserRegister")>=0){
            return true;
        }
        // 获取Session
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("currentAdmin");
        UserInfo userInfo = (UserInfo)session.getAttribute("currentUser");
        // 判断Session中是否有用户数据，如果有，则返回true,继续向下执行
        if((admin != null) || userInfo != null){
            return true;
        }
        // 不符合条件的给出提示信息，并转发到主页面
        request.setAttribute("msg", "您还没有登录，请先登录！");
        request.getRequestDispatcher("/WEB-INF/jsp/userlogin.jsp")
                .forward(request, response);
        return false;
    }
}
