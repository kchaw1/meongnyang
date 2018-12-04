package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class Blacklist {

	int blackNo;
	String blackFromId;
	String blackToId;
	String blackState;
	Date blackDate;
	Date CancelDate;
} //end class
