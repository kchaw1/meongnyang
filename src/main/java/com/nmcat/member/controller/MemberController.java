package com.nmcat.member.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Profile;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.nmcat.member.service.MemberService;
import com.nmcat.repository.domain.Login;
import com.nmcat.repository.domain.Member;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	@RequestMapping("/signup.mn")
	public String signup(Member member) {
		service.signup(member);
		return "redirect:/member/login.mn";
		
	} // 회원가입
	
	@PostMapping("/checkid.mn")
	@ResponseBody
	public boolean checkId(String id) {
		return service.checkId(id);
	} // id check
	
	
	
/*	@RequestMapping("/login.mn")
	@ResponseBody
	public boolean login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
		System.out.println("loginpass : " + login.getPass());
		if(member != null) {
			session.setAttribute("user", member);
			return true;
		}
		return false;
	} // 로그인
*/	
	@RequestMapping("/login.mn")
	public void login() {}
	
	@PostMapping("/loginform.mn")
	@ResponseBody
	public boolean login(HttpSession session, Login login) {
		System.out.println("login id : " + login.getId());
		Member member = service.login(login);
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
	
	@RequestMapping("signupform.mn")
	public String sendMail(Member member) {
		System.out.println(member.toString());
		return service.sendMail(member);
	}
	
//	 @RequestMapping("/signup.mn")
//	    public String requestupload1(MultipartHttpServletRequest mtfRequest) {
//	        String src = mtfRequest.getParameter("src");
//	        System.out.println("src value : " + src);
//	        MultipartFile mf = mtfRequest.getFile("file");
//
//	        String imagePath = "C:/data/upload";
//
//	        String imageName = mf.getOriginalFilename(); // 원본 파일 명
//	        long imageSize = mf.getSize(); // 파일 사이즈
//
//	        System.out.println("originFileName : " + imageName);
//	        System.out.println("fileSize : " + imageSize);
//
//	        String safeFile = imagePath + System.currentTimeMillis() + imageName;
//
//	        try {
//	            mf.transferTo(new File(safeFile));
//	        } catch (IllegalStateException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        } catch (IOException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	        }
//
//	        return "redirect:/member/signup.mn";
//	    }
//
	}
	/*@PostMapping("/login.mn")
	@ResponseBody
	public Member uploadFile(@RequestParam("file") List<MultipartFile> attach) throws IllegalStateException, IOException {
		String ImagePath = "/app/data/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";
		
		Member profile = new Member();
		
		for(MultipartFile file : attach) {
			if(file.isEmpty() == true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			
			System.out.println("원본파일명" + file.getOriginalFilename());
			System.out.println("확장자:" + fileExtension);
			
			fileSysName = newName + "." + fileExtension;
			
			
			profile.setImageName(fileSysName);
			profile.setImagePath(ImagePath);
			
			
			File img = new File(ImagePath + fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
//			drFile.setUrl("http://192.168.0.63:8000"+ uploadPath + datePath +"/"+ fileSysName);
//			Member.setUrl("http://localhost:8000"+ ImagePath +"/"+ fileSysName);
		}
		
//		fileList.add(profile);
		
		return profile;
	}
	
	 private static String getExtension(String fileName) {
	        int dotPosition = fileName.lastIndexOf('.');
	        
	        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
	            return fileName.substring(dotPosition + 1);
	        } else {
	            return "";
	        }
		 }*/

