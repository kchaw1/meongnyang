package com.nmcat.abs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.board.QnABoard;
import com.nmcat.repository.mapper.AbsMapper;

@Service
public class AbsServiceImpl implements AbsService{

	@Autowired
	private AbsMapper absMapper;
	
	@Override
	public Map<String, Object> list(Abs abs) {
		
		Map<String,Object> map = new HashMap<>();
		List<Abs> abslist =  absMapper.selectAbsList(abs);
		System.out.println(abslist);
		 map.put("list", abslist);
		return map;	
	}

	@Override
	public Map<String, Object> detail(int no) {
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);

		map.put("b",detail);
		return map;
	}
	
	@Override
	public Map<String, Object> detailIntro(int no) {
		Map<String, Object> map = new HashMap<>();
		
		Abs detail = absMapper.selectAbsDetail(no);
		System.out.println(detail);
		map.put("b",detail);
		return map;
	}

	@Override
	public Map<String, Object> absboardlist(int no) {
		Map<String, Object> map = new HashMap<>();

		System.out.println(no);
		List<QnABoard> list = absMapper.selectAbsBoard(no);
		System.out.println("뭘까용"+list);
		map.put("b", list);
		return map;
		
	}




}
