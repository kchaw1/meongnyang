package com.nmcat.statistics.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.mapper.StatisticsMapper;

@Service
public class StatisticsServiceImpl implements StatisticsService{

	@Autowired
	private StatisticsMapper mapper;
	
	/********************* 일별 *************************/
	
	// 일별 가입자수
	@Override
	public int dayNewMember(String date) {
		return mapper.selectDayNewMemberCount(date);
	}
	
	// 일별 방문자수
	@Override
	public int dayVisitor(String date) {
		return mapper.selectDayVisitorCount(date);
	}
	
	// 일별 게시글수
	@Override
	public int dayPost(String date) {
		return mapper.selectDayPostCount(date);
	}
	
	// 일별 댓글수
	@Override
	public int dayComment(String date) {
		return mapper.selectDayCommentCount(date);
	}
	
	// 일별 포인트 사용량
	@Override
	public int dayPoint(String date) {
		return mapper.selectDayPointCount(date);
	}
	
	// 일별 평균 접속시간
	@Override
	public int dayConnectTime(String date) {
		return mapper.selectDayAvgConnectTime(date);
	}
	
	/********************* 주별 *************************/
	
	
	
	
	/********************* 월별 *************************/
}
