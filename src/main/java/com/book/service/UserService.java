package com.book.service;

import com.book.pojo.User;

public interface UserService {
    User userLogin(User user);
    User getUserByNum(User user);
    int userRegister(User user);
}
