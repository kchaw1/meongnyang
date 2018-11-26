package com.nmcat.repository.domain.board;

import java.util.Date;

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
	Date drRegDateTime;
	String drShare;
	String drDate;
} // end class
