package com.team.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.dto.MemberDTO;
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
	

	@RequestMapping(value="ajax_json_login02", produces="application/json;charset=utf8")  
	@ResponseBody
	public String ajax_json02(MemberDTO dto,HttpSession session)throws JsonProcessingException {
		System.out.println(dto.getId());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id",dto.getId());
		map.put("rs","1");
		
		System.out.println("map.get(\"id\") >>"+map.get("id"));
		String[] result = service.signIn2(dto);
		System.out.println("result[0] >> " + result[0]);
		System.out.println("result[1] >> " + result[1]);
		
		if(result[0].equals("1")) {
			//비밀번호 일치 , 세션생성
		    System.out.println("닉네임 : "+result[1]);
		    session.setAttribute("loginUser", result[1]);
		    map.put("rs",result[0]);
		} else if(result[0].equals("2")) {
			//비밀번호 불일치
			System.out.println("여긴 컨트롤러 비번 불일치");
			map.put("rs",result[0]);
		} else {
			//아이디가 없다
		    System.out.println("컨트롤러 아이디 없다~");
		    map.put("rs",result[0]); 
		}
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(map);
		return strJson;       
	}

}
