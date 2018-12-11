package com.nmcat.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.admin.service.AdminService;
import com.nmcat.repository.domain.Member;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	// 메인
	@RequestMapping("/main.mn")
	public void adminMain(Model model) {
		for(Member m : service.newMemberList()) {
			System.out.println(m.getNo());
			System.out.println(m.getName());
			System.out.println(m.getSignUpDate());
		}
 		
		model.addAttribute("nonAuthABSList", service.nonAuthABSList()); // 미승인 전문가 리스트
		model.addAttribute("newMemberList", service.newMemberList()); // 신규회원 리스트
		
		model.addAttribute("boardCount", service.boardCount()); // 게시물수 		
		model.addAttribute("pointCount", service.pointCount()); // 포인트사용량 		
		model.addAttribute("visitorCount", service.visitorCount()); // 포인트사용량 		
		
	}
		
}

