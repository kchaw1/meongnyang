package com.nmcat.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityMapper mapper;
	
	//Ä¿¹Â´ÏÆ¼ CRUD
	@Override
	public List<CommunityBoard> selectBoard() {
		return mapper.selectBoard();
	}

	@Override
	public CommunityBoard detailBoard(int comNo) {
		return mapper.detailBoard(comNo);
	}

	@Override
	public void insertBoard(CommunityBoard comBoard) {
		mapper.insertBoard(comBoard);
		
	}

	@Override
	public void deleteBoard(int comNo) {
		mapper.deleteBoard(comNo);
		
	}

	@Override
	public void updateBoard(CommunityBoard comBoard) {
		mapper.updateBoard(comBoard);
		
	}

	@Override
	public int selectBoardCount() {
		return mapper.selectBoardCount();
	}
	
	

}
