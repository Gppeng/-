package com.lzh.test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.lzh.dao.NewsDao;
import com.lzh.dao.Impl.NewsDaoImpl;
import com.lzh.domain.News;
import com.lzh.domain.Page;
import com.lzh.mapper.NewsMapper;
import com.lzh.service.NewsService;
import com.lzh.service.Impl.NewsServiceImpl;
import com.lzh.util.SessionUtil;

public class NewTest {
	SqlSessionFactory sf=SessionUtil.getSF();
	SqlSession session=sf.openSession(true);
	private NewsMapper nm=session.getMapper(NewsMapper.class);
	@Test
	public void get(){
		List<News> news=nm.getNew(1);
		for(News ne: news){
			System.out.println(ne.getAttpic());
		}
	}
	@Test
	public void insert(){
		Date dt=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyy-MM-dd  HH:MM:SSS");
		String date=sdf.format(dt);
		News news=new News("buhao","fff","真的难",date,"哈哈","..img/",2,"caole");
		nm.insertNews(news);
	}
	@Test
	public void delete(){
		nm.deleteNewById(2);
	}
	@Test
	public void update(){
		Date dt=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyy-MM-dd  hh:mm:ss");
		String date=sdf.format(dt);
		News news=new News(2,"李朝晖的时间太好","fule","真的难",date,"哈哈","..img/",2,"caole");
		nm.updateNew(news);
	}
	@Test
	public void all(){
		List<News> list=nm.getall();
		for(News news:list){
			System.out.println(news.getPost_time());
		}
	}
	@Test
	public void getNewDao(){
		NewsService ns=new NewsServiceImpl();
		Page page=new Page(0,4);
		List<News> list=ns.getNews(page);
		for(News news:list){
			System.out.println(news.getPost_time());
		}
	}
	@Test
	public void getNewDaos(){
		NewsDao ns=new NewsDaoImpl();
		Page page=new Page(1,2);
		List<News> list=ns.getNews(page);
		for(News news:list){
			System.out.println(news.getPost_time());
		}
	}
	@Test
	public void getByType(){
		NewsDao nd=new NewsDaoImpl();
		List<News> list=nd.getNewsByType("人物");
		for(News news:list){
		System.out.println(news.getContent());
		}
	}
}
