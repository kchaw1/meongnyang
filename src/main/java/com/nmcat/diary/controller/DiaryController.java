package com.nmcat.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/diary")
@Controller
public class DiaryController {

	@RequestMapping("/writeform.mn")
	public void writeformDiary() {}
} //end class
