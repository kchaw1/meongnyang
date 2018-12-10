package com.nmcat.diary.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.diary.service.DiaryService;
import com.nmcat.repository.domain.board.DiaryBoard;

@Controller
@RequestMapping("/diary")
public class DiaryController {

	@Autowired
	DiaryService service;
	
	
	@RequestMapping("/friend/calendar.mn")
	public void moveFriendsDiary() {}
	
	@RequestMapping("/share/sharediary.mn")
	public void listShareDiary(Model model, DiaryBoard diary) {
		model.addAttribute("list1", service.listShareDiary(diary.getBegin()));
		model.addAttribute("list2", service.listShareAndFriendDiary(diary));
	}
	
	@RequestMapping("/share/plusdiary.mn")
	@ResponseBody
	public Map<String, Object> pagePlusDiary(DiaryBoard diary) {
		return service.pagePlusDiary(diary);
	}
	
	@RequestMapping("/share/showdetail.mn")
	@ResponseBody
	public Map<String, Object> showDetailDiary(int drNo){
		return service.showDetailDiary(drNo);
	}
	
} //end class
