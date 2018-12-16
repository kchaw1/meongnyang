package com.nmcat.repository.domain;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class Page2 {
	private String select;
	private String text;
	private int pageNo;
	private String id;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	// #{begin} -> board.xml
	public int getBegin() {
		return (pageNo - 1) * 10 + 1;
	}
	// #{end} -> board.xml
	public int getEnd() {
		return pageNo * 10;
	}
}
