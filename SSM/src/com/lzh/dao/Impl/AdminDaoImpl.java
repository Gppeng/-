package com.lzh.dao.Impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.stereotype.Repository;

import com.lzh.dao.AdminDao;
import com.lzh.domain.Admin;
import com.lzh.mapper.AdminMapper;
import com.lzh.util.SessionUtil;
//����������
@Repository(value=AdminDao.SERVER_NAME)
public class AdminDaoImpl implements AdminDao{
	private SqlSessionFactory sf=SessionUtil.getSF();
	private SqlSession session=null;//����һ���������Ự
	private AdminMapper am=null;
	//��������
	public void insertAdmin(Admin admin) {
		session=sf.openSession(true);
		am=session.getMapper(AdminMapper.class);
		am.insertAdmin(admin);
		session.close();
	}

	//ͨ��idɾ������
	public void deleteAdmin(int id) {
		session=sf.openSession(true);
		am=session.getMapper(AdminMapper.class);
		am.deleteAdmin(id);
		session.close();
	}

	//�޸�����
	public void updateAmdin(Admin admin) {
		session=sf.openSession(true);
		am=session.getMapper(AdminMapper.class);
		am.update(admin);
		session.close();
	}

	//ͨ��id��ѯ����
	public Admin getAdmin(int id) {
		session=sf.openSession();
		am=session.getMapper(AdminMapper.class);
		return am.getAdmin(id);
	}

	//��ѯ��������
	public List<Admin> getAdmins() {
		session=sf.openSession();
		am=session.getMapper(AdminMapper.class);
		return am.getAdmins();
	}

	@Override
	public int login(Admin admin) { 
		session=sf.openSession();
		am=session.getMapper(AdminMapper.class);
		return am.login(admin);
	}

	@Override
	public int regist(String admin_name) {
		session=sf.openSession();
		am=session.getMapper(AdminMapper.class);
		return am.regist(admin_name);
	}

}
