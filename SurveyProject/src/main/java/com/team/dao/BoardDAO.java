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

	//[게시글 저장]
	public int surveySave(BoardDTO dto) {	
		int num = 0;
		try {
			sqlsession.insert(namespace + ".surveySave", dto);				
			num = sqlsession.selectOne(namespace + ".currentNum");
		} catch (Exception e) { System.out.println(e); }
		return num;
	}

	//[지정 게시글 가져오기]
	public BoardDTO surveySelect(int num) {
		//[조회수 증가]
		sqlsession.update(namespace + ".up", num);
		return sqlsession.selectOne(namespace + ".surveySelect", num);
	}

	//[수정할 게시글 가져오기]
	public BoardDTO surveyModify(int num) {
		return sqlsession.selectOne(namespace + ".surveySelect", num);
	}

	//[게시글 수정하기]
	public int surveyUpdate(BoardDTO dto) {
		int num = 0;
		try {
			sqlsession.insert(namespace + ".surveyUpdate", dto);				
			num = sqlsession.selectOne(namespace + ".currentNum");
		} catch (Exception e) { }
		return num;
	}

	//[모든 게시글 가져오기]
	public List<BoardDTO> surveyAllSelect() {
		return sqlsession.selectList(namespace + ".surveyAllSelect");
	}

	//[게시글 삭제하기]
	public Object surveyDelete(int num) {
		return sqlsession.delete(namespace + ".surveyDelete", num);
	}

	//[게시글 검색하기]
	public List<BoardDTO> surveySearch(String hashtag) {
		return sqlsession.selectList(namespace + ".surveySearch",hashtag);
	}

	//[투표 결과 저장하기]
	public void surveyVote(VoteDTO dto) {
		sqlsession.insert(namespace + ".surveyVote", dto);
	}

	//[투표 결과 가져오기]
	public List<VoteDTO> surveyResult(int num) {
		return sqlsession.selectList(namespace + ".surveyResult", num);
	}

	/*Paging 메소드*/
	public int getTotalPage() {
		return sqlsession.selectOne(namespace+".board_getTotalPage");
	}
	
	//[최신순으로 정렬하기]
	public List<BoardDTO> page_board_list(PageCount pc) {
		return sqlsession.selectList(namespace+".board_pagingList",pc);
	}
	
	//[마감 날짜로 정렬하기]
	public List<BoardDTO> page_board_list_dead(PageCount pc) {
		return sqlsession.selectList(namespace+".board_pagingList_deadline",pc);
	}
	
	//[조회순으로 정렬하기]
	public List<BoardDTO> page_board_list_hit(PageCount pc) {
		return sqlsession.selectList(namespace+".board_pagingList_hit",pc);
	}

}
