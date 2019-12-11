package com.team.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.IMemberService;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	
	@RequestMapping(value = "changePw")
	public String changePw(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.changePw(model);
		return "redirect:mypage";
	}
	@RequestMapping(value = "changeNick")
	public String changeNick(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.changeNick(model);
		return "redirect:mypage";
	}
	
}
