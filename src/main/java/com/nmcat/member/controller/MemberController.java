package com.nmcat.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Career;
import com.nmcat.repository.domain.License;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;
import com.nmcat.score.service.ScoreService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	@Autowired
	private ScoreService scoreService;
	
	@RequestMapping("/signup.mn")
	public String signup(Member member) throws Exception {
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
	         profile.transferTo(uploadFile);
	         
		service.signup(member);
		return "redirect:/member/login.mn";
		
	} // 반려인 회원가입
	
	@RequestMapping("/absignup.mn")
	public String absup(Member member, Career career, License license) throws Exception {
		System.out.println(career);
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
	         
	        MultipartFile lifile = license.getLifile();
		      String liuploadPath = "c:/app/license";
		      SimpleDateFormat lisdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		      String lidatePath = lisdf.format(new Date());
		      
		      String lifileExtension ="";
		      String lifileSysName = "";
		         
		         String linewName = UUID.randomUUID().toString();
		         newName = newName.replace("-", "");
		         
		         
		         lifileExtension = getExtension(lifile.getOriginalFilename());
		         lifileSysName = linewName + "." + fileExtension;
		         
		         license.setLifOriName(lifile.getOriginalFilename());
		         license.setLifSysName(lifileSysName);
		         license.setLifPath(lidatePath);
		         license.setLifSize((int)lifile.getSize());
		       
		         File liuploadFile = new File(liuploadPath + lidatePath, lifileSysName);
		         if(liuploadFile.exists() == false) {
		        	 liuploadFile.mkdirs();
		         } 
		         lifile.transferTo(liuploadFile);
		service.license(license);
	    service.insertCaree(career);
		service.absup(member);
		System.out.println(member);
		return "redirect:/member/login.mn";
		
	} // 행동전문가 회원가입	
	
	@PostMapping("/checkid.mn")
	@ResponseBody
	public boolean checkId(String id) {
		return service.checkId(id);
	} //checkId
	
	
	@RequestMapping("/login.mn")
	public void login() {}
	
	@RequestMapping("/loginform.mn")
	@ResponseBody
	public boolean login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		if(member == null) {
			return false;

		}
		service.insertHistory(login.getId());
		
		if(service.selectHistory(login.getId()) == 1) {
			service.updqteScore(login.getId());
			scoreService.updateGradeNo(login.getId());
			scoreService.insertLoginScoreHistory(login.getId());
		}


		System.out.println("loginscore : " + login.getId());
		System.out.println("loginpass : " + login.getPass());
		System.out.println("loginCount : " + service.selectHistory(login.getId()));
		session.setAttribute("user", member);
		
		return true;
	} // 로그인
	
	@RequestMapping("/naverloginform.mn")
	public String naverlogin(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		service.insertHistory(login.getId());
		
		if(service.selectHistory(login.getId()) == 1) {
			service.updqteScore(login.getId());
			scoreService.updateGradeNo(login.getId());
		}
		
		System.out.println("loginpass : " + login.getPass());
			session.setAttribute("user", member);
			
			return "redirect:/main/mainPage.mn";

	} // 로그인
	
	@RequestMapping("/logout.mn")
	public String logout(HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		System.out.println("아이디아이디아이디아이디아이디아이디아이디아이디아이디아이디아이디" + member.getId());
		service.updateHistory(member.getId());
		session.invalidate();
		return "redirect:/member/login.mn";
	} // 로그아웃
	
	@RequestMapping("sendMail.mn")
	@ResponseBody
	public String sendMail(Member member) {
		
		return service.sendMail(member);
	}
	
	@RequestMapping("/naverSignup.mn")
	public void naverSignup(Model model,Member member) {
		
		model.addAttribute("member", member);
	}
	
	// 네이버 로그인  추가정보 받기 
	@RequestMapping("/naverlogin.mn")
	public String naverlogin(Model model, Member member, RedirectAttributes redirectAttributes) {
		Member nmb = service.naver(member);
		System.out.println(nmb);
		
		if(nmb == null) {
			String name = member.getName();
			String email = member.getEmail();
			return "redirect:/member/naverSignup.mn?name="+name+"&email=" + email;
		} 
	System.out.println("아이디값" + nmb.getId());
		String id = nmb.getId();
		String pass = nmb.getPass();
		Login login = new Login();
		login.setId(id);
		login.setPass(pass);
		
		redirectAttributes.addFlashAttribute("login", login);
		
		
		return "redirect:/member/naverloginform.mn";
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



