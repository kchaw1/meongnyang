package com.nmcat.crowd.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.crowd.service.CrowdService;
import com.nmcat.repository.domain.Crowd;

@RequestMapping("/admin")
@Controller
public class CrowdController {
	
	@Autowired
	private CrowdService service;
	
	// 크라우드펀딩 작성 폼 
	@RequestMapping("/crowd/writeForm") 
	public void writeForm() {}
	
	// 크라우드펀딩 작성
	@RequestMapping("/crowd/write") 
	public String write(Crowd crowd) throws Exception {
		// 파일첨부
		MultipartFile attach = crowd.getAttach();
        String uploadPath = "c:/app/upload";
        SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
        String datePath = sdf.format(new Date());
        
        String fileExtension ="";
        String fileSysName = "";
           
           String newName = UUID.randomUUID().toString();
           newName = newName.replace("-", "");
           
           fileExtension = getExtension(attach.getOriginalFilename());
           fileSysName = newName + "." + fileExtension;
           
           crowd.setCrFileOriName(attach.getOriginalFilename());
           crowd.setCrFileName(fileSysName);
           crowd.setCrFilePath(datePath);
         
           File uploadFile = new File(uploadPath + datePath, fileSysName);
           if(uploadFile.exists() == false) {
              uploadFile.mkdirs();
           }
           attach.transferTo(uploadFile);
           
        setStartDay(crowd);
        setEndDay(crowd);
		
		service.write(crowd);
		return "redirect:list.mn";
	}
	
	// 크라우드펀딩 리스트 이동
	@RequestMapping("/crowd/list") 
	public void list() {}
	
	// 크라우드펀딩 리스트
	@RequestMapping("/crowd/printList")
	@ResponseBody
	public Map<String, Object> printList(Crowd crowd) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("crowdList", service.list(crowd));
		map.put("remainDaysList", calRemainDays(service.list(crowd)));

		return map;
	}
	
	// 크라우드펀딩 디테일
	@RequestMapping("/crowd/detail")
	public void detail(Model model, int crNo) {
		System.out.println(service.detail(crNo).getCrTitle());
		System.out.println(service.detail(crNo).getCrContent());
		
		model.addAttribute("detail",service.detail(crNo));
		model.addAttribute("remainDays", calRemainDays(service.detail(crNo).getCrEndDay()));
	}
	
	
	
	
	/* 일반 메소드 */
	// 남은 날짜 계산 (디테일)
	private long calRemainDays(String endDay)  {
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm");
			
			Date parsedEndDay = sdf.parse(endDay);
			Date date = new Date(); // 오늘날짜
			long diff = parsedEndDay.getTime() - date.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			
			return diffDays;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	
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
	
	// 확장자
    private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	}
    
    // 시작날짜 설정
    public void setStartDay(Crowd crowd) {
		crowd.setCrStartDay(new SimpleDateFormat("yyyy-MM-dd HH:mm").format(new Date()));
    }
    
	// 종료날짜 설정
    public void setEndDay(Crowd crowd) {
		String[] endArr = crowd.getCrEndDay().split(" "); // 2018-10-29 06:29 PM
		
		String[] endTimeArr = endArr[1].split(":"); // 18:34 --> 18 split  34
		if(endArr[2].equals("PM")) {
			int hours = Integer.parseInt(endTimeArr[0]);
			if(hours==12) { 
				crowd.setCrEndDay(endArr[0]+" "+endArr[1]);
			} else {
				crowd.setCrEndDay(endArr[0]+" "+String.valueOf(hours + 12)+":"+endTimeArr[1]);
			}
		} else {
			crowd.setCrEndDay(endArr[0]+" "+endArr[1]);
		}
	}
	
	

}
