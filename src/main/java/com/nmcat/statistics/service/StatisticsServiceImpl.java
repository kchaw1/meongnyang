package com.nmcat.statistics.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Statistics;
import com.nmcat.repository.mapper.StatisticsMapper;

@Service
public class StatisticsServiceImpl implements StatisticsService{

	@Autowired
	private StatisticsMapper mapper;
	
	/********************* 일별 *************************/
	
	// 일별,월별 가입자수
	@Override
	public int newMember(String date) {
		return mapper.selectNewMemberCount(date);
	}
	
	// 일별,월별 방문자수
	@Override
	public int visitor(String date) {
		return mapper.selectVisitorCount(date);
	}
	
	// 일별,월별 게시글수
	@Override
	public int post(String date) {
		return mapper.selectPostCount(date);
	}
	
	// 일별,월별 댓글수
	@Override
	public int comment(String date) {
		return mapper.selectCommentCount(date);
	}
	
	// 일별,월별 포인트 사용량
	@Override
	public int point(String date) {
		return mapper.selectPointCount(date);
	}
	
	// 일별,월별 평균 접속시간
	@Override
	public int connectTime(String date) {
		return mapper.selectAvgConnectTime(date);
	}
	
	/********************* 주별 *************************/
	
	// 일별,월별 가입자수
	@Override
	public List<Statistics> newMemberWeek(String month) {
		return mapper.selectWeekNewMemberCount(month);
	}
	
	// 일별,월별 방문자수
	@Override
	public List<Statistics> visitorWeek(String month) {
		return mapper.selectWeekVisitorCount(month);
	}
	
	// 일별,월별 게시글수
	@Override
	public List<Statistics> postWeek(String month) {
		return mapper.selectWeekPostCount(month);
	}
	
	// 일별,월별 댓글수
	@Override
	public List<Statistics> commentWeek(String month) {
		return mapper.selectWeekCommentCount(month);
	}
	
	// 일별,월별 포인트 사용량
	@Override
	public List<Statistics> pointWeek(String month) {
		return mapper.selectWeekPointCount(month);
	}
	
	// 일별,월별 평균 접속시간
	@Override
	public List<Statistics> connectTimeWeek(String month) {
		return mapper.selectWeekAvgConnectTime(month);
	}
	
	
}
