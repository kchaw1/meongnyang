package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ScoreHistory {
	private int scoreNo;
	private String id;
	private String scoreType;
	private Date scoreDate;
	private String scorePlus;
}
