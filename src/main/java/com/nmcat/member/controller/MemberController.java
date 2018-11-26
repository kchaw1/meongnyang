package com.nmcat.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/signup.mn")
	public String signup(Member member) {
		service.signup(member);
		return "redirect:/member/login.mn";
	} // 회원가입
	
	@PostMapping("/checkid.mn")
	@ResponseBody
	public boolean checkId(String id) {
		return service.checkId(id);
	} // id check
	
	
	
/*	@RequestMapping("/login.mn")
	@ResponseBody
	public boolean login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		System.out.println("loginpass : " + login.getPass());
		if(member != null) {
			session.setAttribute("user", member);
			return true;
		}
		return false;
	} // 로그인
*/	
	@RequestMapping("/login.mn")
	public void login() {}
	
	@PostMapping("/loginform.mn")
	@ResponseBody
	public boolean login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		System.out.println("loginpass : " + login.getPass());
		if(member != null) {
			session.setAttribute("user", member);
			return true;
		}
		return false;
	} // 로그인
	
	
	
	@RequestMapping("/logout.mn")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/member/login.mn";
	} // 로그아웃
}
