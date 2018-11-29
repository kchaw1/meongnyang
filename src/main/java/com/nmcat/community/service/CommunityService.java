package com.nmcat.community.service;

import java.util.List;

import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityService {
		// 게시판 CRUD
		List<CommunityBoard> selectBoard();
	/*	List<CommunityBoard> selectBoard(CommunityBoard comBoard);*/
		CommunityBoard detailBoard(int comNo);
		void insertBoard(CommunityBoard comBoard);
		void deleteBoard(int comNo);
		void updateBoard(CommunityBoard comBoard);
	
		int selectBoardCount();
		
		// 댓글 CRUD
		List<CommunityComment> selectComment(int comNo);
		void insertComment(CommunityComment comComment);
		void deleteComment(int comcNo);
		void updateComment(CommunityComment comComment);
		int selectCommentCount(int comNo);
		

}
