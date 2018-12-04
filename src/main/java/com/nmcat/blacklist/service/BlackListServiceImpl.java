package com.nmcat.blacklist.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.mapper.BlackListMapper;

@Service
public class BlackListServiceImpl implements BlackListService{

	@Autowired
	BlackListMapper mapper;
}
