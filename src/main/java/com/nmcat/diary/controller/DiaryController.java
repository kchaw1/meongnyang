package com.nmcat.diary.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.nmcat.diary.service.DiaryService;
import com.nmcat.repository.domain.board.DiaryBoard;

@RequestMapping("/diary")
@Controller
public class DiaryController {

	@Autowired
	private DiaryService service;
	
	@RequestMapping("/writeform.mn")
	public void mainDiary() {}
	
	@PostMapping("/write.mn")
	@ResponseBody
	public Map<String, Integer> writeNewDiary (DiaryBoard diary) {
//		System.out.println(diary);
		diary.setDrRegDateTime(new Date());
		diary.setDrWriter("victory");
		System.out.println(diary);
		//service.writeNewDiary(diary);
		String yearmonth = diary.getDrDate().substring(0,6);
		return service.list(yearmonth);
		//return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "writeform.mn";
	}
	
	@RequestMapping("/listall.mn")
	@ResponseBody
	public Map<String, Integer> listAll(String today) {
		String yearmonth = today.substring(0, today.length()-2);
		System.out.println("yearmonth: " +yearmonth);
		Map<String, Integer> map = service.list(yearmonth);
		System.out.println("map: " + map);
		return map;
	}
	
	
} //end class
