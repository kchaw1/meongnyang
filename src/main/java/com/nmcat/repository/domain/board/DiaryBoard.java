package com.nmcat.repository.domain.board;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DiaryBoard {

	private int drNo;
	private String drWriter;
	private String drTitle;
	private String drContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date drRegDateTime;
	private String drShare;
	private String drDate;
	private String yearMonth;
	private String friendsId;
	private String userId;
	
	public String getYearMonth() {
		return drDate.substring(0, drDate.length()-2);			
	}

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
		return (pageNo - 1) * 15;
	}
	
} // end class
