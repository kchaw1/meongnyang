package com.nmcat.repository.domain.board;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class DiaryComment {

	private int drcNo;
	private int drNo;
	private String drcWriter;
	private String drcContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	private Date drcRegDate;
	private List<Integer> drNoList;
	private String friendsId;
	private String userId;
} //end class
