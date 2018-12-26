package com.nmcat.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.admin.service.AdminService;
import com.nmcat.main.controller.MainController;
import com.nmcat.main.service.MainService;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Rank;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@Autowired
	private MainService mservice;
	
	// 메인
	@RequestMapping("/main.mn")
	public void adminMain(Model model) {
		
		model.addAttribute("nonAuthABSList", service.nonAuthABSList()); // 미승인 전문가 리스트
		model.addAttribute("newMemberList", service.newMemberList()); // 신규회원 리스트
		
		model.addAttribute("boardCount", service.boardCount()); // 게시물수 		
		model.addAttribute("pointCount", service.pointCount()); // 포인트사용량 		
		model.addAttribute("visitorCount", service.visitorCount()); // 포인트사용량	
		
		
		Rank rank = new Rank();
		rank.setMonth(MainController.getMonth());
		rank.setWeek(MainController.getWeek());
		
		model.addAttribute("absRankList", mservice.ABSRank(rank));
		model.addAttribute("generalRankList", mservice.generalRank(rank));
	}
		
}

