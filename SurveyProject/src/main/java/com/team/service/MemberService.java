package com.team.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.MemberDAO;
import com.team.dto.MemberDTO;

@Service
public class MemberService implements IMemberService{

	@Autowired
	private MemberDAO dao;

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
	
	//로그아웃
	@Override
	public void signOut(Model model) {}

	//회원가입
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

	//아이디중복체크
	@Override
	public int idCheck(String id) {
		return dao.checkOverId(id);
	}

	//닉네임중복체크
	@Override
	public int nickCheck(String nick) {
		return dao.checkOverNick(nick);
	}


	@Override
	public void changePw(Model model) {
		// TODO Auto-generated method stub

	}

	@Override
	public void changeNick(Model model) {
		// TODO Auto-generated method stub

	}

}
