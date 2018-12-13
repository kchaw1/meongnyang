package com.nmcat.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.member.service.MemberService;
import com.nmcat.point.serivce.PointService;
import com.nmcat.repository.domain.Member;

@Controller
@RequestMapping("/mypageGen")
public class MyPageController {

	@Autowired
	private MemberService service;
	
	@Autowired
	private PointService pointService;
	
	@RequestMapping("list.mn")
	public void list(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
		model.addAttribute("lastlogin", service.selectRac(member.getId()));
	}
	
	// 회원정보 수정할때 비밀번호 체크
	@RequestMapping("/loginck.mn")
	@ResponseBody
	public int loginck(Member member) {
		return service.selectRelogin(member);
		
	}
	
	@RequestMapping("activity.mn")
	public void activity(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("myBoardList", service.selectMyBoard(member.getId()));
		model.addAttribute("myComment", service.selectMyComment(member.getId()));
	}
	
	@RequestMapping("edit.mn")
	public void edit(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
	}
	
	// 프로필 사진 수정
	@RequestMapping("updateProfile.mn")
	public String updateProfile(Member member, HttpSession session) {
		Member member2 = (Member)session.getAttribute("user");
		member.setId(member2.getId());
		
		System.out.println(member);
		MultipartFile profile = member.getProfile();
	      String uploadPath = "c:/app/upload";
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
	         try {
				profile.transferTo(uploadFile);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	         service.updateProfile(member);
		return "redirect:/mypageGen/edit.mn";
	}
	private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
   }
	
	 // 비밀번호 수정
	 @RequestMapping("/updatePass.mn")
		public String updatePass(Member member, HttpSession session) {
		 System.out.println(member);
		 Member member2 = (Member)session.getAttribute("user");
		 	member2.getId();
		 	member.setId(member2.getId());
		 	service.updateEmail(member);
			service.updatePass(member);
			session.invalidate();
			
			return "redirect:/member/login.mn";
	}
	 
	// 획득 포인트 내역 
	@RequestMapping("point.mn")
	public void point(Model model, HttpSession session ) {
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
		model.addAttribute("pluspoint", pointService.selectAddPoint(member.getId()));
		model.addAttribute("minuspoint", pointService.selectMinusPoint(member.getId()));
	}
	
	@RequestMapping("grade.mn")
	public void grade() {}
	
}
