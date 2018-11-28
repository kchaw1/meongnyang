package com.nmcat.friend.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nmcat.repository.domain.Friend;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MemberPageResult;
import com.nmcat.repository.mapper.FriendMapper;

@Service
public class FriendServiceImpl implements FriendService{

	@Autowired
	FriendMapper mapper;
	
	@Override
	public Map<String, Object> showAllMembers(int pageNo) {
		Map<String, Object> map = new HashMap<>();
		Member m = new Member();
		int count = mapper.selectCntAllMembers();
		
		m.setPageNo(pageNo); //2
		int begin = m.getBegin(); //12 (2-1)*12
		
		MemberPageResult pageResult = new MemberPageResult(pageNo, count);
		int lineNo = pageResult.getPageLineNo();
		
		for(int i=1; i<=lineNo; i++) {
			map.put("list"+i, mapper.selectAllMembersOneLine(begin));
			begin += 4;
		}			
		map.put("lineNo", lineNo);
		map.put("pageResult", pageResult);
		
		return map;
	}

	@Override
	public void addFriend(Friend friend) {
		mapper.insertNewRequest(friend);
	}

}
