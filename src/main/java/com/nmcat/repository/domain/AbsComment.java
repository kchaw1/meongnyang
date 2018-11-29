package com.nmcat.repository.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class AbsComment {
	private int no;
	private int absNo;
	private int abscNo;
	private String absWriter;
	private String abscContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date abscRegDate;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public Date getAbscRegDate() {
		return abscRegDate;
	}
	public void setAbscRegDate(Date abscRegDate) {
		this.abscRegDate = abscRegDate;
	}
	public int getAbsNo() {
		return absNo;
	}
	public void setAbsNo(int absNo) {
		this.absNo = absNo;
	}
	public int getAbscNo() {
		return abscNo;
	}
	public void setAbscNo(int abscNo) {
		this.abscNo = abscNo;
	}
	public String getAbsWriter() {
		return absWriter;
	}
	public void setAbsWriter(String absWriter) {
		this.absWriter = absWriter;
	}
	public String getAbscContent() {
		return abscContent;
	}
	public void setAbscContent(String abscContent) {
		this.abscContent = abscContent;
	}
	public void setRegDateString(String date) {
		// TODO Auto-generated method stub
		
	}
	
	
}
