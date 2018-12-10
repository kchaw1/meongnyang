package com.nmcat.diary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("/share/showdetail.mn")
	@ResponseBody
	public Map<String, Object> showDetailDiary(int drNo){
		return service.showDetailDiary(drNo);
	}
	
} //end class
