package com.nmcat.member.controller;

import java.io.File;
import java.io.IOException;
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
		String imageName = UUID.randomUUID().toString();
		profile.transferTo(new File("C:/data/upload", imageName));
		
		System.out.println("이름" + member.getPass());
		member.setImagePath("C:/data/upload");
		member.setImageName(imageName);
		member.setImageSize((int)profile.getSize());
		
		service.signup(member);
		return "redirect:/member/login.mn";
		
	} // 회원가입
	
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
	
	/*@RequestMapping(value="/signup.mn", method=RequestMethod.POST)
	public String profile1(String id, MultipartFile profile) throws Exception {
		System.out.println("id : " + id);
		System.out.println("profile : " + profile);
		
		// 실제 파일이 전송되었는지 확인
		System.out.println("profile.isEmpty() : " + profile.isEmpty());
		
		if (profile.isEmpty() == true) return "redirect:/member/signup.jsp";
		
		// 파일이 존재하는 경우 처리
		// 서버의 특정 위치에 저장하자..
		// 실제 사용자가 선택한 파일 이름 가져오기
		System.out.println("원본파일명 : " + profile.getOriginalFilename());
		System.out.println("크기 : " + profile.getSize());
		
		// 서버의 특정 위치에 파일을 저장하기
		profile.transferTo(new File("C:/data/upload", profile.getOriginalFilename()));
		
		return "redirect:/member/signup.jsp";
	}
*/
	/*@PostMapping("/signup.mn")
	@ResponseBody
	public Member profile(Member member, MultipartFile profile) {
		String uploadPath = "/C:/data/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";
		
		System.out.println(profile);
		
		fileExtension = getExtension(profile.getOriginalFilename());
		fileSysName = newName + "." + fileExtension;
		System.out.println(uploadPath + datePath + "/"+fileSysName);
			
		member.setImageName(fileSysName);
		member.setImagePath(datePath + uploadPath);
		member.setImageSize(profile.getSize());
		
		File pro = new File(uploadPath + datePath, fileSysName);
		
		if(pro.exists() == false) {
			pro.mkdirs();
		}
		profile.transferTo(pro);
		
		service.signup(member);
		
		return "redirect:/member/signup.mn";
	}*/
}	
//	@RequestMapping("signupform.mn")
//	@ResponseBody
//	public String sendMail(Member member) {
//		System.out.println(member.toString());
//		return service.sendMail(member);
//	}
	
	/* @RequestMapping("/signup.mn")
	    public String requestupload1(MultipartHttpServletRequest mtfRequest) {
	        String src = mtfRequest.getParameter("src");
	        System.out.println("src value : " + src);
	        MultipartFile mf = mtfRequest.getFile("file");

	        String imagePath = "C:/data/upload";

	        String imageName = mf.getOriginalFilename(); // 원본 파일 명
	        long imageSize = mf.getSize(); // 파일 사이즈

	        System.out.println("originFileName : " + imageName);
	        System.out.println("fileSize : " + imageSize);

	        String safeFile = imagePath + System.currentTimeMillis() + imageName;

	        try {
	            mf.transferTo(new File(safeFile));
	        } catch (IllegalStateException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        } catch (IOException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }

	        return "redirect:/member/signup.mn";
	    }*/


