package com.lzh.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lzh.dao.UserDao;
import com.lzh.domain.Page;
import com.lzh.domain.User;
import com.lzh.service.UserService;

@Service(value=UserService.SERVER_NAME)
public class UserServiceImpl implements UserService{
	@Resource(name=UserDao.SERVER_NAME)
	private UserDao ud;
	@Override
	public boolean login(User user) {
		int num =ud.login(user);
		if(num==0){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public User getUser(int id) {
		return ud.getUser(id);
	}

	@Override
	public List<User> findAll(Page page) {
		return ud.findAll(page);
	}

	@Override
	public int update(User user) {
		return ud.update(user);
	}

	@Override
	public int insert(User user) {
		return ud.insert(user);
	}

	@Override
	public int delete(int id) {
		return ud.delete(id);
	}

	@Override
	public long getTotal() {
		return ud.getTotal();
	}

	@Override
	public List<User> getLikeUserName(String userName) {
		return ud.getLike(userName);
	}

	@Override
	public void registUser(User user) {
		ud.regist(user);
	}

	@Override
	public User loginGet(String userName) {
		return ud.loginGet(userName);
	}

	@Override
	public List<User> regist(String userName) {
		return ud.regist(userName);
	}

}
