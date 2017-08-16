package com.lzh.domain;
/**
 * ±‡º≠’ﬂ Ù–‘
 * @author Administrator
 *
 */
public class Editor {
	private int id;
	private String editor_name;
	private String editor_pass;
	private String editor_tel;
	private String editor_email;
	
	public Editor() {
	}
	
	public Editor(String editor_name, String editor_pass, String editor_tel,
			String editor_email) {
		this.editor_name = editor_name;
		this.editor_pass = editor_pass;
		this.editor_tel = editor_tel;
		this.editor_email = editor_email;
	}
	
	public Editor(String editor_name, String editor_pass) {
		this.editor_name = editor_name;
		this.editor_pass = editor_pass;
	}

	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getEditor_name() {
		return editor_name;
	}
	public void setEditor_name(String editor_name) {
		this.editor_name = editor_name;
	}
	public String getEditor_pass() {
		return editor_pass;
	}
	public void setEditor_pass(String editor_pass) {
		this.editor_pass = editor_pass;
	}
	public String getEditor_tel() {
		return editor_tel;
	}
	public void setEditor_tel(String editor_tel) {
		this.editor_tel = editor_tel;
	}
	public String getEditor_email() {
		return editor_email;
	}
	public void setEditor_email(String editor_email) {
		this.editor_email = editor_email;
	}
	
}
