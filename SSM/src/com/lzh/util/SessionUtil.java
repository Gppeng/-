package com.lzh.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/**
 * ͨ�����������ļ�������session
 * @author Administrator
 *
 */
public class SessionUtil {
	public static SqlSessionFactory getSF(){
		try {
			InputStream is=Resources.getResourceAsStream("mybatis.xml");
			return new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			System.out.println("�����ļ����ϣ�");
			return null;
		}
		
	}
}
