package com.lzh.dao;

import java.util.List;

import com.lzh.domain.Page;
import com.lzh.domain.User;

public interface UserDao {
	public static final String SERVER_NAME="com.lzh.dao.UserDaoImp";
    public User getUser(int id);
    public long getTotal();
    public List<User> findAll(Page page);
    public int update(User user);
    public int insert(User user);
    public int delete(int id);
	public int login(User user);
	public User loginGet(String userName);
	public List<User> getLike(String userName);
	public void regist(User user);
	public List<User> regist(String userName);
}
