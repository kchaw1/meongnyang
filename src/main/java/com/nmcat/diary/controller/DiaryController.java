package com.nmcat.diary.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.nmcat.diary.service.DiaryService;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	DiaryService service;
	
	
	@RequestMapping("/friend/calendar.mn")
	public void moveFriendsDiary() {}
	
	@RequestMapping("/share/sharediary.mn")
	public void listShareDiary(Model model, 
			@RequestParam(value="pageNo",defaultValue = "0")int begin) {
		model.addAttribute("list", service.listShareDiary(begin));
	}
	
} //end class
