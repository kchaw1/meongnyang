package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.ComSearchVO;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityMapper {
	//커뮤니티 무한스크롤 전체카테고리목록 가져오기 +페이징 + 카테고리 필터링
	List<CommunityBoard> selectBoard(CommunityBoard comBoard);
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
	
	//파일 등록
	void insertBoardFile(CommunityFile file);
	
	
	//--------------------------------------------------------------------------------
	// 댓글 CRUD
	List<CommunityComment> selectComment(int comNo);
	void insertComment(CommunityComment comComment);
	void deleteComment(int comcNo);
	void updateComment(CommunityComment comComment);
	int selectCommentCount(int comNo);
	
	
	

}
