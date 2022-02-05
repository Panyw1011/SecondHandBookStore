package com.book.controller;

import com.book.pojo.User;
import com.book.pojo.UserInfo;
import com.book.service.UserInfoService;
import com.book.service.UserService;
import com.book.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;


import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserInfoService userInfoService;
    @Autowired
    UserService userService;

    @RequestMapping("/findUser")
    public String findUser(String userName, String userPhone, Model model) {
        List<UserInfo> ul = userInfoService.getUserList(userName,userPhone);
        int count = userInfoService.getCount(userName,userPhone);
        model.addAttribute("ul",ul);
        model.addAttribute("count",count);
        return "user_list";
    }

    @RequestMapping(value = "/addUser", method = RequestMethod.POST)
    @ResponseBody
    public String addUser(@RequestBody UserInfo userInfo){
        int i = userInfoService.addUser(userInfo);
        return "user_list";
    }

    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(Integer userId){
        int i = userInfoService.deleteUser(userId);
        return "user_list";
    }

    @RequestMapping("/deleteSelectedUser")
    @ResponseBody
    public String deleteSelectedUser(String ck){
        int i = userInfoService.deleteSelectedUser(ck);
        return "user_list";
    }

    @RequestMapping("/findUserById")
    public String findUserById(Integer userId, Model model){
        UserInfo modifyUser = userInfoService.findUserById(userId);
        model.addAttribute("modifyUser",modifyUser);
        if ("男".equals(modifyUser.getUserSex())){
            model.addAttribute("male","checked=''");
            model.addAttribute("female","");
        }else {
            model.addAttribute("female","checked=''");
            model.addAttribute("male","");
        }
        return "user_edit";
    }

    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public String updateUser(UserInfo userInfo){
        int i = userInfoService.updateUser(userInfo);
        return "redirect:/findUser";
    }

    @RequestMapping("/doUserLogin")
    public String doUserLogin(User user, Model model, HttpSession httpSession){
        user.setUserPassword(MD5Util.MD5EncodeUtf8(user.getUserPassword()));
        User user1 = userService.userLogin(user);
        if (user1 != null){
            UserInfo userInfo = userInfoService.findUserById(user1.getUserId());
            httpSession.setAttribute("currentUser",userInfo);
            httpSession.setAttribute("isLogin",1);
            return "redirect:/storePage";
        }
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "userlogin";
    }

    @RequestMapping("/userLoginOut")
    public String userLoginOut(HttpSession session){
        session.invalidate();
        return "/userlogin";
    }

    @RequestMapping("/toUserRegister")
    public String toUserRegister(){
        return "userregister";
    }

    @RequestMapping("/doUserRegister")
    public String userRegister(User user,Model model){
        user.setUserPassword(MD5Util.MD5EncodeUtf8(user.getUserPassword()));
        User user1 = userService.getUserByNum(user);
        if (user1 != null){
            model.addAttribute("msg","用户名已存在");
            return "userregister";
        }else {
            int i = userService.userRegister(user);
            return "userlogin";
        }
    }

}
