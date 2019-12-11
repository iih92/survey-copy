package com.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.BoardDTO;

@Repository
public class BoardDAO {
	
	private static final String namespace = "Board";
	
	@Autowired
	private SqlSession sqlsession;
	
	public int surveySave(BoardDTO dto) {
		sqlsession.insert(namespace + ".surveySave", dto);	
		return sqlsession.selectOne(namespace + ".currentNum");
	}

	public BoardDTO surveySelect(int num) {
		return sqlsession.selectOne(namespace + ".surveySelect", num);
	}

}
