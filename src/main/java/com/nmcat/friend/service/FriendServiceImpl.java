package com.nmcat.friend.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
		
		System.out.println(mapper.selectAllMembersOneLine(begin).toString());
		for(int i=1; i<=lineNo; i++) {
			map.put("list"+i, mapper.selectAllMembersOneLine(begin));
			begin += 4;
		}			
		map.put("lineNo", lineNo);
		map.put("pageResult", pageResult);
		
		return map;
	}

	@Override
	public void requestFriend(Friend friend) {
		mapper.insertNewRequest(friend);
	}

	@Override
	public void answerRequest(Friend friend) {
		friend.setAnswerDate(new Date());
		mapper.updateFirstAnswer(friend);
	}

	@Override
	public Map<String, Object> selectFriendRequest(String calleeId) {
		Map<String, Object> map = new HashMap<>();
		map.put("count", mapper.selectRequestCnt(calleeId));
		map.put("callerList", mapper.selectCallerList(calleeId));
		return map;
		
	}

	@Override
	public Map<String, Object> showAllFriends(Friend friend) {
		Map<String, Object> map = new HashMap<>();
		Member m = new Member();
		int count = mapper.selectAllFriendsList(friend.getUserId()).size();
		System.out.println("count: " + count);
		int begin = friend.getBegin(); //12 (2-1)*12
		
		MemberPageResult pageResult = new MemberPageResult(friend.getPageNo(), count);
		//System.out.println("pageResult: " + pageResult.toString());
		int lineNo = pageResult.getPageLineNo();
		
		for(int i=1; i<=lineNo; i++) {
			friend.setLineBegin(begin);
			List<String> list = mapper.selectAllFriendsOneLine(friend);
			
			m.setFriendIdList(list);
			System.out.println("친구 리스트 : " +mapper.selectFriendInfoByIdList(m));
			map.put("list"+i, mapper.selectFriendInfoByIdList(m));
			begin += 4;
		}			
		map.put("lineNo", lineNo);
		map.put("pageResult", pageResult);
		
		return map;
	}

}
