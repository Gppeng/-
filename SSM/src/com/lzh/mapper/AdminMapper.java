package com.lzh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.lzh.domain.Admin;
/**
 * 超管管理映射文件
 * @author Administrator
 *
 */
public interface AdminMapper {
	@Insert("insert into admin(admin_name,admin_pass,tel,email) value(#{admin_name},#{admin_pass},#{tel},#{email}) ")
	public void insertAdmin(Admin admin);
	@Delete("delete from admin where admin_id=#{admin_id}")
	public void deleteAdmin(int id);
	@Update("update admin set admin_name=#{admin_name},admin_pass=#{admin_pass} where admin_id=#{admin_id}")
	public void update(Admin admin);
	@Select("select admin_name,admin_pass from admin where admin_id=#{admin_id}")
	public Admin getAdmin(int id);
	@Select("select * from admin")
	public List<Admin> getAdmins();
	@Select("select count(*) num from admin where admin_name=#{admin_name} and admin_pass=#{admin_pass}")
	public int login(Admin admin);
	@Select("select count(*) num from admin where admin_name=#{admin_name}")
	public int regist(String admin_name);
	
}
