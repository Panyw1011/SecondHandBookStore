package com.book.service.impl;

import com.book.dao.UserDao;
import com.book.pojo.User;
import com.book.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public User userLogin(User user) {
        User user1 = userDao.userLogin(user);
        return user1;
    }

    @Override
    public User getUserByNum(User user) {
        User user1 = userDao.getUserByNum(user);
        return user1;
    }

    @Override
    public int userRegister(User user) {
        return userDao.userRegister(user);
    }
}
