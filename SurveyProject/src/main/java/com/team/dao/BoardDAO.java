package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.BoardDTO;
import com.team.dto.PageCount;
import com.team.dto.TakeSurvey;
import com.team.dto.VoteDTO;

@Repository
public class BoardDAO {

	private static final String namespace = "Board";

	@Autowired
	private SqlSession sqlsession;

	public int surveySave(BoardDTO dto) {	
		int num = 0;
		try {
			sqlsession.insert(namespace + ".surveySave", dto);				
			num = sqlsession.selectOne(namespace + ".currentNum");
		} catch (Exception e) { System.out.println(e); }
		return num;
	}

	public BoardDTO surveySelect(int num) {
		sqlsession.update(namespace + ".up", num);
		return sqlsession.selectOne(namespace + ".surveySelect", num);
	}
	
	/*설문조사 중복참여 검사*/
	public String VoteSelect(int num) {
		return sqlsession.selectOne(namespace + ".VoteSelect", num);
	}

	public BoardDTO surveyModify(int num) {
		return sqlsession.selectOne(namespace + ".surveySelect", num);
	}

	public int surveyUpdate(BoardDTO dto) {
		int num = 0;
		try {
			sqlsession.insert(namespace + ".surveyUpdate", dto);				
			num = sqlsession.selectOne(namespace + ".currentNum");
		} catch (Exception e) { }
		return num;
	}

	public List<BoardDTO> surveyAllSelect() {
		return sqlsession.selectList(namespace + ".surveyAllSelect");
	}


	public Object surveyDelete(int num) {
		return sqlsession.delete(namespace + ".surveyDelete", num);
	}

	public List<BoardDTO> surveySearch(String hashtag) {
		return sqlsession.selectList(namespace + ".surveySearch",hashtag);
	}

	public void surveyVote(VoteDTO dto) {
		sqlsession.insert(namespace + ".surveyVote", dto);
	}

	public List<VoteDTO> surveyResult(int num) {
		return sqlsession.selectList(namespace + ".surveyResult", num);

	}

	/*Paging 메소드----------------------------------------------------------------*/
	public int getTotalPage() {
		return sqlsession.selectOne(namespace+".board_getTotalPage");
	}
	public List<BoardDTO> page_board_list(PageCount pc) {
		return sqlsession.selectList(namespace+".board_pagingList",pc);
	}
	/*마이페이지 - 페이징*/
	public int getTotalPage_nick(String loginUser) {
		System.out.println(loginUser);
		return sqlsession.selectOne(namespace+".board_getTotalPage_nick", loginUser);
	}
	public List<BoardDTO> page_board_list_nick(PageCount pc) {
		return sqlsession.selectList(namespace+".board_pagingList_nick",pc);
	}
	/*-----------------------------------------------------------------------------*/
	
	
	/*참여 설문조사 등록*/
	public void takeSurbey(TakeSurvey tdto) {
		sqlsession.insert(namespace+".takeSurbey",tdto);	
	}
	/*참여 설문조사 검색*/
	public List<TakeSurvey> TakeSurbeySearch(String loginUser) {
		return sqlsession.selectList(namespace+".TakeSurbeySearch",loginUser);
	}

}
