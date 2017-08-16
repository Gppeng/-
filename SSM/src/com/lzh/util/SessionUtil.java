package com.lzh.util;

import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/**
 * 通过解析配置文件，创建session
 * @author Administrator
 *
 */
public class SessionUtil {
	public static SqlSessionFactory getSF(){
		try {
			InputStream is=Resources.getResourceAsStream("mybatis.xml");
			return new SqlSessionFactoryBuilder().build(is);
		} catch (Exception e) {
			System.out.println("配置文件故障！");
			return null;
		}
		
	}
}
