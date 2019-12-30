package com.team.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.MemberDAO;
import com.team.dto.MemberDTO;

@Service
public class MemberService implements IMemberService{

	@Autowired
	private MemberDAO dao;
	
	// [회원가입]
	@Override
	public void signUp(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String nick = request.getParameter("nick");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dto.setId(id);
		dto.setPw(pw);		
		dao.singUp(dto);	
	}
	
	// [로그인]
	@Override
	public String[] signIn(MemberDTO dto) {
		// TODO Auto-generated method stub
		String[] result = new String[2];
		MemberDTO mdto = new MemberDTO();
		mdto = dao.signIn(dto.getId(), dto.getPw());

		try {
			if(dto.getPw().equals(mdto.getPw())) {
				//비밀번호 일치
				result[0]="1";
				result[1]=mdto.getNick();
			} else {
				//비밀번호 불일치 
				result[0]="2";
			}
		} catch (Exception e) {
			result[0]="3";
		}
		return result;
	}
	
	// [로그아웃]
	public void signOut(Model model) {}

	// [아이디중복체크]
	@Override
	public int idCheck(String id) {
		return dao.checkOverId(id);
	}

	// [닉네임중복체크]
	@Override
	public int nickCheck(String nick) {
		return dao.checkOverNick(nick);
	}

	// [비밀번호 변경]
	@Override
	public void changePw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String nick = request.getParameter("nick");
		String pw = request.getParameter("pw");
		MemberDTO dto = new MemberDTO();
		dto.setPw(pw);
		dto.setNick(nick);
		dao.changePw(dto);
	}

	// [닉네임 변경]
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
	}

	// [포인트 적립]
	@Override
	public void addPoint(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		dao.addPoint(dto);
	}

	// [포인트 가져오기] 
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

	// [닉네임으로 정보 가져오기]
	@Override
	public MemberDTO info(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		MemberDTO dto = new MemberDTO();
		dto.setNick(nick);
		model.addAttribute("dto",dao.info(dto));
		return dao.info(dto);
	}

	// [회원 탈퇴]
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

}
