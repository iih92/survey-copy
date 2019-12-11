package com.team.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.IMemberService;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	
	//[회원가입]
	@RequestMapping("signUp")
	public String registerSave(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.signUp(model);
		return "home/main";
	}
	
	//[아이디 중복체크]
	@RequestMapping(value = "idCheck",  method = RequestMethod.POST)	
	@ResponseBody
	public int idcheck(@RequestBody String id) {
		int count = 0;	
		System.out.println("사용자가 입력한 : " + id);
		System.out.println("사용자가 입력한 수 : " + count);
		count = service.idCheck(id);
        return count;
	}
	
	
	//[닉네임 중복체크]
	@RequestMapping(value = "nickCheck",  method = RequestMethod.POST)	
	@ResponseBody
	public int nickcheck(@RequestBody String nick) {
		int count = 0;	
		System.out.println("사용자가 입력한 닉네임 : " + nick);
		System.out.println("사용자가 입력한 수 : " + count);
		count = service.nickCheck(nick);
        return count;
	}
	
	//[로그인]
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
	
	//[로그아웃]
	@RequestMapping(value = "signOut")
	public String signOutProc(Model model, HttpServletRequest request, HttpSession session) {		
		session.invalidate();		
		return "home/main";
	}
	
	
}
