package com.nmcat.friend.controller;

import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.friend.service.FriendService;
import com.nmcat.repository.domain.Friend;

@Controller
@RequestMapping("/friend")
public class FriendController {

	@Autowired
	FriendService service;
	
	
	@RequestMapping("/friendlist.mn")
	public void showFriends () {}

	
	@RequestMapping("/memberlist.mn")
	@ResponseBody
	public Map<String, Object> showAllMembers(
			@RequestParam(value="pageNo", defaultValue = "1")int pageNo) {
		return service.showAllMembers(pageNo);
		
	}
	
	@PostMapping("/addfriend.mn")
	@ResponseBody
	public Map<String, Object> addFriend(Friend friend){
		friend.setCallDate(new Date());
		service.addFriend(friend);
		return null;
	}
	
	
	
} // end class
