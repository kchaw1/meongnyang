package com.nmcat.crowd.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.mapper.CrowdMapper;

@Service
public class CrowdServiceImpl implements CrowdService{

	@Autowired
	private CrowdMapper mapper;
	
	// 크라우드 펀딩 작성
	@Override
	public void write(Crowd crowd) {
		mapper.insertCrowd(crowd);
	}
	
	// 크라우드 펀딩 리스트
	@Override
	public List<Crowd> list(Crowd crowd) {
		return mapper.selectCrowdList(crowd);
	}
	
	// 크라우드 펀딩 디테일
	@Override
	public Crowd detail(int crNo) {
		return mapper.selectCrowdDetail(crNo);
	}
		
}
