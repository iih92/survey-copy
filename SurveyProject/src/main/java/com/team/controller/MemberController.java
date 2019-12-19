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

	//[로그인]
	@RequestMapping(value="signIn", produces="application/json;charset=utf8")  
	@ResponseBody
	public String signIn(MemberDTO dto,HttpSession session)throws JsonProcessingException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id",dto.getId());
		String[] result = service.signIn(dto);

		if(result[0].equals("1")) {
			//비밀번호 일치 , 세션생성
			session.setAttribute("loginUser", result[1]);
			map.put("rs",result[0]);
		} else if(result[0].equals("2")) {
			//비밀번호 불일치
			map.put("rs",result[0]);
		} else {
			//아이디가 없다
			map.put("rs",result[0]); 
		}
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(map);
		return strJson;       
	}

	//[로그아웃]
	@RequestMapping(value = "signOut")
	public String signOutProc(Model model, HttpServletRequest request, HttpSession session) {		
		session.invalidate();		
		return "home/main";
	}
	
	//[아이디 중복체크]
	@RequestMapping(value = "idCheck",  method = RequestMethod.POST)	
	@ResponseBody
	public int idcheck(@RequestBody String id) {
		int count = 0;	
		count = service.idCheck(id);
		return count;
	}

	//[닉네임 중복체크]
	@RequestMapping(value = "nickCheck",  method = RequestMethod.POST)	
	@ResponseBody
	public int nickcheck(@RequestBody String nick) {
		int count = 0;	
		count = service.nickCheck(nick);
		return count;
	}
	
	//[비밀번호 변경]
	@RequestMapping(value = "changepw", method = RequestMethod.POST)
	public String changePw(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.changePw(model);
		return "Main/main";
	}

	//[닉네임 변경]
	@RequestMapping(value = "changeNick")
	public String changeNick(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		service.changeNick(model);
		return "Main/main";
	}

	@RequestMapping(value = "mypage")
	public String myPage() {
		return "MyPage/main";
	}
	
	@RequestMapping(value = "detail")
	public String myDetail() {
		return "MyPage/detail";
	}

}
