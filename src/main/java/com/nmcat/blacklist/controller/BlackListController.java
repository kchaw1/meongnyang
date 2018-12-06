package com.nmcat.blacklist.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nmcat.blacklist.service.BlackListService;
import com.nmcat.repository.domain.Blacklist;

@Controller
@RequestMapping("blacklist")
public class BlackListController {
	
	@Autowired
	BlackListService service;
	
	@PostMapping("/block.mn")
	public void blockUser(Blacklist black) {
		//System.out.println(black);
		service.blockUser(black);
	}
	
	@PostMapping("/showlist.mn")
	@ResponseBody
	public Map<String, Object> showAllBlackList(Blacklist black){
		return service.showAllBlackList(black);
	}
	
	

}
