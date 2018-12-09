package com.nmcat.statistics.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.statistics.service.StatisticsService;

@RequestMapping("/admin")
@Controller
public class StatisticsController {
	
	@Autowired
	private StatisticsService service;
	
	// 일별 페이지 이동
	@RequestMapping("/statistics/day")
	public void day(Model model) {

		String[] dateArr = calRecentFiveDays();
		model.addAttribute("dateArr", dateArr); // 최근 5일 날짜 배열
		
		// 가입자수
		int[] newMemberArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			newMemberArr[i] = service.dayNewMember(dateArr[i]);
		}
		
		model.addAttribute("newMemberArr", newMemberArr);
		
		// 방문자수
		int[] visitorArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			visitorArr[i] = service.dayVisitor(dateArr[i]);
		}
		
		model.addAttribute("visitorArr", visitorArr);
		
		// 게시글수
		int[] postArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			postArr[i] = service.dayPost(dateArr[i]);
		}
		
		model.addAttribute("postArr", postArr);
		
		// 댓글수
		int[] commentArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			commentArr[i] = service.dayComment(dateArr[i]);
		}
		
		model.addAttribute("commentArr", commentArr);
		
		// 포인트 사용량
		int[] pointArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			pointArr[i] = service.dayPoint(dateArr[i]);
		}
		
		model.addAttribute("pointArr", pointArr);
		
		// 평균 접속시간
		int[] timeArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			timeArr[i] = service.dayConnectTime(dateArr[i]);
		}
		
		model.addAttribute("timeArr", timeArr);
	}
	
	// 월별 페이지 이동
	@RequestMapping("/statistics/month")
	public void month(Model model) {

		String[] monthArr = calRecentFiveMonths();
		model.addAttribute("monthArr", monthArr); // 최근 5개월 날짜 배열
		
		// 가입자수
		int[] newMemberArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			newMemberArr[i] = service.dayNewMember(monthArr[i]);
		}
		model.addAttribute("newMemberArr", newMemberArr);
		
		// 방문자수
		int[] visitorArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			visitorArr[i] = service.dayVisitor(monthArr[i]);
		}
		model.addAttribute("visitorArr", visitorArr);
		
		// 게시글수
		int[] postArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			postArr[i] = service.dayPost(monthArr[i]);
		}
		model.addAttribute("postArr", postArr);
		
		// 댓글수
		int[] commentArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			commentArr[i] = service.dayComment(monthArr[i]);
		}
		model.addAttribute("commentArr", commentArr);
		
		// 포인트 사용량
		int[] pointArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			pointArr[i] = service.dayPoint(monthArr[i]);
		}
		model.addAttribute("pointArr", pointArr);
		
		// 평균 접속시간
		int[] timeArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			timeArr[i] = service.dayConnectTime(monthArr[i]);
		}
		model.addAttribute("timeArr", timeArr);
	}
	
	/* 일반 메소드 */ 
	// 오늘날짜기준 최근5일 구하기
	public String[] calRecentFiveDays() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String[] dateArr = new String[5];
		
		for(int i=0; i>=-4; i--) {
			Calendar cal = Calendar.getInstance();
			cal.add(cal.DATE, i);
			
			String date = sdf.format(cal.getTime());
			dateArr[i+4] = date;
			
			System.out.println(dateArr[i+4]);
		}
		
		return dateArr;
	}
	
	// 이번달 기준 최근5개월 구하기
	public String[] calRecentFiveMonths() {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yy-MM");
		String[] monthArr = new String[5];
		
		for(int i=0; i>=-4; i--) {
			Calendar cal = Calendar.getInstance();
			cal.add(cal.MONTH , i);
			
			String date = sdf.format(cal.getTime());
			monthArr[i+4] = date;
			
			System.out.println(monthArr[i+4]);
		}
		
		return monthArr;
	}
	
}

