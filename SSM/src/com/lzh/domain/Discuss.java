package com.lzh.domain;

public class Discuss {
	private int id;
	private int did;
	private int uid;
	private String post_time;
	private String content;
	private int nid;
	private User user;
	private News news;
	
	public Discuss(int uid,  String post_time,String content, int nid,int did) {
		this.uid = uid;
		this.post_time = post_time;
		this.content = content;
		this.nid = nid;
		this.did = did;
	}

	public Discuss() {
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getNid() {
		return nid;
	}
	public void setNid(int nid) {
		this.nid = nid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}
}
