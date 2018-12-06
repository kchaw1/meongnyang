package com.nmcat.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/diary/friend")
public class DiaryController {

	@RequestMapping("/calendar.mn")
	public void moveFriendsDiary() {}
	
} //end class
