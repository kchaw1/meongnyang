package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Blacklist {

	private int blackNo;
	private String blackFromId;
	private String blackToId;
	private String blackState;
	private Date blackDate;
	private Date cancelDate;
	private int lineBegin;
	
	//페이징..
	private int pageNo;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	// #{begin} -> board.xml
	public int getBegin() {
		return (pageNo - 1) * 12;
	}
} //end class
