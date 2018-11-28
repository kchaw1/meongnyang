package com.nmcat.mgmt.abs.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.mgmt.abs.service.MgmtABSService;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Page;

@RequestMapping("/admin")
@Controller
public class MgmtABSController {
	
	@Autowired
	private MgmtABSService service;
	
	// 리스트 페이지 이동
	@RequestMapping("/abs/list")
	public void list() {}
	
	// 승인된 전문가 리스트
	@RequestMapping("/abs/printYList")
	@ResponseBody
	public Map<String, Object> printYList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, @RequestParam(value = "sort", defaultValue = "1") int sort) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = new Member();
		member.setPageNo(pageNo);
		member.setAuthState("y");
		
		List<Member> yList = null;
		switch(sort) {
			case 1:
				yList = service.list(member);
				break;
			case 2:
				yList = service.listById(member);
				break;
			case 3:
				yList = service.listByName(member);
				break;
			case 4:
				yList = service.listBySignUpDate(member);
				break;
			case 5:
				yList = service.listByScore(member);
				break;
			case 6:
				yList = service.listByPoint(member);
		}
		List<Date> yRLDList = new ArrayList<>();
		
		int yListCount = yList.size();
//		int lastPage = (int) Math.ceil(yListCount / 10d);
		
		for(Member m : yList) {
			System.out.println(m.getId());
			System.out.println(m.getSignUpDate());
			
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			yRLDList.add(lh.getLoginDateTime());
		}
		
		map.put("yList", yList);
		map.put("yRLDList", yRLDList);
		
		return map;
	}
	
	// 미승인 전문가 리스트
	@RequestMapping("/abs/printNList")
	@ResponseBody
	public Map<String, Object> printNList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, @RequestParam(value = "sort", defaultValue = "1") int sort) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = new Member();
		member.setPageNo(pageNo);
		member.setAuthState("n");
		
		List<Member> nList = null;
		switch(sort) {
			case 1:
				nList = service.list(member);
				break;
			case 2:
				nList = service.listById(member);
				break;
			case 3:
				nList = service.listByName(member);
				break;
			case 4:
				nList = service.listBySignUpDate(member);
				break;
			case 5:
				nList = service.listByScore(member);
				break;
			case 6:
				nList = service.listByPoint(member);
		}
		List<Date> nRLDList = new ArrayList<>();
		
		int nListCount = nList.size();
//		int lastPage = (int) Math.ceil(nListCount / 10d);
		
		for(Member m : nList) {
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			nRLDList.add(lh.getLoginDateTime());
		}
		
		map.put("nList", nList);
		map.put("nRLDList", nRLDList);
		
		return map;
	}
	
	
	// 행동전문가 상세
	@RequestMapping("/abs/detail")
	public void detail(Model model, int no, String id) {
		model.addAttribute("abs", service.detail(no));
		model.addAttribute("myPosts", service.myPosts(id));
		model.addAttribute("myComments", service.myComments(id));
		model.addAttribute("careerList", service.selectCareer(id));
		model.addAttribute("licenseList", service.licenseName(id));
	}
	
	// 전문가 승인
	@RequestMapping("/abs/approve")
	public String approve(int no) {
		service.authApprove(no);
		return "redirect:list.mn";
	}
	
	// 전문가 탈퇴
	@RequestMapping("/abs/delete")
	public String delete(int no) {
		service.deleteMember(no);
		return "redirect:list.mn";
	}
	
	/*
	@RequestMapping("/abs/delete")
	@ResponseBody
	public void delete(int no) {
		service.deleteMember(no);
	}
	*/
	
	// 승인전문가 검색
	@RequestMapping("/abs/ySearch")
	@ResponseBody
	public Map<String, Object> ySearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, String name, String authState) {
		System.out.println("페이지번호" + pageNo);
		System.out.println("이름" + name);
		System.out.println("승인여부" + authState);
		
		Member member = new Member();
		member.setPageNo(pageNo);
		member.setAuthState(authState);
		member.setName(name);
		
		List<Member> yList = service.search(member);
		List<Date> yRLDList = new ArrayList<>();
		
		for(Member m : yList) {
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			yRLDList.add(lh.getLoginDateTime());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchYList", yList);
		map.put("searchYRLDList", yRLDList);
		
		return map;
	}
	
	// 미승인전문가 검색
	@RequestMapping("/abs/nSearch")
	@ResponseBody
	public Map<String, Object> nSearch(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, String name, String authState) {
		Member member = new Member();
		member.setPageNo(pageNo);
		member.setAuthState(authState);
		member.setName(name);
		
		List<Member> nList = service.search(member);
		List<Date> nRLDList = new ArrayList<>();
		
		for(Member m : nList) {
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			nRLDList.add(lh.getLoginDateTime());
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("searchNList", nList);
		map.put("searchNRLDList", nRLDList);
		
		return map;
	}
}
