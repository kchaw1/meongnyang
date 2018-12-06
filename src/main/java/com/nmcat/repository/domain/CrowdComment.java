package com.nmcat.repository.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class CrowdComment {
	private int crcNo;
	private int crNo;
	private String crcWriter;
	private String crcContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date crcRegDate;
}
