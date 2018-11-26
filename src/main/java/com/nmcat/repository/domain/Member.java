package com.nmcat.repository.domain;

import java.util.Date;

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
	private Date signUpDate;
	private String loginState;
	private String authState;
	private String greetings;
	private int point;
	
} //endclass
