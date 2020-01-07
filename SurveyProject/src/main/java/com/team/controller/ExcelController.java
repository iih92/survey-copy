package com.team.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.service.ExcelService;
import com.team.service.IBoardService;

@Controller
public class ExcelController {

	@Autowired
	private IBoardService bService;
	
	//[엑셀 파일 생성]
	@RequestMapping(value="makeExcel.do", method=RequestMethod.GET)
	@ResponseBody
	public void makeExcel(Model model,HttpServletRequest request, 
			@RequestParam(value="xlsResult[]") String[] xlsResult,
			@RequestParam(value="xlsCnt[]") String[] xlsCnt,
			@RequestParam(value="xlsPer") String xlsPer) throws Exception{
		model.addAttribute("request",request);
		String[] info = bService.surveyQuestion(model);
		String title = info[0];
		String question = info[1];
		ExcelService.makeExcel(title + ".xls", xlsResult, xlsCnt, xlsPer, question);
	}
	
	//[엑셀 파일 다운]
	@RequestMapping(value="/downLoadExel.do")
	public void downLoadFile(HttpServletRequest request, HttpServletResponse response, ModelMap model, RedirectAttributes ra) throws Exception {
		String path = request.getParameter("title") + ".xls";  // Link의 자바파일에서 excel 파일이 생성된 경로
		String fileName = request.getParameter("title") + ".xls"; 
	 
	    File file = new File(path);
	 
	    FileInputStream fileInputStream = null;
	    ServletOutputStream servletOutputStream = null;
	 
	    try{
	        String downName = null;
	        String browser = request.getHeader("User-Agent");
	        //파일 인코딩
	        if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")){//브라우저 확인 파일명 encode      
	            downName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");   
	        } else {
	            downName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");       
	        }
	         
	        response.setHeader("Content-Disposition","attachment;filename=\"" + downName+"\"");             
	        response.setContentType("application/octer-stream");
	        response.setHeader("Content-Transfer-Encoding", "binary;");
	 
	        fileInputStream = new FileInputStream(file);
	        servletOutputStream = response.getOutputStream();
	 
	        byte b [] = new byte[1024];
	        int data = 0;
	 
	        while((data=(fileInputStream.read(b, 0, b.length))) != -1){  
	            servletOutputStream.write(b, 0, data);       
	        }
	        servletOutputStream.flush();//출력       
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        if(servletOutputStream!=null){
	            try{
	                servletOutputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	        if(fileInputStream!=null){
	            try{
	                fileInputStream.close();
	            }catch (IOException e){
	                e.printStackTrace();
	            }
	        }
	    }
	}	
	
}
