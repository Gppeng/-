package com.lzh.domain;

import java.io.IOException;

public class Recover {
	public boolean load(){  
	    String filepath = "d:\\lzh.sql"; // ���ݵ�·����ַ    
	      //�½����ݿ�test   
	      String stmt1 = "mysqladmin -u root -pHUIHUI123 create lzhtest";   
	      String stmt2 = "mysql -u root -pHUIHUI123 lzhtest < " + filepath;   
	      String[] cmd = { "cmd", "/c", stmt2 };   
	      try {   
	      Runtime.getRuntime().exec(stmt1);   
	      Runtime.getRuntime().exec(cmd);   
	      System.out.println("�����Ѵ� " + filepath + " ���뵽���ݿ���");   
	      } catch (IOException e) {   
	      e.printStackTrace();   
	      }   
	      return true;  
	}  
}
