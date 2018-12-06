package com.nmcat.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
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
import org.springframework.web.servlet.view.UrlBasedViewResolver;

import com.nmcat.community.service.CommunityService;
import com.nmcat.repository.domain.CFormVO;
import com.nmcat.repository.domain.CommunityComment;
import com.nmcat.repository.domain.CommunityFile;
import com.nmcat.repository.domain.board.CommunityBoard;

@Controller
@RequestMapping("/community")
public class CommunityController {

	@Autowired
	private CommunityService service;
	
	@RequestMapping("/communityPage.mn")
	public void list() {
		
	};
	
	@RequestMapping("/communityPageList.mn")
	@ResponseBody
	public Map<String, Object> ajaxList(CommunityBoard comBoard,@RequestParam(value="pageNo", defaultValue="1")int pageNo)throws Exception{
	
		comBoard.setPageNo(pageNo);
//		model.addAttribute("list", service.selectBoard(comBoard));
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", service.selectBoard(comBoard));
		/*map.put("commentCnt", service.selectCommentCount(comBoard.getComNo()));*/
		return map;
	}
	
	@RequestMapping("/communityPage2.mn")
	public Map<String, Object> selectBoardCategory(CommunityBoard comBoard, String comCategory)throws Exception{
		comBoard.setComCategory(comCategory);
		Map<String, Object> map = new HashMap<>();
		map.put("list2", service.selectBoardCa(comBoard));
		return map;
	};

	
	
	@RequestMapping("/communityPageList2.mn")
	@ResponseBody
	public Map<String, Object> ajaxListC(CommunityBoard comBoard,@RequestParam(value="pageNo", defaultValue="1")int pageNo)throws Exception{
		System.out.println(comBoard.getComCategory());
		comBoard.setPageNo(pageNo);
//		model.addAttribute("list", service.selectBoard(comBoard));
		Map<String, Object> map = new HashMap<>();
		
		map.put("list", service.selectBoardC(comBoard));
		/*map.put("commentCnt", service.selectCommentCount(comBoard.getComNo()));*/
		return map;
	}
	
	
/*	public void list(Model model, @RequestParam(value="pageNo", defaultValue="1")int pageNo)throws Exception{
		CommunityBoard comBoard = new CommunityBoard();
		comBoard.setPageNo(pageNo);
		
		model.addAttribute("list", service.selectBoard(comBoard));
	}*/
	@RequestMapping("/detailPage.mn")
	public void detail(Model model, int comNo)throws Exception{
		model.addAttribute("communityBoard", service.detailBoard(comNo));
		
	
	}
	@RequestMapping("/writeForm.mn")
	public void writeForm() {
		
	}
	@RequestMapping("/write.mn")
	public String write(CFormVO form, CommunityBoard comBoard, CommunityFile file)throws Exception{
		comBoard.setComWriter(form.getComWriter());
		comBoard.setComTitle(form.getComTitle());
		comBoard.setComContent(form.getComContent());
		file.setComfSysName(form.getSysName());
		file.setComfPath(form.getPath());
		
		service.insertBoard(comBoard,file);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "communityPage.mn";
	}
	@RequestMapping("/editWriteForm.mn")
	public void updateForm(int comNo, Model model)throws Exception{
		model.addAttribute("communityBoard", service.detailBoard(comNo));
	}
	@RequestMapping("/edit.mn")
	public String update(CommunityBoard comBoard)throws Exception{
		service.updateBoard(comBoard);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "communityPage.mn";
	}
	@RequestMapping("/delete.mn")
	public String delete(int comNo)throws Exception{
		service.deleteBoard(comNo);
		return UrlBasedViewResolver.REDIRECT_URL_PREFIX + "communityPage.mn";
	}
	
	//-----------------------------------------
	//댓글 CRUD
	
	@RequestMapping("/selectComment.mn")
	@ResponseBody
	public List<CommunityComment> selectComment(int comNo)throws Exception{
		return service.selectComment(comNo);
	}
	
	@RequestMapping("/deleteComment.mn")
	@ResponseBody
	public void deleteComment(int comcNo)throws Exception{
		service.deleteComment(comcNo);
		
	}
	
	@RequestMapping("/insertComment.mn")
	@ResponseBody
	public void insertComment(CommunityComment comComment)throws Exception{
		service.insertComment(comComment);
	}
	
	@RequestMapping("/updateComment.mn")
	@ResponseBody
	public void updateComment(CommunityComment comComment)throws Exception{
		service.updateComment(comComment);
	}
	//댓글 총 갯수
	@RequestMapping("/selectCommentCount.mn")
	@ResponseBody
	public int selectCommentCount(int comNo)throws Exception{
		return service.selectCommentCount(comNo);
		
	}
	//-------------------------------파일등록
	@PostMapping("/uploadfile.mn")
	@ResponseBody
	public CommunityFile uploadFile(@RequestParam("file") List<MultipartFile> attach, CommunityFile cFile) throws IllegalStateException, IOException {
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";

		/*System.out.println(attach);*/
		
		for(MultipartFile file : attach) {
			if(file.isEmpty()==true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
/*			System.out.println(uploadPath + datePath + "/"+fileSysName);*/
			
			cFile.setComfSysName(fileSysName);
			cFile.setComfPath(uploadPath + datePath);
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			//service.uploadFile(ef);
			cFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);

		}
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return cFile;
	}
	
	 private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	 }
	 
	/* private static String getParentUrl(String fileUrl) {
		 int dotPosi = fileUrl.lastIndexOf('/');
		 
		 if(dotPosi != -1 && fileUrl.length() -1 > dotPosi) {
			 return fileUrl.substring(0,dotPosi);
		 } else {
			 return "";
		 }
	 }*/
	
	
	
	
	
	
}
