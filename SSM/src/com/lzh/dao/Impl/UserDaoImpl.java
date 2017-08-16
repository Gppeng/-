package com.lzh.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.lzh.dao.UserDao;
import com.lzh.domain.Page;
import com.lzh.domain.User;
import com.lzh.mapper.UserMapper;
import com.lzh.util.SessionUtil;

@Repository(value=UserDao.SERVER_NAME)
public class UserDaoImpl implements UserDao{
	private SqlSessionFactory sf=SessionUtil.getSF();
	private SqlSession session=null;
	private UserMapper um=null;
	@Override
	public int login(User user) {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		return um.login(user);
	}

	@Override
	public User getUser(int id) {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		User user=um.getUser(id);
		return user;
	}

	@Override
	public List<User> findAll(Page page) {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		page.setPageIndex((page.getPageIndex()-1)*page.getPageNum());
		List<User> list=um.findAll(page);
		return list;
	}

	@Override
	public int update(User user) {
		session=sf.openSession(true);
		um=session.getMapper(UserMapper.class);
		return um.updateUser(user);
	}

	@Override
	public int insert(User user) {
		session=sf.openSession(true);
		um=session.getMapper(UserMapper.class);
		return um.insertUser(user);
	}

	@Override
	public int delete(int id) {
		session=sf.openSession(true);
		um=session.getMapper(UserMapper.class);
		return um.deleteUser(id);
	}

	@Override
	public long getTotal() {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		return um.getTotal();
	}

	@Override
	public List<User> getLike(String userName) {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		return um.getLike(userName);
	}

	@Override
	public void regist(User user) {
		session=sf.openSession(true);
		um=session.getMapper(UserMapper.class);
		um.insertUser(user);
	}

	@Override
	public User loginGet(String userName) {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		return um.loginGet(userName);
	}

	@Override
	public List<User> regist(String userName) {
		session=sf.openSession();
		um=session.getMapper(UserMapper.class);
		return um.regist(userName);
	}

}
