package com.lzh.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.lzh.dao.DiscussDao;
import com.lzh.dao.Impl.DiscussDaoImpl;
import com.lzh.domain.Discuss;
import com.lzh.mapper.DiscussMapper;
import com.lzh.service.DiscussService;
import com.lzh.util.ConfigUtil;
import com.lzh.util.SessionUtil;

public class DiscussTest {
	SqlSessionFactory sf=SessionUtil.getSF();
	SqlSession session=sf.openSession(true);
	private DiscussMapper dm=session.getMapper(DiscussMapper.class);
	DiscussService ds = (DiscussService) ConfigUtil.getBean(DiscussService.SERVER_NAME);
	@Test
	public void get(){
		DiscussDao dd=new DiscussDaoImpl();
		List<Discuss> list=dd.getByDid(2);
		for(Discuss d:list){
			System.out.println(d.getNid());
		}
	}
	@Test
	public void getDid(){
		List<Discuss> list=dm.getByDid(0);
		for(Discuss d:list){
			System.out.println(d.getNid());
		}
	}
	@Test
	public void getNid(){
		List<Discuss> list=dm.getByNid(2);
		for(Discuss d:list){
			System.out.println(d.getPost_time());
		}
	}
	@Test
	public void insert(){
		Discuss discuss=new Discuss(1,"2016-11-02","nihao",1,1);
		dm.insert(discuss);
	}
	@Test
	public void gett(){
		Long t=dm.getTotal();
		System.out.println(t);
	}
	@Test
	public void insertd(){
		DiscussDao dd=new DiscussDaoImpl();
		Discuss d=new Discuss(1,"2016-11-02","nihao",1,1);
		d.setId(13);
		dd.insert(d);
	}
}
