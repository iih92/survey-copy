package com.team.service;

import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.MemberDAO;
import com.team.dto.MemberDTO;

@Service
public class MemberService implements IMemberService{

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MemberDAO dao;
	
	//[회원가입]
	@Override
	public void signUp(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String nick = request.getParameter("nick");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		pw = passwordEncoder.encode(pw);
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto.setId(id);
		dto.setPw(pw);		
		dao.singUp(dto);	
	}
	
	//[로그인]
	@Override
	public String[] signIn(MemberDTO dto) {
		String[] result = new String[2];
		MemberDTO mdto = new MemberDTO();
		mdto = dao.signIn(dto.getId());

		try {
			if(passwordEncoder.matches(dto.getPw(), mdto.getPw())) {
				/*비밀번호 일치*/
				result[0]="1";
				result[1]=mdto.getNick();
			} else {
				/*비밀번호 불일치*/
				result[0]="2";
			}
		} catch (Exception e) {
			result[0]="3";
		}
		return result;
	}
	
	//[로그아웃]
	public void signOut(Model model) {}

	//[아이디중복체크]
	@Override
	public int idCheck(String id) {
		return dao.checkOverId(id);
	}

	//[닉네임중복체크]
	@Override
	public int nickCheck(String nick) {
		return dao.checkOverNick(nick);
	}

	//[비밀번호 변경]
	@Override
	public void changePw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String nick = request.getParameter("nick");
		String pw = request.getParameter("pw");
		pw = passwordEncoder.encode(pw);
		MemberDTO dto = new MemberDTO();
		dto.setPw(pw);
		dto.setNick(nick);
		dao.changePw(dto);
	}

	//[닉네임 변경]
	@Override
	public void changeNick(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String nick = request.getParameter("nick");
		String id = request.getParameter("id");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto.setId(id);
		dao.changeNick(dto);
	     
		/*변경된 닉네임 세션설정하기*/
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", dto.getNick());
	}

	//[포인트 적립]
	@Override
	public void addPoint(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		/*세션값(닉네임)*/
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		/*포인트*/
		String P = request.getParameter("point");
		int point = Integer.parseInt(P);

		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto.setPoint(point);
		dao.addPoint(dto);
	}
	
	//[포인트 차감]
	@Override
	public void minusPoint(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		/*포인트*/
		String P = request.getParameter("point");
		int point = (Integer.parseInt(P)*100)+1000;
		
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto.setPoint(point);
		dao.minusPoint(dto);
	}

	//[포인트 가져오기] 
	@Override
	public void userPoint(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto = dao.userPoint(dto);
		session.setAttribute("userPoint", dto.getPoint());
	}

	//[닉네임으로 정보 가져오기]
	@Override
	public MemberDTO info(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto = dao.info(dto);
		try {
			if(passwordEncoder.matches(request.getParameter("pw"), dto.getPw())) dto.setPw("1");
			else dto.setPw("0");			
		} catch (Exception e) {}
		model.addAttribute("dto",dto);
		return dto;
	}

	//[회원 탈퇴]
	@Override
	public void leave(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dao.leave(dto);
		session.invalidate();
	}

	//[admin 체크]
	@Override
	public void adminChk(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto = dao.adminChk(dto);
		session.setAttribute("admin", dto.getAdmin());
	}

	//[모든 회원 정보 가져오기]
	@Override
	public void userList(Model model) {
		model.addAttribute("userList",dao.userList());
	}
	
	//[회원 포인트 수정]
	@Override
	public void adminModify(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int point = Integer.parseInt(request.getParameter("point"));
		MemberDTO dto = new MemberDTO();
		dto.setPoint(point);
		dto.setNick(request.getParameter("nick"));
		dao.adminModify(dto);
	}
	
	//[회원 강제 탈퇴 시키기]
	@Override
	public void adminLeave(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String nick = request.getParameter("nick");
		dao.adminLeave(nick);
	}
	
}
