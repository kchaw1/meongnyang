package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Youtube {
	private int ytbNo;
	private String ytbWriter;
	private String ytbKeyword;
	private String ytbURL;
	private Date ytbRegDate;
}
