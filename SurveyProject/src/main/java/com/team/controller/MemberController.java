package com.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.IMemberService;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	
	@RequestMapping(value = "signIn")
	public String signInProc(Model model, HttpServletRequest request, HttpSession session) {
		System.out.println("MemberController -> signInProc 메소드 진입");
 		
		// 서비스 소환술
		model.addAttribute("request",request);
		service.signIn(model);

		// 세션 들어왔는지 확인
		System.out.println(session.getAttribute("loginUser"));
		
		
		
		
		System.out.println("MemberController -> signInProc 메소드 종료");
		return "login/chkLogin";
	}
	
	@RequestMapping(value = "signOut")
	public String signOutProc(Model model, HttpServletRequest request, HttpSession session) {
		
		session.invalidate();
		
		return "home/main";
	}
	
}
