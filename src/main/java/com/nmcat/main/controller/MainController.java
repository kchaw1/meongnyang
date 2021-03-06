package com.nmcat.main.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.main.service.MainService;
import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.Rank;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService service;
	
	//메인페이지 커뮤니티 최신글 5개 뿌려주기
	@RequestMapping("/mainPage.mn")
	public void list(Model model) throws Exception{
		// 최신 커뮤니티 게시글
		model.addAttribute("list", service.selectComBoardRegDate());
		// 최신 전체공개 다이어리 게시글
		model.addAttribute("list2", service.selectDiaryBoardRegDate());
		// 유튜브 리스트
		model.addAttribute("youtubeList", service.youtubeList());
		// 크라우드 펀딩 리스트
		model.addAttribute("crowdList", service.crowdList());
		model.addAttribute("remainDays", calRemainDays(service.crowdList())); // 남은날짜
		// 공지사항 리스트
		model.addAttribute("noticeList", service.noticeList());
		// 행동전문가 리스트
		model.addAttribute("absList", service.absList());
		
		// 랭킹
		Rank rank = new Rank();
		rank.setWeek(getWeek()); // 주 세팅
		rank.setMonth(getMonth()); // 월 세팅
		
		model.addAttribute("rankGeneralList", service.generalRank(rank));
		model.addAttribute("rankABSList", service.ABSRank(rank));
	}
	
	/* 일반 메소드 */
	// 남은 날짜 계산 (리스트)
		private List<Long> calRemainDays(List<Crowd> crowdList)  {
			try {
				List<Long> remainDaysList = new ArrayList<>();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
				for(Crowd c : crowdList) {
					if(c.getCrEndDay()==null) continue;
					Date parsedEndDay = sdf.parse(c.getCrEndDay());
					Date date = new Date(); // 오늘날짜
					long diff = parsedEndDay.getTime() - date.getTime();
					long diffDays = diff / (24 * 60 * 60 * 1000);
					remainDaysList.add(diffDays);
				}
				
				return remainDaysList;
				
			} catch (Exception e) {
				e.printStackTrace();
				return null;
			}
		}
		
		
		// 현재 날짜의 주
		public static String getWeek(){
	 		return String.valueOf(Calendar.getInstance().get(Calendar.WEEK_OF_MONTH));
	 	}
		
		// 월구하기 해야됨
		public static String getMonth() {
			return String.valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1);
		}


	

}
