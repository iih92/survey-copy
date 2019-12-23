package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.ReplyDTO;

@Repository
public class ReplyDAO {
	private static final String namespace = "Reply";
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public void replySave(ReplyDTO dto) {
		// TODO Auto-generated method stub 
		sqlsession.insert(namespace+".replySave",dto); 
	}


	public List<ReplyDTO> replyList(int num) {
		// TODO Auto-generated method stub
		return sqlsession.selectList(namespace+".replyList",num);
	}


	public void reReplySave(ReplyDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.insert(namespace+".reReplySave",dto);
	}


	public void replyDelete(String cnum) {
		// TODO Auto-generated method stub
		sqlsession.delete(namespace+".replyDelete",cnum);
	}


	public void replyUpdate(ReplyDTO dto) {
		// TODO Auto-generated method stub
		sqlsession.update(namespace+".replyUpdate",dto);
	}

}
