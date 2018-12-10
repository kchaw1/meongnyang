package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Statistics;

public interface StatisticsMapper {
	
	/* 일별, 월별 */
	int selectNewMemberCount(String date); // 가입자수
	int selectVisitorCount(String date); // 방문자수
	int selectPostCount(String date); // 게시글수
	int selectCommentCount(String date); // 코멘트수
	int selectPointCount(String date); // 포인트사용량
	int selectAvgConnectTime(String date); // 평균접속시간
	
	/* 주별 */
	List<Statistics> selectWeekNewMemberCount(String month); // 가입자수
	List<Statistics> selectWeekVisitorCount(String month); // 방문자수
	List<Statistics> selectWeekPostCount(String month); // 게시글수
	List<Statistics> selectWeekCommentCount(String month); // 코멘트수
	List<Statistics> selectWeekPointCount(String month); // 포인트사용량
	List<Statistics> selectWeekAvgConnectTime(String month); // 평균접속시간
}
