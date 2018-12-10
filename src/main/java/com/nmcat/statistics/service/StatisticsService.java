package com.nmcat.statistics.service;

import java.util.List;

import com.nmcat.repository.domain.Statistics;

public interface StatisticsService {

	/* 일별 월별 */
	int newMember(String date); // 가입자수
	int visitor(String date); // 방문자수	
	int post(String date); // 게시글수
	int comment(String date); // 댓글수	
	int point(String date); // 포인트사용량
	int connectTime(String date); // 평균접속시간
	
	/* 주별 */
	List<Statistics> newMemberWeek(String month); // 가입자수
	List<Statistics> visitorWeek(String month); // 방문자수	
	List<Statistics> postWeek(String month); // 게시글수
	List<Statistics> commentWeek(String month); // 댓글수	
	List<Statistics> pointWeek(String month); // 포인트사용량
	List<Statistics> connectTimeWeek(String month); // 평균접속시간
}
