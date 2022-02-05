package com.book.dao;

import com.book.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDao {
    User userLogin(User user);
    User getUserByNum(User user);
    int userRegister(User user);
}
