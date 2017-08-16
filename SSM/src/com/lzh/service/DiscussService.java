package com.lzh.service;

import java.util.List;

import com.lzh.domain.Discuss;
import com.lzh.domain.Page;

public interface DiscussService {
	public static final String SERVER_NAME="com.lzh.service.DiscussServiceImpl";
	public int insert(Discuss discuss);
	public List<Discuss> getAll(Page page);
	public List<Discuss> getByNid(int nid);
	public List<Discuss> getByDid(int did);
	public int delete(int id);
	public Long getTotal();
	public void insertDiscuss(Discuss discuss);
	public Discuss getById(int id);
}
