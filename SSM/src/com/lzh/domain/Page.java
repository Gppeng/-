package com.lzh.domain;

public class Page {
	private int pageIndex;
	private int pageNum;
	public Page() {
	}
	public Page(int pageIndex, int pageNum) {
		this.pageIndex = pageIndex;
		this.pageNum = pageNum;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageNum() {
		return pageNum;
	}
	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}
}
