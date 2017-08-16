package com.lzh.test;

import java.util.List;

import org.junit.Test;

import com.lzh.dao.UserDao;
import com.lzh.dao.Impl.UserDaoImpl;
import com.lzh.domain.Page;
import com.lzh.domain.User;

public class UserTest {
	@Test
	public void getAll(){
		UserDao ud=new UserDaoImpl();
		Page page = new Page(1,4);
		List<User> list=ud.findAll(page);
		for(User user:list){
			System.out.println(user.getEmail());
		}
	}
	@Test
	public void getAl(){
		UserDao ud=new UserDaoImpl();
	List<User> list=ud.regist("小叶子");
		for(User user:list){
			System.out.println(user.getUserName());
		}
	}
	@Test
	public void update(){
		UserDao ud=new UserDaoImpl();
		User user=new User("buhao","我很好","不谢","dss","dsds","dssd");
		user.setId(1);
		ud.update(user);
	}
	
	@Test
	public void insert01(){
		UserDao ud=new UserDaoImpl();
		User user=new User("buhao","我很好");
		ud.regist(user);
		System.out.println(user.getEmail());
	}
	@Test
	public void insert(){
		UserDao ud=new UserDaoImpl();
		User user=new User("buhao","我很好","不谢","dss","dsds","dssd");
		ud.insert(user);
	}
	@Test
	public void gett(){
		UserDao ud=new UserDaoImpl();
		Long a=ud.getTotal();
		System.out.println(a);
	}
	@Test
	public void delet(){
		UserDao ud=new UserDaoImpl();
		ud.delete(4);
		System.out.println("dd");
	}
}
