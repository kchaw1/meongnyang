package com.nmcat.community.service;

import java.util.List;

import com.nmcat.repository.domain.ComSearchVO;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.CommunityReComment;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityService {
		// 게시판 CRUD
	    //커뮤니티 무한스크롤 전체카테고리목록 가져오기 +페이징 
		List<CommunityBoard> selectBoard(CommunityBoard comBoard);
		//커뮤니티 무한스크롤 전체카테고리목록 가져오기 +카테고리
		List<CommunityBoard> selectBoardCa(CommunityBoard comBoard);
		
		List<CommunityBoard> selectBoardC(CommunityBoard comBoard);
		
		
	
		//전체보기 - 페이징을위함!(pageNo를 받아야해서 CommunityBoard를 매개변수로)
		//List<CommunityBoard> selectBoard(CommunityBoard comBoard, );
		CommunityBoard detailBoard(int comNo);
		void insertBoard(CommunityBoard comBoard, CommunityFile file);
		void deleteBoard(int comNo);
		void updateBoard(CommunityBoard comBoard);
	
		int selectBoardCount();
		void insertBoardFile(CommunityFile file);
	
		
		// 댓글 CRUD
		List<CommunityComment> selectComment(int comNo);
		void insertComment(CommunityComment comComment);
		void deleteComment(int comcNo);
		void updateComment(CommunityComment comComment);
		
		int selectCommentCount(int comNo);
		//대댓글 CRUD
		List<CommunityReComment> selectReComment(int comcNo);
		void insertReComment(CommunityReComment comReComment);
		void deleteReComment(int comcReNo);
		void updateReComment(CommunityReComment comReComment);
		

}
