package com.nmcat.mgmt.abs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.board.CommunityBoard;
import com.nmcat.repository.mapper.MgmtABSMapper;

@Service
public class MgmtABSServiceImpl implements MgmtABSService{
	
	@Autowired
	private MgmtABSMapper mapper;
	
	// 행동전문가 리스트
	@Override
	public List<Member> list(Member member) {
		return mapper.selectABSList(member);
	}
//	@Override
//	public List<Member> list(String auth) {
//		return mapper.selectABSList(auth);
//	}
	
	// 최근접속일
	@Override
	public LoginHistory recentLogin(String id) {
		return mapper.selectRecentLogin(id);
	}
	
	// 디테일
	@Override
	public Member detail(int no) {
		return mapper.selectABSDetail(no);
	}
	
	// 내가 쓴 게시글
	@Override
	public List<CommunityBoard> myPosts(String id) {
		return mapper.selectBoardById(id);
	}
	
	// 승인
	@Override
	public void authApprove(int no) {
		mapper.authApprove(no);
	}
	
	// 경력조회
	@Override
	public List<Career> selectCareer(String id) {
		return mapper.selectCareerById(id);
	}

}
