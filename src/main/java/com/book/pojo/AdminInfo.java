package com.book.pojo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class AdminInfo {
    private Integer adminId;
    private String adminName;
    private String adminPhone;
    private Date adminCreateTime;
    private String adminSex;
    private Integer adminAge;
    private String adminAvatar;
    private String typeName;

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminPhone() {
        return adminPhone;
    }

    public void setAdminPhone(String adminPhone) {
        this.adminPhone = adminPhone;
    }

    public Date getAdminCreateTime() throws ParseException {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String strDate = sdf.format(adminCreateTime);
        Date newDate = sdf.parse(strDate);
        java.sql.Date resultDate = new java.sql.Date(newDate.getTime());
        return resultDate;
    }

    public void setAdminCreateTime(Date adminCreateTime) {
        this.adminCreateTime = adminCreateTime;
    }

    public String getAdminSex() {
        return adminSex;
    }

    public void setAdminSex(String adminSex) {
        this.adminSex = adminSex;
    }

    public Integer getAdminAge() {
        return adminAge;
    }

    public void setAdminAge(Integer adminAge) {
        this.adminAge = adminAge;
    }

    public String getAdminAvatar() {
        return adminAvatar;
    }

    public void setAdminAvatar(String adminAvatar) {
        this.adminAvatar = adminAvatar;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }
}
