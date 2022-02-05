package com.book.dao;

import com.book.pojo.Admin;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface AdminDao {
    Admin findAdmin(Admin admin);
}
