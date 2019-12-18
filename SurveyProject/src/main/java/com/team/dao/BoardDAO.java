package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.BoardDTO;
import com.team.dto.PageCount;
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

	/*Paging 메소드*/
	public int getTotalPage() {
		return sqlsession.selectOne(namespace+".board_getTotalPage");
	}
	public List<BoardDTO> page_board_list(PageCount pc) {
		return sqlsession.selectList(namespace+".board_pagingList",pc);
	}

}
