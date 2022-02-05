package com.book.service.impl;

import com.book.dao.CartDao;
import com.book.pojo.Cart;
import com.book.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class CartServiceImpl implements CartService{
    @Autowired
    private CartDao cartDao;

    @Override
    public int addCart(Integer userId,Integer bookId) {
        int i = cartDao.addCart(userId,bookId);
        return i;
    }

    @Override
    public List<Cart> getUserCart(Integer userId) {
        List<Cart> cl = cartDao.getUserCart(userId);
        return cl;
    }

    @Override
    public int deleteSelectedCart(String ck) {
        return cartDao.deleteSelectedCart(ck);
    }

}
