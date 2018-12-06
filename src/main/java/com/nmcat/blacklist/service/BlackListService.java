package com.nmcat.blacklist.service;

import java.util.List;
import java.util.Map;

import com.nmcat.repository.domain.Blacklist;
import com.nmcat.repository.domain.Friend;
import com.nmcat.repository.domain.FriendList;
import com.nmcat.repository.domain.Member;

public interface BlackListService {

	void blockUser(Blacklist black);

	Map<String, Object> showAllBlackList(Blacklist black);

	

}
