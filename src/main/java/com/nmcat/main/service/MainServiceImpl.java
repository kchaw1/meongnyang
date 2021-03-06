package com.nmcat.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.Rank;
import com.nmcat.repository.domain.Youtube;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.mapper.MainMapper;

@Service
public class MainServiceImpl implements MainService{
	@Autowired
	private MainMapper mapper;

	@Override
	public List<CommunityBoard> selectComBoardRegDate() {
		return mapper.selectComBoardRegDate();
	}

	@Override
	public List<DiaryBoard> selectDiaryBoardRegDate() {
		return mapper.selectDiaryBoardRegDate();
	} 
	
	// 유튜브 리스트
	@Override
	public List<Youtube> youtubeList() {
		return mapper.selectYoutubeInfo();
	}
	
	// 크라우드펀딩 리스트
	@Override
	public List<Crowd> crowdList() {
		return mapper.selectCrowdInfo();
	}
	
	// 공지사항 리스트
	@Override
	public List<Notice> noticeList() {
		return mapper.selectNoticeList();
	}
	
	// 행동전문가 리스트
	@Override
	public List<Member> absList() {
		return mapper.selectABSList();
	}
	
	// 일반회원 랭킹
	@Override
	public List<Rank> generalRank(Rank rank) {
		return mapper.selectGeneralMemberRank(rank);
	}
	// 행동전문가 랭킹
	@Override
	public List<Rank> ABSRank(Rank rank) {
		return mapper.selectABSMemberRank(rank);
	}
}
