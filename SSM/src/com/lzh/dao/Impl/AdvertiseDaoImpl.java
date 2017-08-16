package com.lzh.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.lzh.dao.AdvertiseDao;
import com.lzh.domain.Advertise;
import com.lzh.domain.Page;
import com.lzh.mapper.AdvertisMapper;
import com.lzh.util.SessionUtil;

@Repository(value=AdvertiseDao.SERVER_NAME)
public class AdvertiseDaoImpl implements AdvertiseDao{
	SqlSessionFactory sf=SessionUtil.getSF();
	SqlSession session=null;
	AdvertisMapper am=null;
	@Override
	public int insert(Advertise advertise) {
		session=sf.openSession(true);
		am=session.getMapper(AdvertisMapper.class);
		return am.insert(advertise);
		
	}
	@Override
	public int update(Advertise advertise) {
		session=sf.openSession(true);
		am=session.getMapper(AdvertisMapper.class);
		return am.update(advertise);
	}
	@Override
	public List<Advertise> getAll(Page page) {
		session=sf.openSession();
		am=session.getMapper(AdvertisMapper.class);
		page.setPageIndex((page.getPageIndex()-1)*page.getPageNum());
		return am.getAll(page);
	}
	@Override
	public int delete(int id) {
		session=sf.openSession();
		am=session.getMapper(AdvertisMapper.class);
		return am.delete(id);
	}
	@Override
	public Advertise getOne(int id) {
		session=sf.openSession();
		am=session.getMapper(AdvertisMapper.class);
		return am.getOne(id);
	}
	@Override
	public Long getTotal() {
		session=sf.openSession();
		am=session.getMapper(AdvertisMapper.class);
		return am.getTotal();
	}
}
