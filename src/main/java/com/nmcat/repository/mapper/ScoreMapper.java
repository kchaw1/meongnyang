package com.nmcat.repository.mapper;

import com.nmcat.repository.domain.Member;

public interface ScoreMapper {
	void insertLoginScoreHistory(String id);
	int selectScore(String id); // 활동점수 조회
	void updateGradeNo(Member member); // 등급 업데이트
}
