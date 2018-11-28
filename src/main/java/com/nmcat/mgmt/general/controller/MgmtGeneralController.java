package com.nmcat.mgmt.general.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nmcat.mgmt.general.service.MgmtGeneralService;

@RequestMapping("/admin")
@Controller
public class MgmtGeneralController {
	
	@Autowired
	private MgmtGeneralService service;

	@RequestMapping("/general/list")
	void list() {}
	
	@RequestMapping("/general/detail")
	void detail() {}
}
