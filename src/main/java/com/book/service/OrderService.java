package com.book.service;

import com.book.pojo.Order;

import java.util.List;

public interface OrderService {
    int buySelected(String ck);
    List<Order> getOrderById(Integer userId);
    int addSale(String ck);
}
