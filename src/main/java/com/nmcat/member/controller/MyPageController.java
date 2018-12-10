package com.nmcat.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Member;

@Controller
@RequestMapping("/mypageGen")
public class MyPageController {

	@Autowired
	private MemberService service;
	
	@RequestMapping("list.mn")
	public void list(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		
		
		
	}
	
	@RequestMapping("loginck.mn")
	public void loginck() {
		
	}
	
	@RequestMapping("activity.mn")
	public void activity() {
		
	}
	
	@RequestMapping("edit.mn")
	public void edit() {}
	
	@RequestMapping("updateProfile.mn")
	public String updateProfile(MultipartFile profile,HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		
		/*if(profile.isEmpty() == true) return "redirect:/mypageGen/edit.mn";
		
		String uploadPath = "c:/app/upload2";
        SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
        String datePath = sdf.format(new Date());
       
        String fileExtension ="";
	    String fileSysName = "";
	         
	    String newName = UUID.randomUUID().toString();
	    newName = newName.replace("-", "");
	    
	    fileExtension = getExtension(profile.getOriginalFilename());
        fileSysName = newName + "." + fileExtension;
        
        member.setImageOriName(profile.getOriginalFilename());
        member.setImageName(fileSysName);
        member.setImagePath(datePath);
        member.setImageSize((int)profile.getSize());
      
        File uploadFile = new File(uploadPath + datePath, fileSysName);
        if(uploadFile.exists() == false) {
           uploadFile.mkdirs();
        }
        profile.transferTo(uploadFile);
        
        service.signup(member);*/
		return "성공";
	}
	
	 // 비밀번호 수정
	 @RequestMapping("/updatePass.mn")
		public String updatePass(Member member, HttpSession session) {
		 System.out.println(member);
		 Member member2 = (Member)session.getAttribute("user");
		 	member2.getId();
		 	member.setId(member2.getId());
			service.updatePass(member);
			session.invalidate();
			
			return "redirect:/member/login.mn";
	}
	
	@RequestMapping("point.mn")
	public void point() {}
	
	@RequestMapping("grade.mn")
	public void grade() {}
	
}
