package com.nmcat.crowd.service;

import java.util.List;

import com.nmcat.repository.domain.Crowd;

public interface CrowdService {
	
	void write(Crowd crowd); // 크라우드 펀딩 작성
	List<Crowd> list(Crowd crowd); // 크라우드 펀딩 리스트
	Crowd detail(int crNo);
}
