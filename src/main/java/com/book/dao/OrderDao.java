package com.book.dao;

import com.book.pojo.Order;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface OrderDao {
    int buySelected(@Param("ck") String ck);
    List<Order> getOrderById(Integer userId);
    int addSale(String ck);
}
