package com.lzh.domain;


public class News {
	private int id;
	private String title;
	private String content;
	private String editor;
	private String post_time;
	private String type;
	private String attpic;
	private int readcount;
	private String href;
	private String twotype;
	private String introduction;
	public News() {
	}
	
	public News(int id, String title, String content, String editor,
			String post_time, String type, String attpic, int readcount,
			String href) {
		this.id = id;
		this.title = title;
		this.content = content;
		this.editor = editor;
		this.post_time = post_time;
		this.type = type;
		this.attpic = attpic;
		this.readcount = readcount;
		this.href = href;
	}

	public News( String title, String content, String editor,
			String post_time, String type, String attpic, int readcount,
			String href) {
		this.title = title;
		this.content = content;
		this.editor = editor;
		this.post_time = post_time;
		this.type = type;
		this.attpic = attpic;
		this.readcount = readcount;
		this.href = href;
	}
	
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getTwotype() {
		return twotype;
	}

	public void setTwotype(String twotype) {
		this.twotype = twotype;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getEditor() {
		return editor;
	}
	public void setEditor(String editor) {
		this.editor = editor;
	}
	public String getPost_time() {
		return post_time;
	}
	public void setPost_time(String post_time) {
		this.post_time = post_time;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAttpic() {
		return attpic;
	}
	public void setAttpic(String attpic) {
		this.attpic = attpic;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	
	
}
