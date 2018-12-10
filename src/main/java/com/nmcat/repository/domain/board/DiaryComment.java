package com.nmcat.repository.domain.board;

import java.util.Date;

import lombok.Data;

@Data
public class DiaryComment {

	int drcNo;
	int drNo;
	String drcWriter;
	String drcContent;
	Date drcRegDate;
} //end class
