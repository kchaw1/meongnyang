package com.nmcat.blacklist.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Blacklist;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MemberPageResult;
import com.nmcat.repository.mapper.BlackListMapper;

@Service
public class BlackListServiceImpl implements BlackListService{

	@Autowired
	BlackListMapper mapper;

	@Override
	public void blockUser(Blacklist black) {
		black.setBlackDate(new Date());
		black.setBlackState("y");
		mapper.insertNewBlackList(black);
	}

	@Override
	public Map<String, Object> showAllBlackList(Blacklist black) {
		Map<String, Object> map = new HashMap<>();
		Member m = new Member();
		int count = mapper.selectBlackListCnt(black.getBlackFromId());
		int begin = black.getBegin();
		
		MemberPageResult pageResult = new MemberPageResult(black.getPageNo(), count);
		int lineNo = pageResult.getPageLineNo();
		
		for(int i=1; i<=lineNo; i++) {
			black.setLineBegin(begin);
			List<String> list = mapper.selectBlackListIdByOneLine(black);
			
			m.setBlackIdList(list);
			map.put("list"+i, mapper.selectBlackInfoByIdList(m));
			begin += 4;
		}
		map.put("lineNo", lineNo);
		map.put("pageResult", pageResult);
		
		return map;
	}
}
