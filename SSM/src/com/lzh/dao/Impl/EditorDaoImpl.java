package com.lzh.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.lzh.dao.EditorDao;
import com.lzh.domain.Editor;
import com.lzh.domain.Page;
import com.lzh.mapper.EditorMapper;
import com.lzh.util.SessionUtil;

@Repository(value=EditorDao.SERVER_NAME)
public class EditorDaoImpl implements EditorDao{
	private SqlSessionFactory sf=SessionUtil.getSF();
	private SqlSession session=null;
	private EditorMapper em;
	@Override
	public int login(Editor editor) {
		session=sf.openSession();
		em=session.getMapper(EditorMapper.class);
		return em.login(editor);
	}

	@Override
	public int insert(Editor editor) {
		session=sf.openSession(true);
		em=session.getMapper(EditorMapper.class);
		return em.insert(editor);
	}

	@Override
	public int update(Editor editor) {
		session=sf.openSession(true);
		em=session.getMapper(EditorMapper.class);
		return em.update(editor);
	}

	@Override
	public int delete(int id) {
		session=sf.openSession(true);
		em=session.getMapper(EditorMapper.class);
		return em.delete(id);
	}

	@Override
	public List<Editor> getAll(Page page) {
		session=sf.openSession();
		em=session.getMapper(EditorMapper.class);
		page.setPageIndex((page.getPageIndex()-1)*page.getPageNum());
		return em.getAll(page);
	}

	@Override
	public Editor getOne(String editor_name) {
		session=sf.openSession();
		em=session.getMapper(EditorMapper.class);
		return em.getOne(editor_name);
	}

	@Override
	public Long getTotal() {
		session=sf.openSession();
		em=session.getMapper(EditorMapper.class);
		return em.getTotal();
	}
	
}
