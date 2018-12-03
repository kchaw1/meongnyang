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
}
