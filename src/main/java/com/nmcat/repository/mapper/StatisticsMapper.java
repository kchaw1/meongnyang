package com.nmcat.repository.mapper;

public interface StatisticsMapper {
	
	/* 일별 */
	int selectDayNewMemberCount(String date); // 가입자수
	int selectDayVisitorCount(String date); // 방문자수
	int selectDayPostCount(String date); // 게시글수
	int selectDayCommentCount(String date); // 코멘트수
	int selectDayPointCount(String date); // 포인트사용량
	int selectDayAvgConnectTime(String date); // 평균접속시간
}
