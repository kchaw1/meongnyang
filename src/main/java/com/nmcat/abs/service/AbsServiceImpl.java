package com.nmcat.abs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.mapper.AbsMapper;

@Service
public class AbsServiceImpl implements AbsService{

	@Autowired
	private AbsMapper absMapper;
	
	@Override
	public Map<String, Object> list(Abs abs) {
		
		Map<String,Object> map = new HashMap<>();
		List<Abs> abslist =  absMapper.selectAbsList(abs);
		 map.put("list", abslist);
		return map;	
	}

}
