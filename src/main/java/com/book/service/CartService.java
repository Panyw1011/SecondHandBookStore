package com.book.service;

import com.book.pojo.Cart;

import java.util.List;

public interface CartService {
    int addCart(Integer userId,Integer bookId);
    List<Cart> getUserCart(Integer userId);
    int deleteSelectedCart(String ck);
}
