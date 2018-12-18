package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Rank extends Member {

	private int scoreNo;
	private String scoreType;
	private Date scoreDate;
	private int scorePlus;
	private String week;
	private String month;
	private int sum;
	
}
