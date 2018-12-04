package com.nmcat.repository.domain.board;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommunityBoard {
private int comNo;
private int comRecCnt;
private int comViewCnt;
private String comTitle;
private String comWriter;
private String comContent;
private String comCategory;
private String searchType;

	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
private Date comRegDate;
	
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
