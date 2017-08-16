package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lzh.domain.Editor;
import com.lzh.domain.Page;

public interface EditorMapper {
	@Select("select * from editor limit #{pageIndex},#{pageNum}")
	public List<Editor> getAll(Page page);
	@Select("select count(*) from editor ")
	public Long getTotal();
	@Select("select count(*) num from editor where editor_name=#{editor_name} and editor_pass=#{editor_pass}")
	public int login(Editor editor); 
	@Select("select * from editor where editor_name=#{editor_name}")
	public Editor getOne(String editor_name);
	@Delete("delete from editor where id=#{id}")
	public int delete(int id);
	@Insert("insert into editor(editor_name,editor_pass,editor_tel,editor_email) values(#{editor_name},#{editor_pass},#{editor_tel},#{editor_email})")
	public int insert(Editor editor);
	@Update("update editor set editor_name=#{editor_name},editor_pass=#{editor_pass},editor_tel=#{editor_tel},editor_email=#{editor_email} where id=#{id}")
	public int update(Editor editor);
}
