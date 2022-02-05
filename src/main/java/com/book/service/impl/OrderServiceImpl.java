package com.book.service.impl;

import com.book.dao.OrderDao;
import com.book.pojo.Order;
import com.book.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class OrderServiceImpl implements OrderService{
    @Autowired
    private OrderDao orderDao;

    @Override
    public int buySelected(String ck) {
        return orderDao.buySelected(ck);
    }

    @Override
    public List<Order> getOrderById(Integer userId) {
        List<Order> ol = orderDao.getOrderById(userId);
        return ol;
    }

    @Override
    public int addSale(String ck) {
        return orderDao.addSale(ck);
    }
}
