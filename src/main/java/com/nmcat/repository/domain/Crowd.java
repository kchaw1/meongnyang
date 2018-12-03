package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Crowd {
	private int crNo;
	private String crWriter;
	private String crTitle;
	private String crContent;
	private int crNowMoney;
	private int crGoalMoney;
	private Date crStartDay;
	private Date crEndDay;
	private int crLikeCnt;
	private Date crRegDate;
	private int crViewCnt;
	private String crFileName;
	private String crFilePath;
}
