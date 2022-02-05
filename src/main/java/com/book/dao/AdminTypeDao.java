package com.book.dao;

import com.book.pojo.AdminType;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminTypeDao {
    List<String> getAdminType();
    List<AdminType> getTypeList(@Param("typeName")String typeName);
    int getCount(@Param("typeName")String typeName);
    int addType(AdminType adminType);
    int deleteType(Integer adminTypeId);
    AdminType findTypeById(Integer adminTypeId);
    int updateType(AdminType adminType);
    int getCurrentAdminType(Integer adminId);
}
