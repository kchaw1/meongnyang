package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Member;

public interface FriendMapper {

	public List<Member> selectAllMembersOnePage(int begin);
	
	public int selectCntAllMembers();
	
	public List<Member> selectAllMembersOneLine(int lineBegin);
}
