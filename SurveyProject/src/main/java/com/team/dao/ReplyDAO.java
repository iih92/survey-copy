package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.ReplyDTO;

@Repository
public class ReplyDAO {
	private static final String namespaceReply = "Reply";
	
	@Autowired
	private SqlSession sqlsession;
	
	//[댓글 저장]
	public void replySave(ReplyDTO dto) {
		sqlsession.insert(namespaceReply+".replySave",dto); 
	}

	//[댓글 가져오기]
	public List<ReplyDTO> replyList(int num) {
		return sqlsession.selectList(namespaceReply+".replyList",num);
	}

	//[대댓글 저장]
	public void reReplySave(ReplyDTO dto) {
		sqlsession.insert(namespaceReply+".reReplySave",dto);
	}
	
	//[댓글 삭제]
	public void replyDelete(String cnum) {
		sqlsession.delete(namespaceReply+".replyDelete",cnum);
	}
	
	//[댓글 수정]
	public void replyUpdate(ReplyDTO dto) {
		sqlsession.update(namespaceReply+".replyUpdate",dto);
	}

}
