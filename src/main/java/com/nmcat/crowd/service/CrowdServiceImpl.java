package com.nmcat.crowd.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.mapper.CrowdMapper;

@Service
public class CrowdServiceImpl implements CrowdService{

	@Autowired
	private CrowdMapper mapper;
	
	@Override
	public void write(Crowd crowd) {
		mapper.insertCrowd(crowd);
	}
	
	
}
