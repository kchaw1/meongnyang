package com.nmcat.repository.domain.board;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommunityBoard {
	int comNo;
	int comRecCnt;
	int comViewCnt;
	String comTitle;
	String comWriter;
	String comContent;
	String comCategory;
	
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	Date comRegDate;
}
