package com.nmcat.repository.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommunityComment {
	int comcNo;
	int comNo;
	String comcWriter;
	String comcContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	Date comcRegDate;
	int comcRef;
	int comcParentNo;
}
