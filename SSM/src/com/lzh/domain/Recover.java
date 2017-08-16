package com.lzh.domain;

import java.io.IOException;

public class Recover {
	public boolean load(){  
	    String filepath = "d:\\lzh.sql"; // 备份的路径地址    
	      //新建数据库test   
	      String stmt1 = "mysqladmin -u root -pHUIHUI123 create lzhtest";   
	      String stmt2 = "mysql -u root -pHUIHUI123 lzhtest < " + filepath;   
	      String[] cmd = { "cmd", "/c", stmt2 };   
	      try {   
	      Runtime.getRuntime().exec(stmt1);   
	      Runtime.getRuntime().exec(cmd);   
	      System.out.println("数据已从 " + filepath + " 导入到数据库中");   
	      } catch (IOException e) {   
	      e.printStackTrace();   
	      }   
	      return true;  
	}  
}
