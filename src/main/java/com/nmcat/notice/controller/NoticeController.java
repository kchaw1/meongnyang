package com.nmcat.notice.controller;

import java.io.File;		
import java.io.IOException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import com.nmcat.common.PageResult;
import com.nmcat.notice.service.NoticeService;
import com.nmcat.repository.domain.Notice;
import com.nmcat.repository.domain.NoticeFile;


@RequestMapping("/admin")
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService service;
	
	private List<NoticeFile> fileList = new ArrayList<>(); // 다중 파일첨부를 위한 필드
	
	// 공지사항 작성 폼 이동
	@RequestMapping("/notice/writeForm")
	public void writeForm() {}
	
	// 공지사항 작성
	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public String write(Notice notice, NoticeFile ntcFile) throws Exception {
		
		// 파일첨부
		String uploadPath = "c:/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String fileExtension ="";
		String fileSysName = "";
		
		for(MultipartFile file : ntcFile.getAttach()) {
			
			String newName = UUID.randomUUID().toString();
			newName = newName.replace("-", "");
			
			if (file.isEmpty() == true) continue;
			
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			
			ntcFile.setNtcfOriName(file.getOriginalFilename());
			ntcFile.setNtcfSysName(fileSysName);
			ntcFile.setNtcfPath(datePath);
			ntcFile.setNtcfSize(file.getSize());
			
			File uploadFile = new File(uploadPath + datePath, fileSysName);
			if(uploadFile.exists() == false) {
				uploadFile.mkdirs();
			}
			file.transferTo(uploadFile);
			
			service.noticeFile(ntcFile);
		}
		
		service.writeNotice(notice, fileList);
		fileList = new ArrayList<>();
		
		return "redirect:list.mn";
	}
	
	// 사진 업로드
	@PostMapping("/notice/upload-picture")
	@ResponseBody
	public NoticeFile uploadFile(@RequestParam("file") List<MultipartFile> attach) throws IllegalStateException, IOException {
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";
		
		NoticeFile ntcFile = new NoticeFile();
		
		for(MultipartFile file : attach) {
			if(file.isEmpty()==true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			
			ntcFile.setNtcfOriName(file.getOriginalFilename());
			ntcFile.setNtcfSysName(fileSysName);
			ntcFile.setNtcfPath(uploadPath + datePath);
			ntcFile.setNtcfSize(file.getSize());
			
			service.noticeFile(ntcFile);
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			ntcFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);
			
			System.out.println("ntcFilentcFilentcFilentcFile" + ntcFile);
		}
		fileList.add(ntcFile);
		return ntcFile;
	}
	
	// 리스트 이동
	@RequestMapping("notice/list") 
	public void list(){}
	
	// 공지사항 리스트 
	@RequestMapping("/notice/noticeList")
	@ResponseBody
	public Map<String,Object> noticeList(Notice notice) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("noticeList", service.list(notice));
		map.put("pageResult", new PageResult(notice.getPageNo(), service.listCount(notice)));
		
		return map;
	}
	
	// 공지사항 디테일
	@RequestMapping("/notice/detail")
	public void detail(Model model, int ntcNo) {
		System.out.println(ntcNo);
		service.viewCnt(ntcNo);
		model.addAttribute("fileList", service.showFile(ntcNo));
		model.addAttribute("ntc", service.detail(ntcNo));
	}
	
	// 삭제
	@RequestMapping("/notice/delete") 
	public String update(int ntcNo) {
		service.delete(ntcNo);
		return "redirect:list.mn";
	}
	
	// 수정 폼 이동
	@RequestMapping("/notice/updateForm") 
	public void update(Model model, int ntcNo) {
		model.addAttribute("ntc", service.detail(ntcNo));
	}
	
	// 수정
	@RequestMapping("/notice/update") 
	public String update(Notice notice) {
		service.update(notice);
		return "redirect:detail.mn?ntcNo=" + notice.getNtcNo();
	}
	
	
	
	/* 일반 메소드 */
	
	// 확장자
    private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	}
}
