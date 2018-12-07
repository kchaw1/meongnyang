package com.nmcat.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
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

	@Override
	public List<CommunityBoard> selectBoardC(CommunityBoard comBoard) {

		return mapper.selectBoardC(comBoard);
	}
	

	@Override
	public List<CommunityBoard> selectBoardCa(CommunityBoard comBoard) {
	
		return mapper.selectBoardCa(comBoard);
	}

	/*@Override
	public List<CommunityBoard> selectBoard(CommunityBoard comBoard) {
		return mapper.selectBoard(comBoard);
	}
*/
	@Override
	public CommunityBoard detailBoard(int comNo) {
		mapper.updateBoardViewCnt(comNo);
		CommunityBoard comBoard = new CommunityBoard();
		comBoard = mapper.detailBoard(comNo);
		return comBoard;
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
		//댓글 갯수 카운트!
	@Override
	public int selectCommentCount(int comNo) {
		
		return mapper.selectCommentCount(comNo);
	}

	@Override
	public List<CommunityReComment> selectReComment(int comcNo) {

		return mapper.selectReComment(comcNo);
	}

	@Override
	public void insertReComment(CommunityReComment comReComment) {
		mapper.insertReComment(comReComment);
		
	}

	@Override
	public void deleteReComment(int comcReNo) {
		mapper.deleteReComment(comcReNo);
		
	}

	@Override
	public void updateReComment(CommunityReComment comReComment) {
		mapper.updateReComment(comReComment);
		
	}
	
	
	
	
	

}
