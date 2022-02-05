package com.book.service;

import com.book.pojo.AdminType;

import java.util.List;

public interface AdminTypeService {
    List<String> getAdminType();
    List<AdminType> getTypeList(String typeName);
    int getCount(String typeName);
    int addType(AdminType adminType);
    int deleteType(Integer adminTypeId);
    AdminType findTypeById(Integer adminTypeId);
    int updateType(AdminType adminType);
}
