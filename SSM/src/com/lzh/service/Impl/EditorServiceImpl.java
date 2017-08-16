package com.lzh.service.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lzh.dao.EditorDao;
import com.lzh.domain.Editor;
import com.lzh.domain.Page;
import com.lzh.service.EditorService;

@Service(value=EditorService.SERVER_NAME)
public class EditorServiceImpl implements EditorService{
	@Resource(name=EditorDao.SERVER_NAME)
	private EditorDao editorDao;

	@Override
	public boolean login(Editor editor) {
		int num=editorDao.login(editor);
		if(num!=1){
			return false;
		}else{
			return true;
		}
	}

	@Override
	public int insert(Editor editor) {
		return editorDao.insert(editor);
	}

	@Override
	public int update(Editor editor) {
		return editorDao.update(editor);
	}

	@Override
	public int delete(int id) {
		return editorDao.delete(id);
	}

	@Override
	public List<Editor> getAll(Page page) {
		return editorDao.getAll(page);
	}

	@Override
	public Editor getOne(String editor_name) {
		return editorDao.getOne(editor_name);
	}

	@Override
	public Long getTotal() {
		return editorDao.getTotal();
	}
}
