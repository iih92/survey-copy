package com.team.service;

import java.util.List;

import org.springframework.ui.Model;

import com.team.dto.BoardDTO;
import com.team.dto.PageCount;
import com.team.dto.TakeSurvey;

public interface IBoardService {
	
	public int surveySave(Model model);
	public void surveySelect(Model model);
	public void surveyModify(Model model);
	public int surveyUpdate(Model model);
	public void surveyAllSelect(Model model);
	public void surveyDelete(Model model);
	public void surveySearch(Model model);
	public int surveyVote(Model model);
	public String[] surveyQuestion(Model model);
	public String[] surveyResult(Model model);
	/*페이징*/
	public void page_board_list(Model model);
	public PageCount pagingNum(Model model, int daonum);
	public List<BoardDTO> page_board_list_nick(Model model);
	public List<TakeSurvey> page_board_list_take(Model model);
	/*참여한 설문조사*/
	public void takeSurbey(int num, Model model);
	public void TakeSurbeySearch(Model model);
	
	//포인트내역
	public void pointHistory(Model model);
	public List<String> ajax_getDatesecond(Model model);
	public List<TakeSurvey> ajax_pointHistory(Model model);
	
}
