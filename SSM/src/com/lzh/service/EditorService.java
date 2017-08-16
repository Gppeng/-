package com.lzh.service;

import java.util.List;

import com.lzh.domain.Editor;
import com.lzh.domain.Page;

public interface EditorService {
	public static final String SERVER_NAME="com.lzh.service.EditorServiceImpl";
	public boolean login(Editor editor);
	public int insert(Editor editor);
	public int update(Editor editor);
	public int delete(int id);
	public List<Editor> getAll(Page page);
	public Editor getOne(String editor_name);
	public Long getTotal();
}
