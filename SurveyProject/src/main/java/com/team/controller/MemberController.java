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
	private IMemberService mService;
	@Autowired
	private IBoardService bService;
	@Autowired
	private JavaMailSender mailSender;

	//[회원가입]
	@RequestMapping("signUp")
	public String registerSave(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		mService.signUp(model);
		return "redirect:/";
	}

	//[로그인]
	@RequestMapping(value="signIn", produces="application/json;charset=utf8")  
	@ResponseBody
	public String signIn(MemberDTO dto,HttpSession session)throws JsonProcessingException {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id",dto.getId());
		String[] result = mService.signIn(dto);

		if(result[0].equals("1")) {
			/*비밀번호 일치 , 세션생성*/
			session.setAttribute("loginUser", result[1]);
			map.put("rs",result[0]);
		} else if(result[0].equals("2")) {
			/*비밀번호 불일치*/
			map.put("rs",result[0]);
		} else {
			/*아이디가 없다*/
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
		return "redirect:/";
	}
	
	//[아이디 중복체크]
	@RequestMapping(value = "idCheck",  method = RequestMethod.POST)	
	@ResponseBody
	public int idCheck(@RequestBody String id) {
		int count = 0;	
		count = mService.idCheck(id);
		return count;
	}

	//[닉네임 중복체크]
	@RequestMapping(value = "nickCheck",  method = RequestMethod.POST)	
	@ResponseBody
	public int nickCheck(@RequestBody String nick) {
		int count = 0;	
		count = mService.nickCheck(nick);
		return count;
	}
	
	//[비밀번호 변경]
	@RequestMapping(value = "changepw", method = RequestMethod.POST)
	public String changePw(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		mService.changePw(model);
		return "MyPage/main";
	}

	//[닉네임 변경]
	@RequestMapping(value = "changeNick")
	public String changeNick(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		mService.changeNick(model);
		return "MyPage/main";
	}

	//[나의 페이지로 이동]
	@RequestMapping(value = "mypage")
	public String myPage() {
		return "MyPage/main";
	}
	
	//[나의페이지 - detail]
	@RequestMapping(value = "detail")
	public String myDetail(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request",request); 
		/*페이징 - 나의 등록한 설문조사*/
		bService.takeSurveySearch(model);
		bService.pageBoardListNick(model);
		bService.pagingNum(model,2);
		/*페이징 - 최근한 설문조사*/
		bService.pageBoardListTake(model);
		bService.pagingNum(model,3);
		bService.pointHistory(model);
		
		bService.pointLogLast(model);
		return "MyPage/detail";
	}
	
	//[문의하기 - mailSending 코드]
	@RequestMapping(value = "/mail/mailSending")
	public String mailSending(HttpServletRequest request) {
		  
	    String setfrom = "heyhihello.jj@gmail.com";         
	    String tomail  = request.getParameter("tomail");     // 받는 사람 이메일
	    String title   = request.getParameter("title");      // 제목
	    String content = request.getParameter("content");    // 내용
	    String reply = request.getParameter("reply"); 		 //회신 이메일
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	      messageHelper.setFrom(reply);    // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content + "[회신 받을 이메일 : " + reply + "]");  // 메일 내용
	      mailSender.send(message);
	    } catch(Exception e){ System.out.println(e); }
	    return "redirect:/mypage";
	}

	//[마이페이지 회원 탈퇴]
	@RequestMapping(value = "leave.do")
	@ResponseBody
	public MemberDTO page2(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	
		return mService.info(model);
	}
	
	//[회원 탈퇴]
	@RequestMapping(value = "leave")
	public String leave(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request", request);	
		mService.leave(model);
		return "redirect:/";
	}
	
	//[해당 회원 정보 가져오기]
	@RequestMapping(value = "info.do")
	@ResponseBody
	public MemberDTO info(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	
		return mService.info(model);
	} 

	//[]
	@RequestMapping(value = "page3.do")
	@ResponseBody
	public List<TakeSurvey> page3(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);		 
		return bService.ajaxPointLogLast(model);
	}
	
	//[]
	@RequestMapping(value = "page4.do")
	@ResponseBody
	public List<TakeSurvey> page4(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	 
		return bService.ajaxPointLogLast(model);
	} 

}
