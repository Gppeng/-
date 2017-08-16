package com.lzh.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.lzh.dao.DiscussDao;
import com.lzh.domain.Discuss;
import com.lzh.domain.Page;
import com.lzh.mapper.DiscussMapper;
import com.lzh.util.SessionUtil;

@Repository(value=DiscussDao.SERVER_NAME)
public class DiscussDaoImpl implements DiscussDao{
	SqlSessionFactory sf=SessionUtil.getSF();
	SqlSession session=null;
	DiscussMapper dm=null;
	@Override
	public int insert(Discuss discuss) {
		session=sf.openSession(true);
		dm=session.getMapper(DiscussMapper.class);
		dm.insert(discuss);
		return dm.insert(discuss);
	}

	@Override
	public List<Discuss> getAll(Page page) {
		session=sf.openSession();
		dm=session.getMapper(DiscussMapper.class);
		page.setPageIndex((page.getPageIndex()-1)*page.getPageNum());
		List<Discuss> list=dm.getAll(page);
		return list;
	}

	@Override
	public List<Discuss> getByNid(int nid) {
		session=sf.openSession();
		dm=session.getMapper(DiscussMapper.class);
		return dm.getByNid(nid);
	}

	@Override
	public List<Discuss> getByDid(int did) {
		session=sf.openSession();
		dm=session.getMapper(DiscussMapper.class);
		return dm.getByDid(did);
	}

	@Override
	public int delete(int id) {
		session=sf.openSession(true);
		dm=session.getMapper(DiscussMapper.class);
		return dm.delete(id);
	}

	@Override
	public Long getTotal() {
		session=sf.openSession();
		dm=session.getMapper(DiscussMapper.class);
		return dm.getTotal();
	}

	@Override
	public void insertDiscuss(Discuss discuss) {
		session=sf.openSession(true);
		dm=session.getMapper(DiscussMapper.class);
		dm.insertDiscuss(discuss);
	}

	@Override
	public Discuss getById(int id) {
		session=sf.openSession();
		dm=session.getMapper(DiscussMapper.class);
		return dm.getById(id);
	}
	
}
