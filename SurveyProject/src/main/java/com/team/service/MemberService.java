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
	public void signIn(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void signOut(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void signUp(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changePw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String pw = request.getParameter("pw");
		MemberDTO dto = new MemberDTO();
		dto.setPw(pw);
		dao.changePw(dto);
	}

	@Override
	public void changeNick(Model model) {
		// TODO Auto-generated method stub
		
	}

}
