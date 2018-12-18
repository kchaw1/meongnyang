package com.nmcat.score.service;

public interface ScoreService {
	void insertLoginScoreHistory(String id);
	
	void updateGradeNo(String id); // �벑湲� �뾽�뜲�씠�듃
	
	void insertCommentScoreHistory(String id);
	void insertBoardScoreHistory(String id);
	
	
	void updateBoardScore(String id);
	void updateCommentScore(String id);
}
