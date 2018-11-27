package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class CommunityComment {
	int comcNo;
	int comNo;
	String comcWriter;
	String comcContent;
	Date comcRegDate;
	int comcRef;
	int comcParentNo;
}
