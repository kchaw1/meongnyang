package com.nmcat.mgmt.general.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.mapper.MgmtGeneralMapper;

@Service
public class MgmtGeneralServiceImpl implements MgmtGeneralService{
	
	@Autowired
	private MgmtGeneralMapper mapper;

}
