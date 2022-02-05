package com.book.dao;

import com.book.pojo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
@Mapper
public interface UserInfoDao {
    List<UserInfo> getUserList(@Param("userName")String userName, @Param("userPhone") String userPhone);
    int addUser(UserInfo userInfo);
    int deleteUser(Integer userId);
    UserInfo findUserById(Integer userId);
    int updateUser(UserInfo userInfo);
    int deleteSelectedUser(String ck);
    int getCount(@Param("userName")String userName, @Param("userPhone") String userPhone);
    List<String> getUserName();
    List<Map<Integer,Integer>> getUserAge();
}
