package com.nmcat.main.service;

import java.util.List;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.Youtube;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.domain.board.DiaryBoard;

public interface MainService {
	//메인페이지 커뮤니티 최신글 5개 뿌려주기
		List<CommunityBoard> selectComBoardRegDate();
		List<DiaryBoard> selectDiaryBoardRegDate();
		
		// 유튜브 키워드별로 1개씩 가져오기
		List<Youtube> youtubeList();
		// 크라우드 펀딩 가장 임박한 2개 가져오기 
		List<Crowd> crowdList();
		// 공지사항 5개 가져오기
		List<Notice> noticeList();
		// 행동전문가 리스트 가져오기
		List<Member> absList();
}
