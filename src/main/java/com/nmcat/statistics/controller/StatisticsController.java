package com.nmcat.statistics.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

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
			newMemberArr[i] = service.newMember(dateArr[i]);
		}
		
		model.addAttribute("newMemberArr", newMemberArr);
		
		// 방문자수
		int[] visitorArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			visitorArr[i] = service.visitor(dateArr[i]);
		}
		
		model.addAttribute("visitorArr", visitorArr);
		
		// 게시글수
		int[] postArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			postArr[i] = service.post(dateArr[i]);
		}
		
		model.addAttribute("postArr", postArr);
		
		// 댓글수
		int[] commentArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			commentArr[i] = service.comment(dateArr[i]);
		}
		
		model.addAttribute("commentArr", commentArr);
		
		// 포인트 사용량
		int[] pointArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			pointArr[i] = service.point(dateArr[i]);
		}
		
		model.addAttribute("pointArr", pointArr);
		
		// 평균 접속시간
		int[] timeArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			timeArr[i] = service.connectTime(dateArr[i]);
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
			newMemberArr[i] = service.newMember(monthArr[i]);
		}
		model.addAttribute("newMemberArr", newMemberArr);
		
		// 방문자수
		int[] visitorArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			visitorArr[i] = service.visitor(monthArr[i]);
		}
		model.addAttribute("visitorArr", visitorArr);
		
		// 게시글수
		int[] postArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			postArr[i] = service.post(monthArr[i]);
		}
		model.addAttribute("postArr", postArr);
		
		// 댓글수
		int[] commentArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			commentArr[i] = service.comment(monthArr[i]);
		}
		model.addAttribute("commentArr", commentArr);
		
		// 포인트 사용량
		int[] pointArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			pointArr[i] = service.point(monthArr[i]);
		}
		model.addAttribute("pointArr", pointArr);
		
		// 평균 접속시간
		int[] timeArr = new int[5];
		
		for(int i=0; i<=4; i++) {
			timeArr[i] = service.connectTime(monthArr[i]);
		}
		model.addAttribute("timeArr", timeArr);
	}
	
	// 주별 페이지 이동
		@RequestMapping("/statistics/week")
		public void week(Model model) {
			
			SimpleDateFormat sdf = new SimpleDateFormat("MM");
			
			Calendar cal = Calendar.getInstance();
			cal.add(cal.MONTH, 0);
			
			String month = sdf.format(cal.getTime()); // 이번달
			
			model.addAttribute("newMemberArr", service.newMemberWeek(month)); // 가입자
			model.addAttribute("visitorArr", service.visitorWeek(month)); // 방문자
			model.addAttribute("postArr", service.postWeek(month)); // 게시물
			model.addAttribute("commentArr", service.commentWeek(month)); // 댓글
			model.addAttribute("pointArr", service.pointWeek(month)); // 포인트
			model.addAttribute("timeArr", service.connectTimeWeek(month)); // 평균접속시간
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
			
		}
		
		return monthArr;
	}
}

