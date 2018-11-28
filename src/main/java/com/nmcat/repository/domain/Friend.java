package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Friend {

	int friendNo;
	String callerId;
	String calleeId;
	String answer;
	Date callDate;
	Date answerDate;
} //
