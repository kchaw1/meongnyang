package com.nmcat.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.main.service.MainService;

@Controller
@RequestMapping("/community")
public class MainController {
	@Autowired
	private MainService service;
	
	//메인페이지 커뮤니티 최신글 5개 뿌려주기
	@RequestMapping("/mainPage.mn")
	public void list(Model model) throws Exception{
		model.addAttribute("list", service.selectComBoardRegDate());
	}

}
