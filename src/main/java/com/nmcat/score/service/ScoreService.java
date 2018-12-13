package com.nmcat.score.service;

public interface ScoreService {
	void insertLoginScoreHistory(String id);
	
	void updateGradeNo(String id); // 등급 업데이트
}
