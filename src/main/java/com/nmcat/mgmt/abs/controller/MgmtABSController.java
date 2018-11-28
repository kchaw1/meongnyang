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
		
		Map<String, Object> map = new HashMap<>();
		
		Member member = new Member();
		member.setAuthState("y");
		
		List<Member> yList = null;
		switch(sort) {
			case 1:
				if(flag == 1) {
					yList = service.list(member);
				} else {
					yList = service.listDesc(member);
				}
				break;
			case 2:
				if(flag == 1) {
					yList = service.listById(member);
				} else {
					yList = service.listByIdDesc(member);
				}
				break;
			case 3:
				if(flag == 1) {
					yList = service.listByName(member);
				} else {
					yList = service.listByNameDesc(member);
				}
				break;
			case 4:
				if(flag == 1) {
					yList = service.listBySignUpDate(member);
				} else {
					yList = service.listBySignUpDateDesc(member);
				}
				break;
			case 5:
				// 최근접속시간순
				break;
			case 6:
				if(flag == 1) { 
					yList = service.listByScore(member);
				} else {
					yList = service.listByScoreDesc(member);
				}
				break;
			case 7:
				if(flag == 1) { 
					yList = service.listByPoint(member);
				} else {
					yList = service.listByPointDesc(member);
				}
				break;
		}
		List<Date> yRLDList = new ArrayList<>();
		
		int yListCount = yList.size();
//		int lastPage = (int) Math.ceil(yListCount / 10d);
		
		for(Member m : yList) {
//			System.out.println(m.getId());
//			System.out.println(m.getSignUpDate());
			
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
	public Map<String, Object> printNList(@RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		System.out.println("flag---------------------------------------------------" + flag);
		
		Map<String, Object> map = new HashMap<>();
		
		Member member = new Member();
		member.setAuthState("n");
		
		List<Member> nList = null;
		switch(sort) {
		case 1:
			if(flag == 1) {
				nList = service.list(member);
			} else {
				nList = service.listDesc(member);
			}
			break;
		case 2:
			if(flag == 1) {
				nList = service.listById(member);
			} else {
				nList = service.listByIdDesc(member);
			}
			break;
		case 3:
			if(flag == 1) {
				nList = service.listByName(member);
			} else {
				nList = service.listByNameDesc(member);
			}
			break;
		case 4:
			if(flag == 1) {
				nList = service.listBySignUpDate(member);
			} else {
				nList = service.listBySignUpDateDesc(member);
			}
			break;
		case 5:
			// 최근접속시간순
			break;
		case 6:
			if(flag == 1) { 
				nList = service.listByScore(member);
			} else {
				nList = service.listByScoreDesc(member);
			}
			break;
		case 7:
			if(flag == 1) { 
				nList = service.listByPoint(member);
			} else {
				nList = service.listByPointDesc(member);
			}
			break;
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
	
	// 승인전문가 검색
	@RequestMapping("/abs/ySearch")
	@ResponseBody
	public Map<String, Object> ySearch(String searchType, String keyword, @RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		MgmtSearch search= new MgmtSearch();
		search.setAuthState("y");		
		search.setKeyword(keyword);
		search.setSearchType(searchType);
		System.out.println("서치타입서치타입서치타입서치타입서치타입서치타입서치타입" + searchType);
		
		if(flag==1) { 
			search.setSortMethod("asc");
		} else {
			search.setSortMethod("desc");
		}
		
		Map<String, Object> map = new HashMap<>();
		
		List<Member> searchYList = null;
		switch(sort) {
			case 1:
				search.setSortColumn("no");
				searchYList = service.search(search);
				break;
			case 2:
				search.setSortColumn("id");
				searchYList = service.search(search);
				break;
			case 3:
				search.setSortColumn("name");
				searchYList = service.search(search);
				break;
			case 4:
				search.setSortColumn("sign_up_date");
				searchYList = service.search(search);
				break;
			case 5:
				// 최근접속시간순
				break;
			case 6:
				search.setSortColumn("score");
				searchYList = service.search(search);
				break;
			case 7:
				search.setSortColumn("point");
				searchYList = service.search(search);
				break;
		}
		List<Date> searchYRLDList = new ArrayList<>();
		
		int yListCount = searchYList.size();
//		int lastPage = (int) Math.ceil(yListCount / 10d);
		
		for(Member m : searchYList) {
//			System.out.println(m.getId());
//			System.out.println(m.getSignUpDate());
			
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			searchYRLDList.add(lh.getLoginDateTime());
		}
		
		map.put("searchYList", searchYList);
		map.put("searchYRLDList", searchYRLDList);
		
		return map;
	}
	
	// 미승인전문가 검색 
	@RequestMapping("/abs/nSearch")
	@ResponseBody
	public Map<String, Object> nSearch(String searchType, String keyword, @RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		MgmtSearch search= new MgmtSearch();
		search.setAuthState("n");		
		search.setKeyword(keyword);
		search.setSearchType(searchType);
		
		System.out.println("서치타입서치타입서치타입서치타입서치타입서치타입서치타입" + searchType);
		if(flag==1) { 
			search.setSortMethod("asc");
		} else {
			search.setSortMethod("desc");
		}
		
		Map<String, Object> map = new HashMap<>();
		
		List<Member> searchNList = null;
		switch(sort) {
			case 1:
				search.setSortColumn("no");
				searchNList = service.search(search);
				break;
			case 2:
				search.setSortColumn("id");
				searchNList = service.search(search);
				break;
			case 3:
				search.setSortColumn("name");
				searchNList = service.search(search);
				break;
			case 4:
				search.setSortColumn("sign_up_date");
				searchNList = service.search(search);
				break;
			case 5:
				// 최근접속시간순
				break;
			case 6:
				search.setSortColumn("score");
				searchNList = service.search(search);
				break;
			case 7:
				search.setSortColumn("point");
				searchNList = service.search(search);
				break;
		}
		List<Date> searchNRLDList = new ArrayList<>();
		
		int nListCount = searchNList.size();
//		int lastPage = (int) Math.ceil(yListCount / 10d);
		
		for(Member m : searchNList) {
			System.out.println(m.getId());
			System.out.println(m.getSignUpDate());
			
			LoginHistory lh = service.recentLogin(m.getId());
			
			if(lh==null) continue;
			
			searchNRLDList.add(lh.getLoginDateTime());
		}
		
		map.put("searchNList", searchNList);
		map.put("searchNRLDList", searchNRLDList);
		
		return map;
	}
}
