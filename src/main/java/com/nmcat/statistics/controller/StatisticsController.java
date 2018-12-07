package com.nmcat.statistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/admin")
@Controller
public class StatisticsController {
	
	@RequestMapping("/statistics/day")
	public void day() {}

}

