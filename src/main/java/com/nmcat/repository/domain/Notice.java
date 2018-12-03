package com.nmcat.repository.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Notice {
	private int ntcNo;
	private String ntcWriter;
	private String ntcTitle;
	private String ntcContent;
	private int ntcViewCnt;
	@JsonFormat(pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date ntcRegDate;
	private String searchType;
	private String keyword;	
	
	
	// 페이지 번호
	private int pageNo;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	// #{begin} -> board.xml
	public int getBegin() {
		return (pageNo - 1) * 10;
	}
}
