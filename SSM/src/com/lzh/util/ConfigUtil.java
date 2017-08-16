package com.lzh.util;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

/**
 * 解析spring配置文件，创建一个bean
 * @author Administrator
 *
 */
public class ConfigUtil {
	public static Object getBean(String beanName){
		BeanFactory factory=new ClassPathXmlApplicationContext("/config.xml");
		return factory.getBean(beanName);
	}
}
