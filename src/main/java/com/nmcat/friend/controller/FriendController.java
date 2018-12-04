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
import com.nmcat.repository.domain.FriendList;

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
	
	@PostMapping("/requestfriend.mn")
	@ResponseBody
	public Map<String, Object> requestFriend(Friend friend){
		friend.setCallDate(new Date());
		service.requestFriend(friend);
		return null;
	}
	
	@PostMapping("/answer.mn")
	@ResponseBody
	public void answerRequest(Friend friend) {
		service.answerRequest(friend);
	}
	
	@PostMapping("/selectrequest.mn")
	@ResponseBody
	public Map<String, Object> selectFriendRequest(String calleeId) {
		return service.selectFriendRequest(calleeId);
	}
	
	@PostMapping("/showallfriend.mn")
	@ResponseBody
	public Map<String, Object> showAllFriends(Friend friend) {
		//System.out.println("friend:" + friend);
		return service.showAllFriends(friend);
	} // 
	
	
	
	
	
} // end class
