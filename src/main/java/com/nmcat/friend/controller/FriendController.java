package com.nmcat.friend.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/friend")
public class FriendController {

	@RequestMapping("/friendlist.mn")
	public void showFriends () {}

} // end class
