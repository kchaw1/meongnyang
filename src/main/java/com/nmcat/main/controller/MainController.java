package com.nmcat.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.main.service.MainService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService service;
	
	//메인페이지 커뮤니티 최신글 5개 뿌려주기
	@RequestMapping("/mainPage.mn")
	public void list(Model model) throws Exception{
		// 최신 커뮤니티 게시글
		model.addAttribute("list", service.selectComBoardRegDate());
		// 최신 전체공개 다이어리 게시글
		model.addAttribute("list2", service.selectDiaryBoardRegDate());
		// 유튜브 리스트
		model.addAttribute("youtubeList", service.youtubeList());
		// 크라우드 펀딩 리스트
		model.addAttribute("crowdList", service.crowdList());
	}

}
