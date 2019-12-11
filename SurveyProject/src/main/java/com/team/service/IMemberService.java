package com.team.service;

import org.springframework.ui.Model;

public interface IMemberService {

	public void signIn(Model model);
	public void signOut(Model model);
	public void signUp(Model model);
	public void changePw(Model model);
	public void changeNick(Model model);
	
	public int idCheck(String id);
	public int nickCheck(String nick);
	
}
