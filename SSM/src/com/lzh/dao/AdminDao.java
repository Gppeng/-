package com.lzh.dao;

import java.util.List;

import com.lzh.domain.Admin;
/**
 * 超级管理员管理
 * @author Administrator
 *
 */
public interface AdminDao {
	public static final String SERVER_NAME="com.lzh.dao.AdminDaoImpl";
	//增加
	public void insertAdmin(Admin admin);
	//通过id删除
	public void deleteAdmin(int id);
	//通过id修改
	public void updateAmdin(Admin admin);
	//通过id得到
	public Admin getAdmin(int id);
	//查询全部超管
	public List<Admin> getAdmins();
	//登录验证
	public int login(Admin admin);
	public int regist(String admin_name);
}
