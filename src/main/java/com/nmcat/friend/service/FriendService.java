package com.nmcat.friend.service;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.Friend;
import com.nmcat.repository.domain.Member;

public interface FriendService {

	Map<String, Object> showAllMembers(int PageNo);

	void addFriend(Friend friend);

}
