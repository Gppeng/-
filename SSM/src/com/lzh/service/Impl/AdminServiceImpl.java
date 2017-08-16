package com.lzh.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lzh.dao.AdminDao;
import com.lzh.domain.Admin;
import com.lzh.service.AdminService;
/**
 * admin业务处理
 * @author Administrator
 *
 */
@Service(value=AdminService.SERVCER_NAME)
public class AdminServiceImpl implements AdminService{
	@Resource(name=AdminDao.SERVER_NAME)
	private AdminDao adminDao;
	public void insertAdmin(Admin admin) {
		adminDao.insertAdmin(admin);
	}

	@Override
	public void deleteAdmin(int id) {
		adminDao.deleteAdmin(id);
	}

	@Override
	public void updateAdmin(Admin admin) {
		adminDao.updateAmdin(admin);
	}

	@Override
	public Admin getAdmin(int id) {
		return adminDao.getAdmin(id);
	}

	@Override
	public List<Admin> getAdmins() {
		return adminDao.getAdmins();
	}

	@Override
	public boolean login(Admin admin) {
		int count=adminDao.login(admin);
		if(count==1){
			return true;
		}else{
			return false;
		}
	}

	@Override
	public int regist(String admin_name) {
		return adminDao.regist(admin_name);
	}
	
}
