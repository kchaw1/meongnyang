package com.nmcat.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
import com.nmcat.repository.domain.CommunityRef;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.CommunityMapper;
import com.nmcat.repository.mapper.ScoreMapper;


@Service
public class CommunityServiceImpl implements CommunityService{
	@Autowired
	private CommunityMapper mapper;
	private ScoreMapper scoreMapper;
	
	//而ㅵ뜝�듅�뙋�삕�떚 CRUD
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
	public List<CommunityBoard> selectGaToWriter(CommunityBoard comBoard) {
		return mapper.selectGaToWriter(comBoard);
	}

	// 여기에 활동점수 추가~
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
	
	
	
	
	
	
	
// 여기에 활동점수 추가~
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
		//占쎈솊疫뀐옙 揶쏉옙占쎈땾 燁삳똻�뒲占쎈뱜!
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

	@Override
	public int selectRefCnt(int comNo) {
		return mapper.selectRefCnt(comNo);
		
	}

	@Override
	public void insertRef(CommunityRef comRef) {
		mapper.insertRef(comRef);
		
	}

	@Override
	public void deleteRef(CommunityRef comRef) {
		mapper.deleteRef(comRef);
		
	}

	@Override
	public int checkRef(CommunityRef comRef) {
		return mapper.checkRef(comRef);
		
	}

	@Override
	public List<CommunityBoard> selectGa() {
		return mapper.selectGa();
	}
	
	

	
	

}
