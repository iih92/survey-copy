package com.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.MemberDTO;

@Repository
public class MemberDAO {

	private static final String namespace = "Member";
	
	@Autowired
	private SqlSession session;
	
	
	public MemberDTO signIn(String id,String pw) {
		System.out.println("MemberDAO -> signIn 메소드 진입"); 

		MemberDTO dto = new MemberDTO();

		System.out.println("MemberDAO -> signIn 메소드 종료"); 
		
		return dto = session.selectOne(namespace+".signIn", id);

		 
	}
	
	
}
