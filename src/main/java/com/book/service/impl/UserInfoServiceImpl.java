package com.book.service.impl;

import com.book.dao.UserInfoDao;
import com.book.pojo.UserInfo;
import com.book.service.UserInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class UserInfoServiceImpl implements UserInfoService{

    @Autowired
    UserInfoDao userInfoDao;

    @Override
    public List<UserInfo> getUserList(String userName, String userPhone) {
        List<UserInfo> ul = userInfoDao.getUserList(userName, userPhone);
        return ul;
    }

    @Override
    public int addUser(UserInfo userInfo) {
        return userInfoDao.addUser(userInfo);
    }

    @Override
    public int deleteUser(Integer userId) {
        return userInfoDao.deleteUser(userId);
    }

    @Override
    public UserInfo findUserById(Integer userId) {
        UserInfo userInfo = userInfoDao.findUserById(userId);
        return userInfo;
    }

    @Override
    public int updateUser(UserInfo userInfo) {
        return userInfoDao.updateUser(userInfo);
    }

    @Override
    public int deleteSelectedUser(String ck) {
        return userInfoDao.deleteSelectedUser(ck);
    }

    @Override
    public int getCount(String userName, String userPhone) {
        return userInfoDao.getCount(userName,userPhone);
    }

    @Override
    public List<String> getUserName() {
        List<String> nl = userInfoDao.getUserName();
        return nl;
    }

    @Override
    public List<Map<Integer, Integer>> getUserAge() {
        List<Map<Integer,Integer>> am = userInfoDao.getUserAge();
        return am;
    }

}
