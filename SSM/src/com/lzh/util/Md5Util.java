package com.lzh.util;

import java.security.MessageDigest;
/**
 * MD5加密算法
 * @author Administrator
 *
 */
public class Md5Util {
	public String getDigest(String mystr){
		String end = "";
		char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = mystr.getBytes();//把字符串转换成byte数组
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");//创建MD5加密的对象
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();//获取16位的密文
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];//右移动4位取高位
                str[k++] = hexDigits[byte0 & 0xf];//取低位
            }
           for(char c: str){
        	   end+=c;
           }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return end;
	}
}
