package com.nmcat.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.member.service.MemberService;

@Controller
@RequestMapping("/member")
public class MyPageController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("MyPage.mn")
	public void myPage() {}
	
	@RequestMapping("activity.mn")
	public void activity() {}
	
	@RequestMapping("myboardcomn.mn")
	public void mybcmn() {}
	
	@RequestMapping("mygrade.mn")
	public void mygrade() {}
	
}
