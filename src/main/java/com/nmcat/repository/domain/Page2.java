package com.nmcat.repository.domain;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Page2 {
	
	private int pageNo;
	private int begin;
	private int end;
	private String id;
	private String comWriter;
	private String comcWriter;


	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getBegin() {
		return (pageNo - 1) * 10;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return pageNo * 10;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
}
