package com.nmcat.score.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.mapper.ScoreHistoryMapper;

@Service
public class ScoreServiceImpl implements ScoreService {

	@Autowired
	ScoreHistoryMapper mapper;
	
	// 로그인 했을 때  활동점수 +10 점 주는 내역
	@Override
	public void insertLoginScoreHistory(String id) {
		mapper.insertLoginScoreHistory(id);
		
	}
	
	

}
