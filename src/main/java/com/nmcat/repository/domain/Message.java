package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	private String msgNo;
	private String recvId;
	private String sendId;
	private String msgTitle;
	private String msgContent;
	private Date sendDate;
	private Date readDate;
	private Boolean recvDel;
	private Boolean sendDel;
	
	private int pageNo;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	public int getBegin() {
		return (pageNo - 1) * 10;
	}
}
