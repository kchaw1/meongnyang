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
	@RequestMapping("/notice/write")
	public String write(Notice notice) {
		service.writeNotice(notice, fileList);
		fileList = new ArrayList<>();
		return "redirect:list.mn";
	}
	
	// 사진 업로드
	@PostMapping("/notice/uploadfile")
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
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			ntcFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);
		}
			fileList.add(ntcFile);
			
		return ntcFile;
	}
	
	@RequestMapping("notice/list") 
	public void list(){}
	
	// 공지사항 리스트 
	@RequestMapping("/notice/noticeList")
	@ResponseBody
//	public Map<String, Object> noticeList(
//			@RequestParam(value="pageNo", defaultValue="1") int pageNo,
//			String searchType,
//			String keyword) {
//		Notice notice = new Notice();
//		notice.setPageNo(pageNo);
//		notice.setSearchType(searchType);
//		notice.setKeyword(keyword);
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
		model.addAttribute("ntc", service.detail(ntcNo));
	}
	
	// 수정 폼 이동
	@RequestMapping("/notice/updateForm") 
	public void update() {
		
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
