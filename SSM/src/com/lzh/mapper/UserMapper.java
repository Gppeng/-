package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lzh.domain.Page;
import com.lzh.domain.User;

public interface UserMapper {
	//用户登录
	@Select("select count(*) num from user where userName = #{userName} and password = #{password}")
	public int login(User user);
	@Select("select * from user where userName=#{userName}")
	public User loginGet(String userName);
	@Select("select * from user where userName=#{userName}")
	public List<User> regist(String userName);
	//用户查询
	@Select("select * from user where id=#{id}")
	public User getUser(int id);
	@Select("select count(*) num from user where userName=#{userName}")
	public int isExist(String userName);
	@Select("select * from user limit #{pageIndex},#{pageNum}")
	public List<User> findAll(Page page);
	@Select("select * from user where userName like #{userName}")
	public List<User> getLike(String userName);
	//用户数量
	@Select("select count(*) from user where userName is not null")
	public long getTotal();
	//添加用户
	@Insert("insert into user(userName,password,trueName,email,tel,pic) values(#{userName},#{password},#{trueName},#{email},#{tel},#{pic})")
	public int insertUser(User user);
	@Insert("insert into user(userName,password) values(#{userName},#{password})")
	public User registUser(User user);
	@Update("update user set userName=#{userName},password=#{password},trueName=#{trueName},email=#{email},tel=#{tel},pic=#{pic} where id=#{id}")
	public int updateUser(User user);
	@Delete("delete from user where id = #{id}")
	public int deleteUser(int id);
	
}
