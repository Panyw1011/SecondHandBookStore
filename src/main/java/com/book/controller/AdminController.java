package com.book.controller;

import com.book.pojo.Admin;
import com.book.pojo.AdminInfo;
import com.book.service.*;
import com.book.util.MD5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.*;

@Controller
public class AdminController {

    @Autowired
    private AdminService adminService;
    @Autowired
    private AdminInfoService adminInfoService;
    @Autowired
    private AdminTypeService adminTypeService;
    @Autowired
    private BookSortService bookSortService;
    @Autowired
    private UserInfoService userInfoService;

    @RequestMapping("/login")
    public String login(Admin admin, Model model, HttpSession session){
        admin.setAdminPassword(MD5Util.MD5EncodeUtf8(admin.getAdminPassword()));
        Admin admin1 = adminService.findAdmin(admin);
        if (admin1 != null){
            AdminInfo adminInfo = adminInfoService.findAdminInfoById(admin1.getAdminId());
            session.setAttribute("currentAdmin",admin1);
            session.setAttribute("adminInfo",adminInfo);
            int currentAdminType = adminInfoService.getCurrentAdminType(admin1.getAdminId());
            session.setAttribute("currentAdminType",currentAdminType);
            return "homepage";
        }
        model.addAttribute("msg", "用户名或密码错误，请重新登录！");
        return "login";
    }

    @RequestMapping("/loginOut")
    public String loginOut(HttpSession session) {
        session.invalidate();
        return "login";
    }

    @RequestMapping("/myAdminInfo")
    public String myAdminInfo(){
        return "admin_info";
    }

    @RequestMapping("/getAdminList")
    public String getAdminList(String adminName,String adminPhone,Integer adminAge,String typeName,Model model){
        List<AdminInfo> al = adminInfoService.getAdminList(adminName,adminPhone,adminAge,typeName);
        int aCount = adminInfoService.getCount(adminName,adminPhone,adminAge,typeName);
        model.addAttribute("al",al);
        model.addAttribute("aCount",aCount);
        return "admin_list";
    }

    @RequestMapping("/deleteAdmin")
    @ResponseBody
    public String deleteAdmin(Integer adminId){
        int i = adminInfoService.deleteAdmin(adminId);
        return "admin_list";
    }

    @RequestMapping(value = "/addAdmin", method = RequestMethod.POST)
    @ResponseBody
    public String addAdmin(@RequestBody AdminInfo adminInfo){
        int i = adminInfoService.addAdmin(adminInfo);
        return "admin_list";
    }

    @RequestMapping("/deleteSelectedAdmin")
    @ResponseBody
    public String deleteSelectedAdmin(String ck){
        int i = adminInfoService.deleteSelectedAdmin(ck);
        return "admin_list";
    }

    @RequestMapping("/findAdminById")
    public String findAdminById(Integer adminId, Model model){
        AdminInfo modifyAdmin = adminInfoService.findAdminInfoById(adminId);
        List<String> tn = adminTypeService.getAdminType();
        model.addAttribute("tn",tn);
        model.addAttribute("modifyAdmin",modifyAdmin);
        if ("男".equals(modifyAdmin.getAdminSex())){
            model.addAttribute("male","checked=''");
            model.addAttribute("female","");
        }else {
            model.addAttribute("female","checked=''");
            model.addAttribute("male","");
        }
        return "admin_edit";
    }

    @RequestMapping(value = "/updateAdmin", method = RequestMethod.POST)
    public String updateAdmin(AdminInfo adminInfo){
        int i = adminInfoService.updateAdmin(adminInfo);
        return "redirect:/getAdminList";
    }

    @RequestMapping("/myInfo")
    public String toMyInfo(){
        return "admin_info";
    }

    @RequestMapping("/toStorePage")
    public String toStorePage(){
        return "redirect:/storePage";
    }

    @RequestMapping("/getChartData")
    @ResponseBody
    public Map<String,Object> getChartData(){
        // 设置 种类
        List<String> bookSort = bookSortService.getBookSort();

        //设置销售量
        List<Map<String,Object>> bookSale = bookSortService.getSortSales();
//        {bookSalesSum=71, bookSort=计算机科学},
//        {bookSalesSum=23, bookSort=文学}
        List<Object> newBookSort = new ArrayList<Object>();
        List<Object> newBookSales = new ArrayList<Object>();
        for (int i=0;i<bookSort.size();i++){
            int flag = 0,place=0;
            for (int j=0;j<bookSale.size();j++){
                if (bookSort.get(i).equals((bookSale.get(j)).get("bookSort"))){
//                    种类存在直接从bookSale中记录位置取值放到新队列中
                    place = j;
                    flag = 1;
                }
            }
            if (flag == 0){
//                不存在则设置为0
                newBookSort.add(bookSort.get(i));
                newBookSales.add(0);
            }else {
                newBookSort.add((bookSale.get(place)).get("bookSort"));
                newBookSales.add((bookSale.get(place)).get("bookSalesSum"));
            }
        }
        //封装销售数据
        Map<String,Object> sale_data = new LinkedHashMap<String,Object>();
        sale_data.put("bookSort",newBookSort);
        sale_data.put("bookSale",newBookSales);

        List<Map<Integer,Integer>> am = userInfoService.getUserAge();
//        {count(userAge)=1, userAge=11}
//        {count(userAge)=7, userAge=12}

        List<Map<String,Integer>> al = new ArrayList<Map<String,Integer>>();
//        {
//            "name": "12",
//            "value": "7"
//        },
//        {
//            "name": "23",
//            "value": "5"
//        }
        for (int i=0;i<am.size();i++){
            Map<String,Integer> am2 = new LinkedHashMap<String, Integer>();
            am2.put("name",(am.get(i)).get("userAge"));
            am2.put("value",(am.get(i)).get("count(userAge)"));
            al.add(am2);
        }

        //封装总数据
        Map<String,Object> data = new LinkedHashMap<String,Object>();
        data.put("sale",sale_data);
        data.put("age",al);

        //封装结果
        Map<String,Object> resMap = new LinkedHashMap<String,Object>();
        resMap.put("code",0);
        resMap.put("data",data);

        return resMap;
    }

}
