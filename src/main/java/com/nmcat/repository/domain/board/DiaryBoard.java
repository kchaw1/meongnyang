package com.nmcat.repository.domain.board;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class DiaryBoard {

	int drNo;
	String drWriter;
	String drTitle;
	String drContent;
	@JsonFormat(pattern="yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
	Date drRegDateTime;
	String drShare;
	String drDate;
} // end class
