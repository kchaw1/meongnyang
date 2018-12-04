package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Crowd;

public interface CrowdMapper {
	
	void insertCrowd(Crowd crowd); // 크라우드펀딩 작성
	List<Crowd> selectCrowdList(Crowd crowd); // 크라우드펀딩 리스트
	int selectCrowdListCount();
}
