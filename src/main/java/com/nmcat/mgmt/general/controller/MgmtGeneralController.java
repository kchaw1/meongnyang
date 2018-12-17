package com.nmcat.mgmt.general.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.mgmt.general.service.MgmtGeneralService;
import com.nmcat.point.serivce.PointService;
import com.nmcat.repository.domain.LoginHistory;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.MgmtSearch;
import com.nmcat.repository.domain.PointPlus;

@RequestMapping("/admin")
@Controller
public class MgmtGeneralController {
	
	@Autowired
	private MgmtGeneralService service;
	
	@Autowired
	private PointService pService;

	// 리스트 페이지 이동
	@RequestMapping("/general/list")
	void list() {}
	
	// 일반회원 리스트
	@RequestMapping("/general/printGeneralList")
	@ResponseBody
	public Map<String, Object> printGeneralList(@RequestParam(value = "sort", defaultValue = "1") int sort, int flag) {
		Map<String, Object> map = new HashMap<>();
		List<Member> list = null;
		
		switch(sort) {
			case 1:
				if(flag == 1) {
					list = service.generalMemberList();
				} else {
					list = service.generalMemberListDesc();
				}
				break;
			case 2:
				if(flag == 1) {
					list = service.generalMemberListById();
				} else {
					list = service.generalMemberListByIdDesc();
				}
				break;
			case 3:
				if(flag == 1) {
					list = service.generalMemberListByName();
				} else {
					list = service.generalMemberListByNameDesc();
				}
				break;
			case 4:
				if(flag == 1) {
					list = service.generalMemberListBySignUpDate();
				} else {
					list = service.generalMemberListBySignUpDateDesc();
				}
				break;
			case 5:
				if(flag == 1) {
					list = service.generalMemberListByRecentLoginDate();
				} else {
					list = service.generalMemberListByRecentLoginDateDesc();
				}
				break;
			case 6:
				if(flag == 1) {
					list = service.generalMemberListByScore();
				} else {
					list = service.generalMemberListByScoreDesc();
				}
				break;
			case 7:
				if(flag == 1) {
					list = service.generalMemberListByPoint();
				} else {
					list = service.generalMemberListByPointDesc();
				}
				break;
			case 8:
				if(flag == 1) {
					list = service.generalMemberListByGrade();
				} else {
					list = service.generalMemberListByGradeDesc();
				}
				break;
		}
	
		map.put("list", list);
		return map; 
	}	
	
	// 검색
	@RequestMapping("/general/search")
	@ResponseBody
	public Map<String, Object> search(String searchType, String keyword, int sort, int flag) {
		Map<String, Object> map = new HashMap<>();
		MgmtSearch search  = new MgmtSearch();		
		List<Member> searchList = null;
		List<LoginHistory> searchRLDList = new ArrayList<>();
		
		search.setKeyword(keyword);
		search.setSearchType(searchType);
	
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
				search.setSortColumn("login_date_time");
				break;
			case 6:
				search.setSortColumn("score");
				break;
			case 7:
				search.setSortColumn("point");
				break;
			case 8:
				search.setSortColumn("grade_no");
				break;
		}
		
		searchList = service.search(search);
	
		map.put("searchList", searchList);

		return map;
	}
	
	// 상세
	@RequestMapping("/general/detail")
	public void detail(Model model, int no, String id) {
		model.addAttribute("general", service.detail(no));
		model.addAttribute("myPosts", service.myPosts(id));
		model.addAttribute("myComments", service.myComments(id));
	}
	
	// 탈퇴
	@RequestMapping("/general/delete")
	public String delete(int no) {
		service.deleteMember(no);
		return "redirect:list.mn";
	}
	
	// 포인트지급 페이지 이동
	@RequestMapping("/general/pay")
	public void pay(Model model, int no, String id) {
		model.addAttribute("no", no);
		model.addAttribute("id", id);
	}
	
	// 포인트 지급
	@RequestMapping("/general/pay-point")
	@ResponseBody
	public void pay(int no, int point, String id) {
		System.out.println("----------------------------------");
		System.out.println(no);
		System.out.println(point);
		System.out.println(id);
		System.out.println("----------------------------------");
		
		Member member = new Member();
		member.setNo(no);
		member.setPoint(point);
		pService.payPointByAdmin(member);
		
		PointPlus pp = new PointPlus();
		pp.setPlusPoint(point);
		pp.setId(id);
		pService.pointHistoryByAdmin(pp);
	}
	
	
} // end class
