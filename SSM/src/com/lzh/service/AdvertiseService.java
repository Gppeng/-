package com.lzh.service;

import java.util.List;

import com.lzh.domain.Advertise;
import com.lzh.domain.Page;

public interface AdvertiseService {
	public static final String SERVER_NAME="com.lzh.service.AdvertiseImpl";
	public int insert(Advertise advertise);
	public int update(Advertise advertise);
	public List<Advertise> getAll(Page page);
	public int delete(int id);
	public Advertise getOne(int id);
	public Long getTotal();
}
