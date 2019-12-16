package com.team.service;

import org.springframework.ui.Model;

public interface IBoardService {
	
	public int surveySave(Model model);
	public void surveySelect(Model model);
	public void surveyModify(Model model);
	public int surveyUpdate(Model model);
	public void surveyAllSelect(Model model);
}
