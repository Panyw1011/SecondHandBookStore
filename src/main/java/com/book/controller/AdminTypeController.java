package com.book.controller;

import com.book.pojo.AdminType;
import com.book.service.AdminTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class AdminTypeController {
    @Autowired
    private AdminTypeService adminTypeService;

    @RequestMapping("/getTypeList")
    public String getTypeList(String typeName, Model model){
        List<AdminType> atl = adminTypeService.getTypeList(typeName);
        int tCount = adminTypeService.getCount(typeName);
        model.addAttribute("atl",atl);
        model.addAttribute("tCount",tCount);
        return "type_list";
    }

    @RequestMapping(value = "/addType", method = RequestMethod.POST)
    @ResponseBody
    public String addType(@RequestBody AdminType adminType){
        int i = adminTypeService.addType(adminType);
        return "type_list";
    }

    @RequestMapping("/deleteType")
    @ResponseBody
    public String deleteType(Integer adminTypeId){
        int i = adminTypeService.deleteType(adminTypeId);
        return "type_list";
    }

    @RequestMapping("/findTypeById")
    public String findTypeById(Integer adminTypeId, Model model){
        AdminType adminType = adminTypeService.findTypeById(adminTypeId);
        model.addAttribute("modifyType",adminType);
        return "type_edit";
    }

    @RequestMapping(value = "/updateType", method = RequestMethod.POST)
    public String updateType(AdminType adminType){
        int i = adminTypeService.updateType(adminType);
        return "redirect:/getTypeList";
    }
}
