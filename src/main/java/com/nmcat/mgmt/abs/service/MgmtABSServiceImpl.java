package com.nmcat.mgmt.abs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Member;
import com.nmcat.repository.mapper.MgmtABSMapper;

@Service
public class MgmtABSServiceImpl implements MgmtABSService{
	
	@Autowired
	private MgmtABSMapper mapper;
	
	@Override
	public List<Member> list() {
		return mapper.selectABSList();
	}

}
