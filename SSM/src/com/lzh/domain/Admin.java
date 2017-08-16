package com.lzh.domain;
/**
 * 超级管理员属性
 * @author Administrator
 *
 */
public class Admin {
	private int admin_id;
	private String admin_name;
	private String admin_pass;
	private String tel;
	private String email;
	public Admin() {
	}
	public Admin(int admin_id, String admin_name, String admin_pass) {
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.admin_pass = admin_pass;
	}
	
	public Admin(int admin_id, String admin_name, String admin_pass,
			String tel, String email) {
		this.admin_id = admin_id;
		this.admin_name = admin_name;
		this.admin_pass = admin_pass;
		this.tel = tel;
		this.email = email;
	}
	public Admin(String admin_name, String admin_pass) {
		this.admin_name = admin_name;
		this.admin_pass = admin_pass;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(int admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getAdmin_pass() {
		return admin_pass;
	}
	public void setAdmin_pass(String admin_pass) {
		this.admin_pass = admin_pass;
	}
}
