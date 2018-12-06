package com.nmcat.repository.domain;

import java.util.Date;

import lombok.Data;

@Data
public class PointMinus {
	int minusNo;
	String id;
	int crNo;
	int minusPoint;
	Date minusDate;
	String minusUse;
	int fees;
}
