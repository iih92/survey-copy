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
		
		int num = 0;
		try {
			sqlsession.insert(namespace + ".surveySave", dto);				
			num = sqlsession.selectOne(namespace + ".currentNum");
		} catch (Exception e) { }
		return num;
	}

	public BoardDTO surveySelect(int num) {
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

}
