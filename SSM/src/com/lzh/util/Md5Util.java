package com.lzh.util;

import java.security.MessageDigest;
/**
 * MD5�����㷨
 * @author Administrator
 *
 */
public class Md5Util {
	public String getDigest(String mystr){
		String end = "";
		char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = mystr.getBytes();//���ַ���ת����byte����
            // ���MD5ժҪ�㷨�� MessageDigest ����
            MessageDigest mdInst = MessageDigest.getInstance("MD5");//����MD5���ܵĶ���
            // ʹ��ָ�����ֽڸ���ժҪ
            mdInst.update(btInput);
            // �������
            byte[] md = mdInst.digest();//��ȡ16λ������
            // ������ת����ʮ�����Ƶ��ַ�����ʽ
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];//���ƶ�4λȡ��λ
                str[k++] = hexDigits[byte0 & 0xf];//ȡ��λ
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
