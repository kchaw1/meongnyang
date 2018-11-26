package com.nmcat.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Member;

@RequestMapping("/member")
@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/login.mn")
	public void login() {}
	
	@RequestMapping("/signup.mn")
	public String signup(Member member) {
		service.signup(member);
		return "redirect:/member/login.mn";
	}
	
	@PostMapping("/checkid.mn")
	@ResponseBody
	public boolean checkId(String id) {
		return service.checkId(id);
	}
}
