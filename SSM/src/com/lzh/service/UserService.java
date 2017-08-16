package com.lzh.service;

import java.util.List;

import com.lzh.domain.Page;
import com.lzh.domain.User;

public interface UserService {
	public static final String SERVER_NAME="com.lzh.service.UserServiceImpl";
    public User getUser(int id);
    public long getTotal();
    public List<User> findAll(Page page);
    public int update(User user);
    public int insert(User user);
    public int delete(int id);
	public boolean login(User user);
	public User loginGet(String userName);
	public List<User> getLikeUserName(String userName);
	public void registUser(User user);
	public List<User> regist(String userName);
}
