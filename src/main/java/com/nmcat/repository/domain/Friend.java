package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Friend {

	int friendNo;
	String friendsId;
	String callerId;
	String calleeId;
	String answer;
	Date callDate;
	Date answerDate;
	String userId;
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
	

} //
