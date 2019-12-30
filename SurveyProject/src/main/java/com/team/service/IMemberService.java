package com.team.service;

import org.springframework.ui.Model;

import com.team.dto.MemberDTO;

public interface IMemberService {

	public String[] signIn(MemberDTO dto);
	public void signOut(Model model);
	public void signUp(Model model);
	public void changePw(Model model);
	public void changeNick(Model model);	
	public int idCheck(String id);
	public int nickCheck(String nick);
	public void addPoint(Model model);
	public void userPoint(Model model);
	public MemberDTO info(Model model);
	public void leave(Model model);
}
