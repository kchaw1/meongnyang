package com.nmcat.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

@Controller
@RequestMapping("/mypage")
public class MyPageController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("list.mn")
	public void list(Model model, HttpSession session, Login login) {
		Member member = (Member)session.getAttribute("user");
		service.insertHistory(login.getId());
		
		
	}
	
	@RequestMapping("activity.mn")
	public void activity() {
		
	}
	
	@RequestMapping("edit.mn")
	public void edit() {}
	
	 // 비밀번호 수정
	 @RequestMapping("/updatePass.mn")
		public String updatePass(Member member, HttpSession session) {
			service.updatePass(member);
			session.invalidate();
			
			return "redirect:/member/login.mn";
	}
	
	@RequestMapping("point.mn")
	public void point() {}
	
	@RequestMapping("grade.mn")
	public void grade() {}
	
	@RequestMapping("abslist.mn")
	public void abslist(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		Member userFile = new Member();
		userFile.setId(member.getId());
	}
	
	@RequestMapping("absedit.mn")
	public void absedit() {}
	
	@RequestMapping("abscargr.mn")
	public void abscareer() {}
	
	@RequestMapping("abspoint.mn")
	public void abspoint() {}
	
	@RequestMapping("absactivity.mn")
	public void absactivity() {}
}
