package com.team.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.dto.MemberDTO;
import com.team.dto.TakeSurvey;
import com.team.service.IBoardService;
import com.team.service.IMemberService;

@Controller
public class MemberController {

	@Autowired
	private IMemberService service;
	@Autowired
	private IBoardService boardservice;
	@Autowired
	private JavaMailSender mailSender;


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

	//[메인 페이지로 이동]
	@RequestMapping(value = "mypage")
	public String myPage() {
		return "MyPage/main";
	}
	
	//[mypage - detail]
	@RequestMapping(value = "detail")
	public String myDetail(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request",request);   	
		boardservice.TakeSurbeySearch(model);
		boardservice.page_board_list_nick(model);
		boardservice.pagingNum(model,2);
		
		boardservice.page_board_list_take(model);
		boardservice.pagingNum(model,3);
		boardservice.pointHistory(model);
		return "MyPage/detail";
	}
	

	//[mailSending 코드]
	  @RequestMapping(value = "/mail/mailSending")
	  public String mailSending(HttpServletRequest request) {
	   
	    String setfrom = "heyhihello.jj@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용
	    String reply = request.getParameter("reply"); 		 //회신 이메일
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	      messageHelper.setFrom(reply);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content + "[회신 받을 이메일 : " + reply + "]");  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	   
	    return "redirect:/mypage";
	  }

	//[마이페이지 회원 탈퇴]
	@RequestMapping(value = "leave.do")
	@ResponseBody
	public MemberDTO page2(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	
		return service.info(model);
	}
	
	//[회원 탈퇴]
	@RequestMapping(value = "leave")
	public String leave(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request", request);	
		service.leave(model);
		return "redirect:/";
	}
	
	//[해당 회원 정보 가져오기]
	@RequestMapping(value = "info.do")
	@ResponseBody
	public MemberDTO info(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	
		return service.info(model);
	} 
	
	
	@RequestMapping(value = "page3.do")
	@ResponseBody
	public Map<Integer, Object> page3(Model model, HttpServletRequest request) {
		System.out.println("page3.do 실행되나--------------------------------");
		model.addAttribute("request", request);	
		List<String> list1 = boardservice.ajax_getDatesecond(model);
		List<TakeSurvey> list2 = boardservice.ajax_pointHistory(model);
		
		String str = list2.get(0).getTitle();	
		System.out.println(str);
			
		Map<Integer, Object> map1 = new HashMap();
		map1.put(1, list1);
		map1.put(2, list2);
		
		System.out.println(map1.get(1)); 
		System.out.println(map1.get(2)); 
		return map1; 
	}
	
	@RequestMapping(value = "page4.do")
	@ResponseBody
	public Map<Integer, Object> page4(Model model, HttpServletRequest request) {
		System.out.println("page4.do 실행되나--------------------------------");
		model.addAttribute("request", request);	
		
		List<String> list1 = boardservice.ajax_getDatesecond(model);
		List<TakeSurvey> list2 = boardservice.ajax_pointHistory(model);
		
		String str = list2.get(0).getTitle();
		System.out.println(str);

		Map<Integer, Object> map1 = new HashMap();
		map1.put(1, list1);
		map1.put(2, list2);
		
		System.out.println(map1.get(1)); 
		return map1;
	} 
}
