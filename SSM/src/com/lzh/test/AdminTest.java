package com.lzh.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import com.lzh.dao.AdminDao;
import com.lzh.dao.EditorDao;
import com.lzh.dao.Impl.AdminDaoImpl;
import com.lzh.dao.Impl.EditorDaoImpl;
import com.lzh.domain.Admin;
import com.lzh.domain.Editor;
import com.lzh.domain.Page;
import com.lzh.mapper.AdminMapper;
import com.lzh.mapper.EditorMapper;
import com.lzh.util.SessionUtil;
/**
 * 2016/10/25 adminMapper测试全部通过
 * @author 李朝晖
 * 2016/10/25 adminDao测试全部通过	
 */
public class AdminTest {
	SqlSessionFactory sf=SessionUtil.getSF();
	SqlSession session=sf.openSession(true);
	private AdminMapper am=session.getMapper(AdminMapper.class);
	private EditorMapper em=session.getMapper(EditorMapper.class);
	@Test
	public void insert(){
		Admin admin=new Admin("lizhaohui","huihui123");
		am.insertAdmin(admin);
	}
	@Test
	public void delete(){
		am.deleteAdmin(17);
	}
	@Test
	public void update(){
		Admin admin=new Admin(1,"hhhgggeee","nihao2222");
		am.update(admin);
	}
	@Test
	public void get(){
		Admin admin=am.getAdmin(2);
		System.out.println(admin.getAdmin_name());
	}
	@Test
	public void gets(){
		AdminDao ad=new AdminDaoImpl();
		Admin admin=new Admin("lizhaohui","huihui123");
		System.out.println(ad.login(admin));
	}
	//AdminDao测试
	@Test
	public void insertDao(){
		Admin admin=new Admin("changquanrong","rrgoggo");
		AdminDao ad=new AdminDaoImpl();
		ad.insertAdmin(admin);
	}
	@Test
	public void deleteDao(){
		AdminDao ad=new AdminDaoImpl();
		ad.deleteAdmin(1);
	}
	@Test
	public void updateDao(){
		Admin admin=new Admin(2,"gaiguode","haha666");
		AdminDao ad=new AdminDaoImpl();
		ad.updateAmdin(admin);
	}
	@Test
	public void getDao(){
		AdminDao ad=new AdminDaoImpl();
		Admin admin=ad.getAdmin(2);
		System.out.println(admin.getAdmin_name());
	}
	@Test
	public void getsDao(){
		AdminDao ad=new AdminDaoImpl();
		List<Admin> list=ad.getAdmins();
		for(Admin admin:list){
			System.out.println(admin.getAdmin_name());
		}
	}
	@Test
	public void getsds(){
		
		EditorDao ed=new EditorDaoImpl();
		Page page=new Page(0,2);
		List<Editor> list=ed.getAll(page);
		for(Editor editor:list)
		System.out.println(editor.getEditor_pass());
		
	}
	@Test
	public void ma(){
		Page page=new Page(0,2);
		List<Editor> list=em.getAll(page);
		for(Editor editor:list)
		System.out.println(editor.getEditor_pass());
	}
	@Test
	public void updateE(){
		EditorDao ed=new EditorDaoImpl();
		Editor editor=new Editor("李朝晖","999","222","222@qq.com");
		editor.setId(2);
		ed.update(editor);
		System.out.println("success");
	}
}
