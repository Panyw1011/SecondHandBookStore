package com.book.dao;

import com.book.pojo.Cart;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface CartDao {
    int addCart(@Param("userId") Integer userId,@Param("bookId") Integer bookId);
    List<Cart> getUserCart(Integer userId);
    int deleteSelectedCart(@Param("ck") String ck);
}
