package com.nmcat.diary.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.nmcat.diary.service.DiaryService;
import com.nmcat.repository.domain.board.DiaryBoard;

@RequestMapping("/diary")
@RestController
public class DiaryRestController {

	@Autowired
	private DiaryService service;
	
//	@RequestMapping("/writeform.mn")
//	public void mainDiary() {}
	
	@PostMapping("/write.mn")
	public Map<String, Object> writeNewDiary (DiaryBoard diary) {
//		System.out.println(diary);
		diary.setDrRegDateTime(new Date());
//		diary.setDrWriter("victory");
		//System.out.println(diary);
		service.writeNewDiary(diary);
		String yearmonth = diary.getDrDate().substring(0,6);
		return service.list(yearmonth);
		//return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "writeform.mn";
	}
	
	@RequestMapping("/listall.mn")
	public Map<String, Object> listAll(String today) {
		String yearmonth = today.substring(0, today.length()-2);
		//System.out.println("yearmonth: " +yearmonth);
		Map<String, Object> map = service.list(yearmonth);
		//System.out.println("map: " + map);
		return map;
	}
	
	@PostMapping("/detail.mn")
	public List<DiaryBoard> detailDiary(String date) {
		List<DiaryBoard> list = service.detailDiary(date);
		return list;
	}
	
	@PostMapping("/delete.mn")
	public Map<String, Object> deleteDiary(DiaryBoard diary){
		return service.deleteDiary(diary);
	}
	
	@PostMapping("/updateform.mn")
	public DiaryBoard updateformDiary(int drNo) {
		return service.updateformDiary(drNo);
	}
	
	@PostMapping("/update.mn")
	public List<DiaryBoard> updateDiary(DiaryBoard diary) {
		return service.updateDiary(diary);
	}
	
	
} //end class
