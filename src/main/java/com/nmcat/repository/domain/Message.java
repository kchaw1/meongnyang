package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Message {
	private String msgNo;
	private String recvId;
	private String sendId;
	private String MsgTitle;
	private String MsgContent;
	private Date sendDate;
	private Date readDate;
	private Boolean recvDel;
	private Boolean sendDel;
}
