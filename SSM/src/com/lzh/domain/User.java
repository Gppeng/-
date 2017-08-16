package com.lzh.domain;
/**
 * 普通用户属性
 * @author Administrator
 *
 */
public class User {
	private int id;
	private String userName;
	private String password;
	private String trueName;
	private String tel;
	private String email;
	private String pic;
	public User() {
	}
	public User(String userName) {
		this.userName = userName;
	}

	public User(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}
	public User(String userName, String password, String tel, String email) {
		this.userName = userName;
		this.password = password;
		this.tel = tel;
		this.email = email;
	}
	
	public User(String userName,String password, String trueName, String tel, String email,
			String pic) {
		this.userName=userName;
		this.password = password;
		this.trueName = trueName;
		this.tel = tel;
		this.email = email;
		this.pic = pic;
	}
	public String getTrueName() {
		return trueName;
	}
	public void setTrueName(String trueName) {
		this.trueName = trueName;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	
	
}
