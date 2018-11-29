package com.nmcat.abs.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.nmcat.abs.service.AbsService;
import com.nmcat.repository.domain.AFormVO;
import com.nmcat.repository.domain.Abs;
import com.nmcat.repository.domain.AbsBoardFile;
import com.nmcat.repository.domain.AbsComment;
import com.nmcat.repository.domain.board.QnABoard;

@RequestMapping("/abs")
@Controller
public class AbsController {

	@Autowired
	public AbsService absService;
	
	
	//행동전문가 리스트 가져오기
	@RequestMapping("/absList.mn")
	public void list(Abs abs, Model model) throws Exception {
		
		Map<String,Object> map =absService.list(abs);
		model.addAttribute("map", map);
		
	}
	//행동전문가 팝업창 메인
	@RequestMapping("/absDetailMain.mn")
	public void detail(int no, Model model) throws Exception {
		
		model.addAttribute("map", absService.detail(no));
		
	}
	//행동전문가 팝업창 상세
	@RequestMapping("/absDetail.mn")
	public void detailIntro(int no, Model model) {

		model.addAttribute("map", absService.detail(no));
	}
	
	//행동전문가 질문게시판 
	@RequestMapping("/absDetailBoard.mn")
	public void absboardlist(int no, Model model) {
		Map<String,Object> map = absService.absboardlist(no);
		model.addAttribute("map",map);
	}
	//행동전문가 질문게시판 질문 등록
	@RequestMapping("/write.mn")
	public String write(AFormVO form,QnABoard qnaboard,AbsBoardFile file)throws Exception {
		qnaboard.setAbsWriter(form.getAbsWriter());
		qnaboard.setAbsTitle(form.getAbsTitle());
		qnaboard.setAbsContent(form.getAbsContent());
		file.setAbsfSysName(form.getSysName());
		file.setAbsfPath(form.getPath());
		
		absService.write(qnaboard,file);
		return "redirect:absDetailBoard.mn?no="+qnaboard.getNo();

	}
	//행동전문가 질문게시판 질문 등록 폼
	@RequestMapping("/absDetailBoardWrite.mn")
	public void absBoardwriteForm(){
		
	}
	
	//행동전문가 질문게시판 질문 상세
	@RequestMapping("/absDetailBoardDetail.mn")
	public void absDetailBoardDetail(int absNo, Model model) {
		model.addAttribute("map", absService.absBoardDetail(absNo));
	}
	
	//게시글 삭제!!!!!!
	@RequestMapping("/absBoardDelete.mn")
	public String absBoardDelete(int absNo,QnABoard qnaboard,int no) {
		absService.absBoardDelete(absNo);
		return "redirect:absDetailBoard.mn?no="+no;
		
	}
	//답변 채택 기능
	@RequestMapping("/absBoardComplete.mn")
	public String absBoardComplete(int absNo,QnABoard qnaboard,int no) {
		absService.absComplete(absNo);
		return "redirect:absDetailBoard.mn?no="+no;
	}
	
	//게시물 수정 완료
	@RequestMapping("/absDetailBoardUpdate.mn")
	public void absBoardUpdate(int absNo, Model model){
		model.addAttribute("b",absService.updateForm(absNo));
	}
	@RequestMapping("/update.mn")
	public String update(int absNo,QnABoard qnaboard,int no) throws Exception {
		absService.updateAbsBoard(qnaboard);
		return "redirect:absDetailBoardDetail.mn?no="+no+"&absNo="+absNo;
	}
//----------------------------댓글---------------------------------------------
	@PostMapping("/comment/list.mn")
	@ResponseBody
	public List<AbsComment> listComment(@RequestParam("absNo")int absNo) throws ParseException {
		return convertDate(absService.listComment(absNo));
	}
	@PostMapping("/comment/write.mn")
	@ResponseBody
	public List<AbsComment> writeComment(AbsComment comment) throws ParseException {
		return convertDate(absService.writeComment(comment));
	}
	
	
//---------------------------댓글 regdate---------------------------------------------------------	
	private List<AbsComment> convertDate(List<AbsComment> list) throws ParseException {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		for(AbsComment co : list) {
			String date = sdf.format(co.getAbscRegDate());
			co.setRegDateString(date);
		}
		return list;
	}
	
//---------------------------파일 등록-----------------------------------------------
	
	@PostMapping("/uploadfile.mn")
	@ResponseBody
	public AbsBoardFile uploadFile(@RequestParam("file") List<MultipartFile> attach, AbsBoardFile aFile) throws IllegalStateException, IOException {
		String uploadPath = "/app/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		
		String newName = UUID.randomUUID().toString();
		newName = newName.replace("-", "");
		
		String fileExtension ="";
		String fileSysName = "";

		System.out.println(attach);
		
		for(MultipartFile file : attach) {
			if(file.isEmpty()==true) continue;
			fileExtension = getExtension(file.getOriginalFilename());
			fileSysName = newName + "." + fileExtension;
			System.out.println(uploadPath + datePath + "/"+fileSysName);
			
			aFile.setAbsfSysName(fileSysName);
			aFile.setAbsfPath(uploadPath + datePath);
			
			File img = new File(uploadPath + datePath, fileSysName);
			
			if(img.exists() == false) {
				img.mkdirs();
			}
			file.transferTo(img);
			//service.uploadFile(ef);
			aFile.setUrl("http://localhost:8000"+ uploadPath + datePath +"/"+ fileSysName);

		}
		//source="org.eclipse.jst.jee.server:cityFarmer"
		return aFile;
	}
	
	 private static String getExtension(String fileName) {
        int dotPosition = fileName.lastIndexOf('.');
        
        if (dotPosition != -1 && fileName.length() - 1 > dotPosition) {
            return fileName.substring(dotPosition + 1);
        } else {
            return "";
        }
	 }
	 
	 private static String getParentUrl(String fileUrl) {
		 int dotPosi = fileUrl.lastIndexOf('/');
		 
		 if(dotPosi != -1 && fileUrl.length() -1 > dotPosi) {
			 return fileUrl.substring(0,dotPosi);
		 } else {
			 return "";
		 }
	 }
}
