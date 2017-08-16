package com.lzh.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lzh.dao.NewsDao;
import com.lzh.domain.News;
import com.lzh.domain.Page;
import com.lzh.service.NewsService;

@Service(value=NewsService.SERVER_NAME)
public class NewsServiceImpl implements NewsService{

	@Resource(name=NewsDao.SERVER_NAME)
	private NewsDao nd;
	public void insertNews(News news) {
		nd.insertNews(news);
	}

	@Override
	public void deleteNews(int id) {
		nd.deleteNews(id);
	}

	@Override
	public void updateNews(News news) {
		nd.updateNews(news);
	}

	@Override
	public List<News> getNew(int id) {
		return nd.getNew(id);
	}

	@Override
	public List<News> getNews(Page page) {
		return nd.getNews(page);
	}

	@Override
	public List<News> getNewsByType(String type) {
		return nd.getNewsByType(type);
	}

	@Override
	public News getOne(int id) {
		return nd.getOne(id);
	}

	@Override
	public News getMaxByType(String type) {
		return nd.getMaxByType(type);
	}

	@Override
	public List<News> getByRead() {
		return nd.getByRead();
	}

	@Override
	public List<News> getByDateAndRead() {
		return nd.getByDateAndRead();
	}

	@Override
	public List<News> getByWeekAndRead() {
		return nd.getByWeekAndRead();
	}

	@Override
	public List<News> getByMonthAndRead() {
		return nd.getByMonthAndRead();
	}

}
