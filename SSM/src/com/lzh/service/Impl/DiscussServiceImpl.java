package com.lzh.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lzh.dao.DiscussDao;
import com.lzh.domain.Discuss;
import com.lzh.domain.Page;
import com.lzh.service.DiscussService;

@Service(value=DiscussService.SERVER_NAME)
public class DiscussServiceImpl implements DiscussService{
	@Resource(name=DiscussDao.SERVER_NAME)
	private DiscussDao dd;
	public int insert(Discuss discuss) {
		return dd.insert(discuss);
	}

	@Override
	public List<Discuss> getAll(Page page) {
		return dd.getAll(page);
	}

	@Override
	public List<Discuss> getByNid(int nid) {
		return dd.getByNid(nid);
	}

	@Override
	public List<Discuss> getByDid(int did) {
		return dd.getByDid(did);
	}

	@Override
	public int delete(int id) {
		return dd.delete(id);
	}

	@Override
	public Long getTotal() {
		return dd.getTotal();
	}

	@Override
	public void insertDiscuss(Discuss discuss) {
		dd.insertDiscuss(discuss);
	}

	@Override
	public Discuss getById(int id) {
		return dd.getById(id);
	}

}
