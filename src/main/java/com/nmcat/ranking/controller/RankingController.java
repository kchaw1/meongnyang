package com.nmcat.ranking.controller;

import java.util.Calendar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.ranking.service.RankingService;
import com.nmcat.repository.domain.Rank;
@Controller
@RequestMapping("/ranking")
public class RankingController {
	
	 @Autowired
	 public RankingService service;
	 
	 @RequestMapping("/rankingGen.mn")
	 public void selectGen(Model model)throws Exception{
		Rank rank = new Rank();
		rank.setWeek(getWeek()); // 林 技泼
		System.out.println(rank.getWeek()+"       gdgdgdgdgdgdgdg");
		rank.setMonth(getMonth()); // 岿 技泼
		System.out.println(rank.getMonth()+"       gdgdgdgdgdgdgdg");
		model.addAttribute("list2", service.selectGeneralMemberRank(rank));
	 }
	 
	 @RequestMapping("/rankingAbs.mn")
	 public void selectAbs(Model model)throws Exception{
			Rank rank = new Rank();
			rank.setWeek(getWeek()); // 林 技泼
			System.out.println(rank.getWeek()+"       gdgdgdgdgdgdgdg");
			rank.setMonth(getMonth()); // 岿 技泼
			System.out.println(rank.getMonth()+"       gdgdgdgdgdgdgdg");
			model.addAttribute("list", service.selectABSMemberRank(rank));
		 }
	 
	 @RequestMapping("/ranking.mn")
	 public void selectAll(Model model)throws Exception{
		 model.addAttribute("list", service.selectAllMemberRank());
	 }
	 		
			public static String getWeek(){
		 	return String.valueOf(Calendar.getInstance().get(Calendar.WEEK_OF_MONTH));
		 	}
			
		
			public static String getMonth() {
			return String.valueOf(Calendar.getInstance().get(Calendar.MONTH) + 1);
			}
}
