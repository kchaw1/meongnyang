package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PointPlus {

	int plusNo;
	String id;
	int plusPoint;
	Date plusDate;
	String plusType;
	String merchantUid;
	String impUid;
} //end class
