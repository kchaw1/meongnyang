package com.nmcat.repository.mapper;

import java.util.List;

import com.nmcat.repository.domain.Friend;
import com.nmcat.repository.domain.FriendList;
import com.nmcat.repository.domain.Member;

public interface FriendMapper {

	public List<Member> selectAllMembersOnePage(int begin);
	
	public int selectCntAllMembers();
	
	public List<Member> selectAllMembersOneLine(int lineBegin);
	
	public void insertNewRequest(Friend friend);
	
	public void updateFirstAnswer(Friend friend);
	
	public int selectRequestCnt(String calleeId);
	
	public List<String> selectCallerList(String calleeId);
	
	public List<String> selectAllFriendsList(String userId);
	
	public List<Friend> selectFriendsListOnePage(Friend friend);

	public List<String> selectAllFriendsIdByOneLine(Friend friend);
	
	public List<Member> selectFriendInfoByIdList(Member m);
	
}
