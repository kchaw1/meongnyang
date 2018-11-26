package com.nmcat.abs.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.mapper.AbsMapper;

public class AbsServiceImpl implements AbsService{

	@Autowired
	private AbsMapper absMapper;
	
	@Override
	public Map<String, Object> selectAbsList(int type) {
		
		Map<String,Object> map = new HashMap<>();
		Abs board =  absMapper.selectAbsList(type);
		 map.put("map", board);
		return null;
		 
	}

}
