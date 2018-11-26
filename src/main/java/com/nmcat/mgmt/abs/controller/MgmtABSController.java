package com.nmcat.mgmt.abs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.mgmt.abs.service.MgmtABSService;

@RequestMapping("/admin")
@Controller
public class MgmtABSController {
	
	@Autowired
	private MgmtABSService service;
	
	@RequestMapping("/abs/list")
	public void list(Model model) {
		model.addAttribute("list", service.list());
	}
	
	@RequestMapping("/abs/detail")
	public void detail() {
		
	}
	
	
}
