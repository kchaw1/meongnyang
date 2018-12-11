package com.nmcat.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	private AdminMapper mapper;
	
	// 미승인 전문가 리스트
	@Override
	public List<Member> nonAuthABSList() {
		return mapper.selectNonAuthABSList();
	}
	
	// 신규회원 리스트
	@Override
	public List<Member> newMemberList() {
		return mapper.selectNewMemberList();
	}
	
	// 게시물수
	@Override
	public int boardCount() {
		return mapper.selectBoardCount();
	}
	
	// 포인트수
	@Override
	public int pointCount() {
		return mapper.selectPointCount();
	}
	
	// 방문자수
	@Override
	public int visitorCount() {
		return mapper.selectVisitorCount();
	}

}
