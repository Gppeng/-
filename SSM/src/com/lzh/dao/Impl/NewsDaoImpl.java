package com.lzh.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.lzh.dao.NewsDao;
import com.lzh.domain.News;
import com.lzh.domain.Page;
import com.lzh.mapper.NewsMapper;
import com.lzh.util.SessionUtil;

@Repository(value=NewsDao.SERVER_NAME)
public class NewsDaoImpl implements NewsDao{
	private SqlSessionFactory sf=SessionUtil.getSF();
	private SqlSession session=sf.openSession(true);;
	private NewsMapper nm=session.getMapper(NewsMapper.class);;
	@Override
	public void insertNews(News news) {
		nm.insertNews(news);
	}

	@Override
	public void deleteNews(int id) {
		nm.deleteNewById(id);
	}

	@Override
	public void updateNews(News news) {
		nm.updateNew(news);
	}

	@Override
	public List<News> getNew(int id) {
		return nm.getNew(id);
	}

	@Override
	public List<News> getNews(Page page) {
		page.setPageIndex((page.getPageIndex()-1)*page.getPageNum());
		List<News> list=nm.getNews(page);
		return list;
	}

	@Override
	public List<News> getNewsByType(String type) {
		List<News> list=nm.getNewsByType(type);
		return list;
	}

	@Override
	public News getOne(int id) {
		return nm.getOne(id);
	}

	@Override
	public News getMaxByType(String type) {
		return nm.getMaxByType(type);
	}

	@Override
	public List<News> getByRead() {
		return nm.getByRead();
	}

	@Override
	public List<News> getByDateAndRead() {
		return nm.getByDateAndRead();
	}

	@Override
	public List<News> getByWeekAndRead() {
		return nm.getByWeekAndRead();
	}

	@Override
	public List<News> getByMonthAndRead() {
		return nm.getByMonthAndRead();
	}
	
}
