package com.nmcat.repository.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Member {

	private int no;
	private String id;
	private String type;
	private String name;
	private String pass;
	private String category;
	private String email;
	private int absLikeCnt;
	private int score;
	private String gradeNo;
	private String imageName;
	private String imagePath;
	private int imageSize;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date signUpDate;
	private String loginState;
	private String authState;
	private String greetings;
	private int point;
	private int sort;
	
	
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
			return (pageNo - 1) * 12;
		}
		
		
	
} //endclass
