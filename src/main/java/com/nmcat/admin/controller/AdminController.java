package com.nmcat.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class AdminController {
	
		@RequestMapping("/main.mn")
		public void adminMain() {}
		
}
