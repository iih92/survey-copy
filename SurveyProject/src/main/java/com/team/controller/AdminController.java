package com.team.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.IBoardService;
import com.team.service.IMemberService;
import com.team.service.IReplyService;

@Controller
public class AdminController {

	@Autowired
	private IBoardService bService;
	@Autowired
	private IMemberService mService;
	
	//[admin 페이지]
	@RequestMapping(value = "admin")
	public String adminPage() {
		return "admin/admin";
	}
	
	//[모든 유저 보기]
	@RequestMapping(value = "adminUser")
	public String userList(Model model) {
		mService.userList(model);
		return "admin/adminUser";
	}
	
	//[모든 게시글 보기]
	@RequestMapping(value = "adminBoard")
	public String BoardList(Model model) {
		bService.surveyAllSelect(model);
		return "admin/adminBoard";
	}
	
	//[유저 포인트 수정]
	@RequestMapping(value = "adminModify")
	public String adminModify(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		mService.adminModify(model);
		return "redirect:adminUser";
	}
	
	//[유저 강제 탈퇴]
	@RequestMapping(value = "adminLeave")
	public String adminLeave(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		mService.adminLeave(model);
		return "redirect:adminUser";
	}
	
}
