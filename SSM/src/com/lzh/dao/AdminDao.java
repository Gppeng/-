package com.lzh.dao;

import java.util.List;

import com.lzh.domain.Admin;
/**
 * ��������Ա����
 * @author Administrator
 *
 */
public interface AdminDao {
	public static final String SERVER_NAME="com.lzh.dao.AdminDaoImpl";
	//����
	public void insertAdmin(Admin admin);
	//ͨ��idɾ��
	public void deleteAdmin(int id);
	//ͨ��id�޸�
	public void updateAmdin(Admin admin);
	//ͨ��id�õ�
	public Admin getAdmin(int id);
	//��ѯȫ������
	public List<Admin> getAdmins();
	//��¼��֤
	public int login(Admin admin);
	public int regist(String admin_name);
}
