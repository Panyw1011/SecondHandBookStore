package com.book.service.impl;

import com.book.dao.AdminDao;
import com.book.pojo.Admin;
import com.book.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AdminServiceImpl implements AdminService{

    @Autowired
    private AdminDao adminDao;

    @Override
    public Admin findAdmin(Admin admin) {
        Admin admin1 = adminDao.findAdmin(admin);
        return admin1;
    }
}
