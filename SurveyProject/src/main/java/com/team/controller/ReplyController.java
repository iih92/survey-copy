package com.team.controller;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team.service.IReplyService; 


@Controller
public class ReplyController {
	
	@Autowired
	IReplyService service;
	
	@RequestMapping(value = "replySave")
	public String replySave(Model model, HttpServletRequest request, RedirectAttributes redirect) {
			model.addAttribute("request", request);
		 
			//댓글 저장하기      // 댓글 텍스트 에어리어가 널이 아니거나, ""와 다르다면 ==> 저장하러 갑시다 널이거나 ""면 그냥 패스..
			if(request.getParameter("wReplyArea") != null && request.getParameter("wReplyArea").equals("") != true) {
				service.replySave(model);
			}
		
		 	redirect.addAttribute("num",request.getParameter("hnum"));
			return "redirect:boarddetail";			
		 
	}
	@RequestMapping(value = "reReplySave")
	public String reReplySave(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		
		//대댓글 저장하기      // 대댓글 텍스트 에어리어가 널이 아니거나, ""와 다르다면 ==> 저장하러 갑시다 널이거나 ""면 그냥 패스..
		if(request.getParameter("reReplyWrite") != null && request.getParameter("reReplyWrite").equals("") != true) {
			
			System.out.println("ReplyController의 reReplySave메소드의 if문입니다~");
			System.out.println("if문 안쪽 >> 글번호 >>"+request.getParameter("hnum") );
			System.out.println("if문 안쪽 >> 댓글번호 >>"+request.getParameter("cnum") );
			System.out.println("if문 안쪽 >> 댓글내용 >>"+request.getParameter("reReplyWrite") );
			
			service.reReplySave(model);
			
		}else {
			System.out.println("대댓글 텍스트 에어리어에 아무내용이 없는경우");
		}
		
		redirect.addAttribute("num",request.getParameter("hnum"));
		return "redirect:boarddetail";			
		
	}
	@RequestMapping(value = "replyDelete")
	public String replyDelete(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		
		service.replyDelete(model);
		
		// 해당 글 번호로이동.. 
		redirect.addAttribute("num",request.getParameter("num"));
		return "redirect:boarddetail";			
		
	}
	

	@RequestMapping(value = "replyUpdate")
	public String replyUpdate(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		

		Enumeration params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		System.out.println("----------------------------");
 
		model.addAttribute("request", request);
		
		service.replyUpdate(model);
		
		
		
		redirect.addAttribute("num",request.getParameter("hnum"));
		return "redirect:boarddetail";		
	}
	
	
}
