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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.member.service.MemberService;
import com.nmcat.point.serivce.PointService;
import com.nmcat.ranking.service.RankingService;
import com.nmcat.repository.domain.Member;
import com.nmcat.repository.domain.Page2;


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
		System.out.println("왜 정보가 안넘어가냐???????????????????????????????" + service.selectMemberInfo(member.getNo()));
		model.addAttribute("lastlogin", service.selectRac(member.getId()));
		model.addAttribute("rank", service.selectMyRanking(member.getId()));
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));

	}
	
	// �쉶�썝�젙蹂� �닔�젙�븷�븣 鍮꾨�踰덊샇 泥댄겕
	@RequestMapping("/loginck.mn")
	@ResponseBody
	public int loginck(Member member) {
		return service.selectRelogin(member);
		
	}
	
	@RequestMapping("activity.mn")
	public void activity(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		Page2 page = new Page2();
		page.setPageNo(pageNo);
		page.setId(member.getId());

		int count = service.selectComCount(member.getId());
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
		model.addAttribute("myBoardList", service.selectComPage(page));
		/*model.addAttribute("myComment", service.selectMyComment(member.getId()));*/
	}
	
	@RequestMapping("comment.mn")
	public String comment(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		Page2 page = new Page2();
		page.setPageNo(pageNo);
		page.setId(member.getId());

		int count = service.selectCommentCount(member.getId());
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
		/*model.addAttribute("myBoardList", service.selectMyBoard(member.getId()));*/
		model.addAttribute("myComment", service.selectCommentPage(page));
		
		return "mypageGen/activity";
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
	
	 // 鍮꾨�踰덊샇 �닔�젙
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
	 
	// 포인트
	@RequestMapping("point.mn")
	public void pointPlus(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, HttpSession session ) {
		Member member = (Member)session.getAttribute("user");
		Page2 page = new Page2();
		page.setPageNo(pageNo);
		page.setId(member.getId());

		int count = pointService.selectPageCount(member.getId());
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
		model.addAttribute("pluspoint", pointService.selectPagePoint(page));
		/*model.addAttribute("minuspoint", pointService.selectMinusPage(page));*/
		/*model.addAttribute("minuspoint", pointService.selectMinusPoint(member.getId()));*/
	}
	
	@RequestMapping("minusPoint.mn")
	public String pointMinus(@RequestParam(value = "pageNo", defaultValue = "1") int pageNo, Model model, HttpSession session ) {
		Member member = (Member)session.getAttribute("user");
		Page2 page = new Page2();
		page.setPageNo(pageNo);
		page.setId(member.getId());

		int count = pointService.selectMinusCount(member.getId());
		int lastPage = (int) Math.ceil(count / 10d);

		// 페이지 블럭 시작
		int pageSize = 10;
		int currTab = (pageNo - 1) / pageSize + 1;
		// 11번 부터 2페이지가 되는것
		int beginPage = (currTab - 1) * pageSize + 1;
		int endPage = currTab * pageSize < lastPage ? currTab * pageSize : lastPage;

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("lastPage", lastPage);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
		/*model.addAttribute("pluspoint", pointService.selectPagePoint(page));*/
		model.addAttribute("minuspoint", pointService.selectMinusPage(page));
		/*model.addAttribute("minuspoint", pointService.selectMinusPoint(member.getId()));*/
		
		return "mypageGen/point";
		
	}
	
	@RequestMapping("grade.mn")
	public void grade(Model model, HttpSession session) {
		Member member = (Member)session.getAttribute("user");
		model.addAttribute("member", service.selectMemberInfo(member.getNo()));
	}
	
	/*@RequestMapping("deleteChek")
	public String delete(int no) throws Exception {
		pointService.deletePlus(no);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "point.mn";
	}*/
}
