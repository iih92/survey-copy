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
	
	//회원가입
	public void singUp(MemberDTO dto) {
		System.out.println(dto);
		session.insert(namespace+".singUp",dto);
		
	}
	
	//아이디 중복체크
	public int checkOverId(String id) {	
		System.out.println("중복체크하는 아이디 :" + id);
		return session.selectOne(namespace+".checkOverId",id);
	}
	
	//닉네임 중복체크
	public int checkOverNick(String nick) {
		System.out.println("중복체크하는 닉네임 :" + nick);
		return session.selectOne(namespace+".checkOverNick",nick);
	}
		
}
