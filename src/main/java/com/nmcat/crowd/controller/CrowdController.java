package com.nmcat.crowd.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.crowd.service.CrowdService;
import com.nmcat.repository.domain.Crowd;

@RequestMapping("/admin")
@Controller
public class CrowdController {
	
	@Autowired
	private CrowdService service;
	
	@RequestMapping("/crowd/writeForm") 
	public void writeForm() {}
	
	@RequestMapping("/crowd/write") 
	public String write(Crowd crowd) {
		service.write(crowd);
		return "redirect:writeForm.mn";
	}
	
	

}
