package com.lzh.service;

import java.util.List;

import com.lzh.domain.Admin;

public interface AdminService {
	public static final String SERVCER_NAME="com.lzh.service.impl.AdminServiceImpl";
	public void insertAdmin(Admin admin);
	public void deleteAdmin(int id);
	public void updateAdmin(Admin admin);
	public Admin getAdmin(int id);
	public List<Admin> getAdmins();
	public boolean login(Admin admin);
	public int regist(String admin_name);
}
