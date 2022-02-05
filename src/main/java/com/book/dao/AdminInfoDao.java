package com.book.dao;

import com.book.pojo.AdminInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface AdminInfoDao {
    AdminInfo findAdminInfoById(Integer adminId);
    List<AdminInfo> getAdminList(@Param("adminName") String adminName, @Param("adminPhone")String adminPhone,
                                 @Param("adminAge")Integer adminAge, @Param("typeName")String typeName);
    int getCount(@Param("adminName") String adminName, @Param("adminPhone")String adminPhone,
                 @Param("adminAge")Integer adminAge, @Param("typeName")String typeName);
    int addAdmin(AdminInfo adminInfo);
    int deleteAdmin(Integer adminId);
    int updateAdmin(AdminInfo adminInfo);
    int deleteSelectedAdmin(String ck);
}
