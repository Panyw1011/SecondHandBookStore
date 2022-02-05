package com.book.service;

import com.book.pojo.UserInfo;

import java.util.List;
import java.util.Map;

public interface UserInfoService {
    List<UserInfo> getUserList(String userName, String userPhone);
    int addUser(UserInfo userInfo);
    int deleteUser(Integer userId);
    UserInfo findUserById(Integer userId);
    int updateUser(UserInfo userInfo);
    int deleteSelectedUser(String ck);
    int getCount(String userName, String userPhone);
    List<String> getUserName();
    List<Map<Integer,Integer>> getUserAge();
}
