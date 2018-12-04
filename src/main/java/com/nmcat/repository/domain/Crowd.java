package com.nmcat.repository.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Crowd {
	private int crNo;
	private String crWriter;
	private String crTitle;
	private String crContent;
	private int crNowMoney;
	private int crGoalMoney;
	private String crStartDay;
	private String crEndDay;
	private int crLikeCnt;
	private Date crRegDate;
	private int crViewCnt;
	private String crEndYN;
	
	// 파일관련
	private MultipartFile attach;
	private String crFileName;
	private String crFilePath;
	private String crFileOriName;
	
	// 페이지 번호
	private int pageNo;
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	// #{begin} -> board.xml
	public int getBegin() {
		return (pageNo - 1) * 8;
	}

}
