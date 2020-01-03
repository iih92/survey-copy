package com.team.controller;

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
	private IReplyService rService;

	//[댓글]
	@RequestMapping(value = "replySave")
	public String replySave(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);

		//댓글 저장하기      // 댓글 텍스트 에어리어가 널이 아니거나, ""와 다르다면 ==> 저장하러 갑시다 널이거나 ""면 그냥 패스..
		if(request.getParameter("wReplyArea") != null && request.getParameter("wReplyArea").equals("") != true) {
			rService.replySave(model);
		}	
		redirect.addAttribute("num",request.getParameter("hnum"));
		return "redirect:boarddetail";			
	}
	
	//[대댓글 저장]
	@RequestMapping(value = "reReplySave")
	public String reReplySave(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);

		//대댓글 저장하기      // 대댓글 텍스트 에어리어가 널이 아니거나, ""와 다르다면 ==> 저장하러 갑시다 널이거나 ""면 그냥 패스..
		if(request.getParameter("reReplyWrite") != null && request.getParameter("reReplyWrite").equals("") != true) {
			rService.reReplySave(model);
		} else {
			System.out.println("대댓글 텍스트에 글이 없습니다");
		}
		redirect.addAttribute("num",request.getParameter("hnum"));
		return "redirect:boarddetail";			
	}
	
	//[댓글 삭제]
	@RequestMapping(value = "replyDelete")
	public String replyDelete(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);	
		rService.replyDelete(model);	
		// 해당 글 번호로이동 
		redirect.addAttribute("num",request.getParameter("num"));
		return "redirect:boarddetail";			
	}

	//[댓글 수정]
	@RequestMapping(value = "replyUpdate")
	public String replyUpdate(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		rService.replyUpdate(model);
		redirect.addAttribute("num",request.getParameter("hnum"));
		return "redirect:boarddetail";		
	}
	
}
