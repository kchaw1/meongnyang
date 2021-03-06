package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.Rank;
import com.nmcat.repository.domain.Youtube;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.domain.board.DiaryBoard;

public interface MainMapper {
	
	//메인페이지 커뮤니티 최신글 5개 뿌려주기
	List<CommunityBoard> selectComBoardRegDate();
	List<DiaryBoard> selectDiaryBoardRegDate();
	
	// 유튜브 리스트
	List<Youtube> selectYoutubeInfo();
	// 크라우드펀딩
	List<Crowd> selectCrowdInfo();
	// 공지사항
	List<Notice> selectNoticeList();
	// 행동전문가 슬라이드
	List<Member> selectABSList();
	// 일반회원 랭킹
	List<Rank> selectGeneralMemberRank(Rank rank);
	// 행동전문가 랭킹
	List<Rank> selectABSMemberRank(Rank rank);
}
