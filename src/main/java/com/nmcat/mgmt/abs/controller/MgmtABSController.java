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
import com.nmcat.repository.domain.MgmtSearch;

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
	public Map<String, Object> printYList(@RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		return listMethod(sort, flag, "y"); 
	}
	
	// 미승인 전문가 리스트
	@RequestMapping("/abs/printNList")
	@ResponseBody
	public Map<String, Object> printNList(@RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		return listMethod(sort, flag, "n"); 
	}
	
	// 승인전문가 검색 리스트
	@RequestMapping("/abs/ySearch")
	@ResponseBody
	public Map<String, Object> ySearch(String searchType, String keyword, @RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		return searchListMethod(searchType, keyword, sort, flag, "y");
	}
	// 미승인전문가 검색 리스트 
	@RequestMapping("/abs/nSearch")
	@ResponseBody
	public Map<String, Object> nSearch(String searchType, String keyword, @RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		return searchListMethod(searchType, keyword, sort, flag, "n");
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
	@ResponseBody
	public void approve(int no) {
		System.out.println(no);
		service.authApprove(no);
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

/* --------------------------------------- 일반메소드 --------------------------------------- */
	// 리스트
	public Map<String, Object> listMethod(int sort, int flag, String auth) {
		Map<String, Object> map = new HashMap<>();
		Member member = new Member();
		List<Member> list = null;
		List<LoginHistory> rldList = new ArrayList<>();
		
		member.setAuthState(auth); // y값 n 값
		
		switch(sort) {
			case 1:
				if(flag == 1) {
					list = service.list(member);
				} else {
					list = service.listDesc(member);
				}
				break;
			case 2:
				if(flag == 1) {
					list = service.listById(member);
				} else {
					list = service.listByIdDesc(member);
				}
				break;
			case 3:
				if(flag == 1) {
					list = service.listByName(member);
				} else {
					list = service.listByNameDesc(member);
				}
				break;
			case 4:
				if(flag == 1) {
					list = service.listBySignUpDate(member);
				} else {
					list = service.listBySignUpDateDesc(member);
				}
				break;
			case 5:
				// 최근접속시간순
				break;
			case 6:
				if(flag == 1) { 
					list = service.listByScore(member);
				} else {
					list = service.listByScoreDesc(member);
				}
				break;
			case 7:
				if(flag == 1) { 
					list = service.listByPoint(member);
				} else {
					list = service.listByPointDesc(member);
				}
				break;
		}
		
		for(Member m : list) {
			LoginHistory lh = new LoginHistory();
			
			Date recentLoginDate = service.recentLogin(m.getId());
			lh.setLoginDateTime(recentLoginDate);
			
			rldList.add(lh);
		}
		
		if (auth=="y") {
			map.put("yList", list);
			map.put("yRLDList",  rldList);
		} else {
			map.put("nList", list);
			map.put("nRLDList",  rldList);
		}
		return map;
	}
	
	// 검색결과 리스트
	public Map<String, Object> searchListMethod(String searchType, String keyword, int sort, int flag, String auth) {
		Map<String, Object> map = new HashMap<>();
		MgmtSearch search= new MgmtSearch();		
		List<Member> searchList = null;
		List<LoginHistory> searchRLDList = new ArrayList<>();
		
		search.setKeyword(keyword);
		search.setSearchType(searchType);
		if (auth == "y") {
			search.setAuthState("y");					
		} else {
			search.setAuthState("n");
		}
		if(flag==1) { 
			search.setSortMethod("asc");
		} else {
			search.setSortMethod("desc");
		}
		
		switch(sort) {
			case 1:
				search.setSortColumn("no");
				break;
			case 2:
				search.setSortColumn("id");
				break;
			case 3:
				search.setSortColumn("name");
				break;
			case 4:
				search.setSortColumn("sign_up_date");
				break;
			case 5:
				// 최근접속시간순
				break;
			case 6:
				search.setSortColumn("score");
				break;
			case 7:
				search.setSortColumn("point");
				break;
		}
		searchList = service.search(search);
		
		for(Member m : searchList) {
			LoginHistory lh = new LoginHistory();
			
			Date recentLoginDate = service.recentLogin(m.getId());
			lh.setLoginDateTime(recentLoginDate);
			
			searchRLDList.add(lh);
		}
		
		if (auth == "y") {
			map.put("searchYList", searchList);
			map.put("searchYRLDList", searchRLDList);
		} else {
			map.put("searchNList", searchList);
			map.put("searchNRLDList", searchRLDList);
		}

		return map;
	}
} // end class


