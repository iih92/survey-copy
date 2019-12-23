package com.team.service;

import org.springframework.ui.Model;

import com.team.dto.PageCount;

public interface IBoardService {
	
	public int surveySave(Model model);
	public void surveySelect(Model model);
	public void surveyModify(Model model);
	public int surveyUpdate(Model model);
	public void surveyAllSelect(Model model);
	public void surveyDelete(Model model);
	public void surveySearch(Model model);
	public int surveyVote(Model model);
	public String[] surveyResult(Model model);
	/*페이징*/
	public void page_board_list(Model model);
	public PageCount pagingNum(Model model);
	public void page_board_list_nick(Model model);
	public PageCount pagingNum_nick(Model model);
	/*참여한 설문조사*/
	public void takeSurbey(int num, Model model);
	public void TakeSurbeySearch(Model model);
}
