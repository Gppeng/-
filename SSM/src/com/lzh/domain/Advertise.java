package com.lzh.domain;

public class Advertise {
	private int id;
	private String title;
	private String href;
	private String pic;
	public Advertise(String title, String href, String pic) {
		this.title = title;
		this.href = href;
		this.pic = pic;
	}
	public Advertise() {
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
}
