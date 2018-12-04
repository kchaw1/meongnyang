package com.nmcat.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/signup.mn")
	public String signup(Member member) throws Exception {
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
	         profile.transferTo(uploadFile);
	         
		service.signup(member);
		return "redirect:/member/login.mn";
		
	} // 반려인 회원가입
	
	@RequestMapping("/absignup.mn")
	public String absup(Member member, Career career, License license) throws Exception {
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
	        /* profile.transferTo(uploadFile);
	         
	         MultipartFile lifile = license.getLifile();
		      String liuploadPath = "c:/app/license";
		      SimpleDateFormat lisdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		      String lidatePath = sdf.format(new Date());
		      
		      String lifileExtension ="";
		      String lifileSysName = "";
		         
		         String linewName = UUID.randomUUID().toString();
		         newName = newName.replace("-", "");
		         
		         
		         fileExtension = getExtension(profile.getOriginalFilename());
		         fileSysName = newName + "." + fileExtension;
		         
		         member.setImageOriName(profile.getOriginalFilename());
		         member.setImageName(fileSysName);
		         member.setImagePath(datePath);
		         member.setImageSize((int)profile.getSize());
		       
		         File liuploadFile = new File(uploadPath + datePath, fileSysName);
		         if(uploadFile.exists() == false) {
		            uploadFile.mkdirs();
		         } 
		         profile.transferTo(uploadFile);*/
	         
	    service.license(license);
	    service.insertCaree(career);
		service.absup(member);
		return "redirect:/member/login.mn";
		
	} // 행동전문가 회원가입
	
	@PostMapping("/checkid.mn")
	@ResponseBody
	public boolean checkId(String id) {
		return service.checkId(id);
	} //checkId
	
	
	@RequestMapping("/login.mn")
	public void login() {}
	
	@PostMapping("/loginform.mn")
	@ResponseBody
	public boolean login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		service.insertHistory(login.getId());
		service.updqteScore(login.getId());
		System.out.println("loginpass : " + login.getPass());
		if(member != null) {
			session.setAttribute("user", member);
			
			return true;
		}
		return false;
	} // 로그인
	
	@RequestMapping("/logout.mn")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/member/login.mn";
	} // 로그아웃
	
	@RequestMapping("sendMail.mn")
	@ResponseBody
	public String sendMail(Member member) {
		
		return service.sendMail(member);
	}
	
	 private static String getExtension(String fileName) {
	        int dotPosition = fileName.lastIndexOf('.');
	        
	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
	            return fileName.substring(dotPosition + 1);
	        } else {
	            return "";
	        }
	   }
}


