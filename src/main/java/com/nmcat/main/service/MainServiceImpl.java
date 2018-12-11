package com.nmcat.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainMapper mapper;

	@Override
	public List<CommunityBoard> selectComBoardRegDate() {
		return mapper.selectComBoardRegDate();
	}

	@Override
	public List<DiaryBoard> selectDiaryBoardRegDate() {
		return mapper.selectDiaryBoardRegDate();
	} 
	
	

}
