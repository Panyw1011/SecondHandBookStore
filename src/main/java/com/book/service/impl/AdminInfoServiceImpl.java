package com.book.service.impl;

import com.book.dao.AdminInfoDao;
import com.book.dao.AdminTypeDao;
import com.book.pojo.AdminInfo;
import com.book.service.AdminInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminInfoServiceImpl implements AdminInfoService {
    @Autowired
    private AdminInfoDao adminInfoDao;
    @Autowired
    private AdminTypeDao adminTypeDao;

    @Override
    public AdminInfo findAdminInfoById(Integer adminId) {
        AdminInfo adminInfo = adminInfoDao.findAdminInfoById(adminId);
        return adminInfo;
    }

    @Override
    public List<AdminInfo> getAdminList(String adminName, String adminPhone, Integer adminAge, String typeName) {
        List<AdminInfo> al = adminInfoDao.getAdminList(adminName,adminPhone,adminAge,typeName);
        return al;
    }

    @Override
    public int getCount(String adminName, String adminPhone, Integer adminAge, String typeName) {
        return adminInfoDao.getCount(adminName,adminPhone,adminAge,typeName);
    }

    @Override
    public int addAdmin(AdminInfo adminInfo) {
        return adminInfoDao.addAdmin(adminInfo);
    }

    @Override
    public int deleteAdmin(Integer adminId) {
        return adminInfoDao.deleteAdmin(adminId);
    }

    @Override
    public int updateAdmin(AdminInfo adminInfo) {
        return adminInfoDao.updateAdmin(adminInfo);
    }

    @Override
    public int deleteSelectedAdmin(String ck) {
        return adminInfoDao.deleteSelectedAdmin(ck);
    }

    @Override
    public int getCurrentAdminType(Integer adminId) {
        return adminTypeDao.getCurrentAdminType(adminId);
    }
}
