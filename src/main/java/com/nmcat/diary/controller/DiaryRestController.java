package com.nmcat.diary.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.nmcat.diary.service.DiaryService;
import com.nmcat.repository.domain.board.DiaryBoard;
import com.nmcat.repository.domain.board.DiaryComment;
import com.nmcat.repository.domain.board.DiaryFile;

@RequestMapping("/diary")
@RestController
public class DiaryRestController {

	@Autowired
	private DiaryService service;
	
//	@RequestMapping("/writeform.mn")
//	public void mainDiary() {}
	
	@PostMapping("/write.mn")
	public Map<String, Object> writeNewDiary (DiaryBoard diary, DiaryFile file) {
		diary.setDrRegDateTime(new Date());
		if(file.getDrfPath()=="") {
			return service.writeNewDiary(diary);			
		} else {
			return service.writeAllNewDiary(diary, file);
		}
	}
	
	@RequestMapping("/listall.mn")
	public Map<String, Object> listAll(DiaryBoard diary) {
		Map<String, Object> map = service.list(diary);
		//System.out.println("map: " + map);
		return map;
	}
	
	@PostMapping("/detail.mn")
	public Map<String, Object> detailDiary(DiaryBoard diary) {
		Map<String, Object> map = service.detailDiary(diary);
		return map;
	}
	
	@PostMapping("/delete.mn")
	public Map<String, Object> deleteDiary(DiaryBoard diary){
		return service.deleteDiary(diary);
	}
	
	@PostMapping("/updateform.mn")
	public DiaryBoard updateformDiary(int drNo) {
		return service.updateformDiary(drNo);
	}
	
	@PostMapping("/update.mn")
	public List<DiaryBoard> updateDiary(DiaryBoard diary) {
		return service.updateDiary(diary);
	}
	
	@PostMapping("/uploadfile.mn")
	public DiaryFile uploadFile(@RequestParam("file") MultipartFile attach) throws IllegalStateException, IOException {
//		String uploadPath = "/app/tomcat-work/wtpwebapps/cityFarmer/img/exchange";
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";

		//System.out.println("attach : " +attach);
		
		DiaryFile drFile = new DiaryFile();
		
		
		if(attach.isEmpty() == false) {
			fileExtension = getExtension(attach.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			//System.out.println(uploadPath + datePath + "/"+fileSysName);

			drFile.setDrfSysName(fileSysName);
			drFile.setDrfPath(uploadPath + datePath);
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			attach.transferTo(img);
			drFile.setUrl("https://192.168.0.63:443"+ uploadPath + datePath +"/"+ fileSysName);
		} //enhanced for문
		
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return drFile;
	}
	
	@PostMapping("/comment/write.mn")
	public Map<String, Object> writeNewComment(DiaryBoard diary, DiaryComment comment){
		return service.writeNewComment(diary, comment);
	}
	
	private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	 }
	
	
} //end class
