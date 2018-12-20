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
	
	// 議곗씤�븣臾몄뿉 留뚮벀
	@JsonFormat(pattern="yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
	private Date loginDateTime; // 濡쒓릿 �떆媛�
	
	private String codeName; // �벑湲� �씠由�
	
	// �럹�씠吏� 踰덊샇
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
