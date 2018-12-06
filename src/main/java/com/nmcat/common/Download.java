package com.nmcat.common;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/common")
public class Download {
	
	 @RequestMapping("/download")
	 public void download(String path,String sysName, String oriName,
		 HttpServletRequest request, HttpServletResponse response) throws Exception{
				 
//		 String fullPath = path + "\\" + fileName;
		 
//		 System.out.println(path);
//		 System.out.println(sysName);
		 
		 String uploadPath = "c:/app/upload";
         
	     File file = new File(uploadPath + path, sysName);
	     
	     if(file.isFile() == false) {
	    	 System.out.println("파일이 존재하지 않습니다.");
	    	 return;
	     }
	     
	     
//	     	System.out.println("DownloadView --> file.getPath() : " + file.getPath());
//	        System.out.println("DownloadView --> file.getName() : " + file.getName());
	         
	        response.setContentType("application/download; utf-8");
	        response.setContentLength((int)file.length());
	         
	           
	        sysName = new String(file.getName().getBytes("utf-8"));
	                
	        response.setHeader("Content-Disposition", "attachment;filename=" + oriName);
	        response.setHeader("Content-Transfer-Encoding", "binary");
	         
	        OutputStream out = response.getOutputStream();
	        FileInputStream fis = null;
	         
	        try {

	            fis = new FileInputStream(file);
	             
	            FileCopyUtils.copy(fis, out);
	             
	             
	        } catch(Exception e){
	             
	            e.printStackTrace();
	             
	        }finally{
	             
	            if(fis != null){
	                 
	                try{
	                    fis.close();
	                }catch(Exception e){}
	            }
	             
	        }// try end;
	         
	        out.flush();
	 }
}
