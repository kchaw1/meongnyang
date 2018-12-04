package com.nmcat.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.ComSearchVO;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.CommunityMapper;

@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityMapper mapper;
	
	//Ŀ�´�Ƽ CRUD
	@Override
	public List<CommunityBoard> selectBoard(CommunityBoard comBoard) {
		return mapper.selectBoard(comBoard);
	}

	/*@Override
	public List<CommunityBoard> selectBoard(CommunityBoard comBoard) {
		return mapper.selectBoard(comBoard);
	}
*/
	@Override
	public CommunityBoard detailBoard(int comNo) {
		return mapper.detailBoard(comNo);
	}

	@Override
	public void insertBoard(CommunityBoard comBoard, CommunityFile file) {
		mapper.insertBoard(comBoard);
		file.setComNo(comBoard.getComNo());
		mapper.insertBoardFile(file);
	}
	

	@Override
	public void insertBoardFile(CommunityFile file) {
		mapper.insertBoardFile(file);
		
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

	@Override
	public List<CommunityComment> selectComment(int comNo) {
		return mapper.selectComment(comNo);
	}

	@Override
	public void insertComment(CommunityComment comComment) {
		mapper.insertComment(comComment);
		
	}

	@Override
	public void deleteComment(int comcNo) {
		mapper.deleteComment(comcNo);
		
	}

	@Override
	public void updateComment(CommunityComment comComment) {
		mapper.updateComment(comComment);
		
	}

	@Override
	public int selectCommentCount(int comNo) {
		
		return mapper.selectCommentCount(comNo);
	}
	
	
	

}
