package com.nmcat.repository.domain;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	private String gradeName;
	private String gradeNo;
	private MultipartFile profile;
	private String url;
	private String imageName;
	private String imagePath;
	private int imageSize;
	private String imageOriName;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date signUpDate;
	private String loginState;
	private String authState;
	private String greetings;
	private String careerStart;
	private String careerEnd;
	private String careerContent;
	private int point;
	private List<String> FriendIdList;
	private List<String> BlackIdList;
	private String ranking;
	
	// 조인때문에 만듦
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date loginDateTime; // 로긴 시간
	
	private String codeName; // 등급 이름
	
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
