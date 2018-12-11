package com.nmcat.crowd.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.crowd.service.CrowdService;
import com.nmcat.repository.domain.Crowd;
import com.nmcat.repository.domain.CrowdComment;
import com.nmcat.repository.domain.CrowdLike;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.PointMinus;

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
		service.write(fileAttach(crowd));
		return "redirect:list.mn";
	}
	
	// 크라우드 펀딩 수정
	@RequestMapping("/crowd/update")
	public String update(Crowd crowd) throws Exception {
		service.update(fileAttach(crowd));
		return "redirect:list.mn";
	}
	
	// 크라우드 펀딩 삭제
	@RequestMapping("/crowd/delete")
	public String delete(int crNo) {
		Member member = new Member();
		
		for(PointMinus pm : service.pointHistory(crNo)) {
			member.setId(pm.getId());
			member.setPoint(pm.getMinusPoint());
			
			service.returnPoint(member); // 포인트 환급
			service.sendMsg(pm.getId()); // 환급 메세지 전송
		}
		
		service.delete(crNo);
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
	
	@RequestMapping("/crowd/printEndList")
	@ResponseBody
	public Map<String, Object> printEndList(Crowd crowd) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("crowdList", service.endList(crowd));
		
		return map;
	}
	
	// 크라우드펀딩 디테일
	@RequestMapping("/crowd/detail")
	public void detail(Model model, int crNo, HttpSession session) {
		
		Member member = (Member)session.getAttribute("user");
		CrowdLike cl = new CrowdLike();
		
		System.out.println(service.detail(crNo).getCrTitle());
		System.out.println(service.detail(crNo).getCrContent());
		
		if(member != null) {
			model.addAttribute("myPoint", service.myPoint(member.getNo()));
			
			cl.setCrNo(crNo);
			cl.setCrId(member.getId());
			model.addAttribute("likeCheck", service.likeCheck(cl));
		}
		model.addAttribute("detail",service.detail(crNo));
		model.addAttribute("remainDays", calRemainDays(service.detail(crNo).getCrEndDay()));
	}
	
	// 댓글 리스트
	@RequestMapping("/crowd/commentList") 
	@ResponseBody
	public Map<String, Object> commentList(int crNo) {
		Map<String, Object> map = new HashMap<>();
		
		map.put("commentList", service.commentList(crNo));
		
		return map;
	}
	
	// 크라우드펀딩 기부
	@RequestMapping("/crowd/donate")
	public String donate(Crowd crowd, Member member, CrowdComment cc, PointMinus pm) {
		member.setPoint(crowd.getDonateMoney());
		service.minusPoint(member);
		service.donate(crowd);
		
		if(service.commentCheck(cc)==0) {
			service.addComment(cc);
		}
		
		pm.setCrNo(crowd.getCrNo());
		pm.setMinusPoint(crowd.getDonateMoney());
		pm.setId(cc.getCrcWriter());
		
		service.addPointHistory(pm);
		
		return "redirect:detail.mn?crNo=" + crowd.getCrNo();
	}
	
	// 좋아요
	@RequestMapping("/crowd/likeUp")
	@ResponseBody
	public int likeUp(CrowdLike cl) {
		service.likeCntUp(cl.getCrNo()); // crowd 테이블 개수 올리기
		service.userLikeUp(cl);
		
		return service.likeCnt(cl.getCrNo());
	}
	
	// 좋아요 취소
	@RequestMapping("/crowd/likeDown")
	@ResponseBody
	public int likeDown(CrowdLike cl) {
		service.likeCntDown(cl.getCrNo());
		service.userLikeDown(cl);
		
		return service.likeCnt(cl.getCrNo());
	}
	
	// 수정 페이지 이동
	@RequestMapping("/crowd/updateForm")
	public void updateForm(Model model, int crNo) {
		model.addAttribute("crowdInfo", service.crowdInfo(crNo));
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
	
	// 작성 수정 파일첨부 관련 메소드
    public Crowd fileAttach(Crowd crowd) throws Exception {
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
    	        
    	   return crowd;
    }
    

}
