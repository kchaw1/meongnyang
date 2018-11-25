package com.nmcat.community.service;

import java.util.List;

import com.nmcat.repository.domain.board.CommunityBoard;

public interface CommunityService {
		//커뮤니티 CRUD
		//커뮤니티 무한스크롤 전체목록 가져오기
		List<CommunityBoard> selectBoard();
		
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
		

}
