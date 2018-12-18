package com.nmcat.repository.mapper;

import com.nmcat.repository.domain.Member;

public interface ScoreMapper {
	void insertLoginScoreHistory(String id);
	int selectScore(String id); // �솢�룞�젏�닔 議고쉶
	void updateGradeNo(Member member); // �벑湲� �뾽�뜲�씠�듃
	
	void insertCommentScoreHistory(String id);
	void insertBoardScoreHistory(String id);
	
	void updateBoardScore(String id);
	void updateCommentScore(String id);
	
}
