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
	public void bestSurvey(Model model);
	
	/*페이징*/
	public void pageBoardList(Model model);
	public PageCount pagingNum(Model model, int daonum);
	public List<BoardDTO> pageBoardListNick(Model model);
	public List<TakeSurvey> pageBoardListTake(Model model);
	
	/*참여한 설문조사*/
	public void takeSurvey(int num, Model model);
	public void takeSurveySearch(Model model);
	
	/*포인트내역*/
	public void pointHistory(Model model);
	public List<TakeSurvey> ajaxPointHistory(Model model);
	public List<String> ajaxGetDateSecond(Model model); 
	//포인트내역 마지막
	public void pointLogLast(Model model); 
	public List<TakeSurvey> ajaxPointLogLast(Model model); 
}
