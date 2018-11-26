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
	
	/*
	// 행동전문가 리스트
	@RequestMapping("/abs/list")
	public void list(Model model) {
		// y = yes , n = no
		// rld = recent login date
		
//		System.out.println(service.recentLogin("bbbb"));
		
		List<Member> yList = service.list("y");
		List<Date> yRLDList = new ArrayList<>();
		
		List<Member> nList = service.list("n");
		List<Date> nRLDList = new ArrayList<>();
		
		for(Member m : yList) {
			yRLDList.add(service.recentLogin(m.getId()));
		}
		for(Member m : nList) {
			nRLDList.add(service.recentLogin(m.getId()));
		}
		
		model.addAttribute("yList", yList);
		model.addAttribute("yrldList", yRLDList);
		
		model.addAttribute("nList", nList);
		model.addAttribute("nrldList", nRLDList);
	}
	*/
	
	// 리스트 페이지 이동
	@RequestMapping("/abs/list")
	public void list() {}
	
	// 승인된 전문가 리스트
	@RequestMapping("/abs/printYList")
	@ResponseBody
	public Map<String, Object> printYList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = new Member();
		member.setPageNo(pageNo);
		member.setAuthState("y");
		
		List<Member> yList = service.list(member);
		List<Date> yRLDList = new ArrayList<>();
		
		int yListCount = yList.size();
		int lastPage = (int) Math.ceil(yListCount / 10d);
		
		for(Member m : yList) {
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			yRLDList.add(lh.getLoginDateTime());
		}
		
		map.put("yList", yList);
		map.put("yRLDList", yRLDList);
		//----------------------------------------------
		/*
		List<Member> nList = service.list("n");
		int nListCount = nList.size();
		List<Date> nRLDList = new ArrayList<>();
		
		
		for(Member m : nList) {
			LoginHistory lh = service.recentLogin(m.getId());

			if(lh==null) continue;
			
			nRLDList.add(lh.getLoginDateTime());
		}
		
		
		map.put("nList", nList);
		map.put("nRLDList", nRLDList);
		*/
		
		return map;
	}
	
	// 미승인 전문가 리스트
	@RequestMapping("/abs/printNList")
	@ResponseBody
	public Map<String, Object> printNList(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo) {
		Map<String, Object> map = new HashMap<>();
		
		Member member = new Member();
		member.setPageNo(pageNo);
		member.setAuthState("n");
		
		List<Member> nList = service.list(member);
		List<Date> nRLDList = new ArrayList<>();
		
		int nListCount = nList.size();
		int lastPage = (int) Math.ceil(nListCount / 10d);
		
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
		model.addAttribute("careerList", service.selectCareer(id));
	}
	
	// 전문가 승인
	@RequestMapping("/abs/approve")
	public String approve(int no) {
		service.authApprove(no);
		return "redirect:list.mn";
	}
}
