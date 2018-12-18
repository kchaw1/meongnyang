package com.nmcat.score.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.ScoreMapper;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	ScoreMapper mapper;
	
	// 濡쒓렇�씤 �뻽�쓣 �븣  �솢�룞�젏�닔 +10 �젏 二쇰뒗 �궡�뿭
	@Override
	public void insertLoginScoreHistory(String id) {
		mapper.insertLoginScoreHistory(id);
		
	}
	
	
	
	@Override
	public void insertCommentScoreHistory(String id) {
		mapper.insertCommentScoreHistory(id);
		
	}



	@Override
	public void insertBoardScoreHistory(String id) {
		mapper.insertBoardScoreHistory(id);
		
	}
	



	@Override
	public void updateBoardScore(String id) {
		mapper.updateBoardScore(id);
		
	}



	@Override
	public void updateCommentScore(String id) {
		mapper.updateCommentScore(id);
		
	}



	// �벑湲� �뾽�뜲�씠�듃
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
