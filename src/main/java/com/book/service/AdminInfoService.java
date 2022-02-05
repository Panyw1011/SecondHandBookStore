package com.book.service;

import com.book.pojo.AdminInfo;

import java.util.List;

public interface AdminInfoService {
    AdminInfo findAdminInfoById(Integer adminId);
    List<AdminInfo> getAdminList(String adminName,String adminPhone,Integer adminAge,String typeName);
    int getCount(String adminName,String adminPhone,Integer adminAge,String typeName);
    int addAdmin(AdminInfo adminInfo);
    int deleteAdmin(Integer adminId);
    int updateAdmin(AdminInfo adminInfo);
    int deleteSelectedAdmin(String ck);
    int getCurrentAdminType(Integer adminId);
}
