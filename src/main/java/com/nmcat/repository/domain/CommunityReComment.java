package com.nmcat.repository.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CommunityReComment {
	int comNo;
	int comcNo;
	int comcReNo;
	String comcReWriter;
	String comcReContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	Date comcReRegDate;

	
}
