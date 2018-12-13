package com.nmcat.score.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.ScoreMapper;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	ScoreMapper mapper;
	
	// 로그인 했을 때  활동점수 +10 점 주는 내역
	@Override
	public void insertLoginScoreHistory(String id) {
		mapper.insertLoginScoreHistory(id);
		
	}
	
	// 등급 업데이트
	@Override
	public void updateGradeNo(String id) {
		Member member = new Member();
		member.setId(id);
		
		int score = mapper.selectScore(id);
		
		if(score < 300) {
			member.setGradeNo("1001");
			mapper.updateGradeNo(member);
		} else if(score < 500) {
			member.setGradeNo("1002");
			mapper.updateGradeNo(member);
		} else if(score < 1000) {
			member.setGradeNo("1003");
			mapper.updateGradeNo(member);
		} else if(score < 1500) {
			member.setGradeNo("1004");
			mapper.updateGradeNo(member);
		} else {
			member.setGradeNo("1005");
			mapper.updateGradeNo(member);
		}
	}
}
