package com.lzh.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lzh.dao.AdvertiseDao;
import com.lzh.domain.Advertise;
import com.lzh.domain.Page;
import com.lzh.service.AdvertiseService;

@Service(value=AdvertiseService.SERVER_NAME)
public class AdvertiseServiceImpl implements AdvertiseService{
	@Resource(name=AdvertiseDao.SERVER_NAME)
	private AdvertiseDao ad;

	@Override
	public int insert(Advertise advertise) {
		return ad.insert(advertise);
	}

	@Override
	public int update(Advertise advertise) {
		return ad.update(advertise);
	}

	@Override
	public List<Advertise> getAll(Page page) {
		return ad.getAll(page);
	}

	@Override
	public int delete(int id) {
		return ad.delete(id);
	}

	@Override
	public Advertise getOne(int id) {
		return ad.getOne(id);
	}

	@Override
	public Long getTotal() {
		return ad.getTotal();
	}
}
