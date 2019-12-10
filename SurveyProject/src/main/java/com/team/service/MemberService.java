package com.team.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.MemberDAO;

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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changeNick(Model model) {
		// TODO Auto-generated method stub
		
	}

}
