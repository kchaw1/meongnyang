package com.nmcat.statistics.service;

public interface StatisticsService {

	int dayNewMember(String date); // 가입자수
	int dayVisitor(String date); // 방문자수	
	int dayPost(String date); // 게시글수
	int dayComment(String date); // 댓글수	
	int dayPoint(String date); // 포인트사용량
	int dayConnectTime(String date); // 평균접속시간
}
