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
private int comCommentCnt;
private int comRefCnt;
private int comCheckCnt;
private String comfImageName;
private String comfImagePath;



	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
private Date comRegDate;
	
	// 占쎈읂占쎌뵠筌욑옙 甕곕뜇�깈
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
