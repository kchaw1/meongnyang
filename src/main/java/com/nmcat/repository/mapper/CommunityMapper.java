package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
import com.nmcat.repository.domain.CommunityRef;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityMapper {
	//커뮤니티 무한스크롤 전체카테고리목록 가져오기 +페이징
	List<CommunityBoard> selectBoard(CommunityBoard comBoard);
	//커뮤니티 무한스크롤 전체카테고리 목록 가져오기 + 카테고리
	List<CommunityBoard> selectBoardCa(CommunityBoard comBoard);
	
	//카테고리
	List<CommunityBoard> selectBoardC(CommunityBoard comBoard);
	//커뮤니티 무한스크롤 전체카테고리목록 가져오기 +페이징
	//List<CommunityBoard> selectBoard(CommunityBoard comBoard)
	//List<CommunityBoard> selectBoard();
	//상세보기
	CommunityBoard detailBoard(int comNo);
	
	//커뮤니티 글 등록
	void insertBoard(CommunityBoard comBoard);
	
	//커뮤니티 글 삭제
	void deleteBoard(int comNo);
	
	//커뮤니티 글 수정
	void updateBoard(CommunityBoard comBoard);
	
	// 커뮤니티 전체 글 갯수
	int selectBoardCount();
	int updateBoardViewCnt(int comNo);
	
	//파일 등록
	void insertBoardFile(CommunityFile file);
	//댓글 전체갯수
	int selectCommentCount(int comNo);
	
	//--------------------------------------------------------------------------------
	// 댓글 CRUD
	List<CommunityComment> selectComment(int comNo);
	void insertComment(CommunityComment comComment);
	void deleteComment(int comcNo);
	void updateComment(CommunityComment comComment);
	// 대댓글 CRUD
	List<CommunityReComment> selectReComment(int comcNo);
	void insertReComment(CommunityReComment comReComment);
	void deleteReComment(int comcReNo);
	void updateReComment(CommunityReComment comReComment);
	//추천
	int selectRefCnt(int comNo);
	void insertRef(CommunityRef comRef);
	void deleteRef(CommunityRef comRef);
	
	
	
	
	
	
	

}
