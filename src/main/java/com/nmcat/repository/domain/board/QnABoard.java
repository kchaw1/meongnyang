package com.nmcat.repository.domain.board;

import java.util.Date;

public class QnABoard {
	
	private int absNo;
	private int no;
	private String absTitle;
	private String absWriter;
	private String absContent;
	private Date absRegDate;
	private int absViewCnt;
	private int absLike;
	private String absComplete;
	
	
	public String getAbsTitle() {
		return absTitle;
	}
	public void setAbsTitle(String absTitle) {
		this.absTitle = absTitle;
	}
	public int getAbsNo() {
		return absNo;
	}
	public void setAbsNo(int absNo) {
		this.absNo = absNo;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAbsWriter() {
		return absWriter;
	}
	public void setAbsWriter(String absWriter) {
		this.absWriter = absWriter;
	}
	public String getAbsContent() {
		return absContent;
	}
	public void setAbsContent(String absContent) {
		this.absContent = absContent;
	}
	public Date getAbsRegDate() {
		return absRegDate;
	}
	public void setAbsRegDate(Date absRegDate) {
		this.absRegDate = absRegDate;
	}
	public int getAbsViewCnt() {
		return absViewCnt;
	}
	public void setAbsViewCnt(int absViewCnt) {
		this.absViewCnt = absViewCnt;
	}
	public int getAbsLike() {
		return absLike;
	}
	public void setAbsLike(int absLike) {
		this.absLike = absLike;
	}
	public String getAbsComplete() {
		return absComplete;
	}
	public void setAbsComplete(String absComplete) {
		this.absComplete = absComplete;
	}
	
	
}
