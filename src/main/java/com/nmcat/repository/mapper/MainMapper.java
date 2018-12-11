package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.domain.board.DiaryBoard;

public interface MainMapper {
	
	//메인페이지 커뮤니티 최신글 5개 뿌려주기
	List<CommunityBoard> selectComBoardRegDate();
	List<DiaryBoard> selectDiaryBoardRegDate();
}
