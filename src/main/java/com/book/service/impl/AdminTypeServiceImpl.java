package com.book.service.impl;

import com.book.dao.AdminTypeDao;
import com.book.pojo.AdminType;
import com.book.service.AdminTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminTypeServiceImpl implements AdminTypeService {
    @Autowired
    private AdminTypeDao adminTypeDao;
    @Override
    public List<String> getAdminType() {
        List<String> tn = adminTypeDao.getAdminType();
        return tn;
    }

    @Override
    public List<AdminType> getTypeList(String typeName) {
        List<AdminType> tl = adminTypeDao.getTypeList(typeName);
        return tl;
    }

    @Override
    public int getCount(String typeName) {
        return adminTypeDao.getCount(typeName);
    }

    @Override
    public int addType(AdminType adminType) {
        return adminTypeDao.addType(adminType);
    }

    @Override
    public int deleteType(Integer adminTypeId) {
        return adminTypeDao.deleteType(adminTypeId);
    }

    @Override
    public AdminType findTypeById(Integer adminTypeId) {
        AdminType adminType = adminTypeDao.findTypeById(adminTypeId);
        return adminType;
    }

    @Override
    public int updateType(AdminType adminType) {
        return adminTypeDao.updateType(adminType);
    }
}
