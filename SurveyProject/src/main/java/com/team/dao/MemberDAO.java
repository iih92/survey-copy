package com.team.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.MemberDTO;
import com.team.dto.TakeSurvey;

@Repository
public class MemberDAO {

	private static final String namespace = "Member";
	
	@Autowired
	private SqlSession session;

	//[회원가입]
	public void singUp(MemberDTO dto) {
		session.insert(namespace+".singUp",dto);	
	}
	
	//[아이디 중복체크]
	public int checkOverId(String id) {	
		return session.selectOne(namespace+".checkOverId",id);
	}
	
	//[닉네임 중복체크]
	public int checkOverNick(String nick) {
		return session.selectOne(namespace+".checkOverNick",nick);
	}

	//[로그인]
	public MemberDTO signIn(String id,String pw) {
		return session.selectOne(namespace+".signIn", id);		 
	}
	
	//[비밀번호 변경]
	public void changePw(MemberDTO dto) {
		session.update(namespace + ".changePw", dto);
	}
	
	//[닉네임 변경]
	public void changeNick(MemberDTO dto) {
		session.update(namespace + ".changeNick", dto);
	}
	
	//[포인트 추가]
	public void addPoint(MemberDTO dto) {
		session.update(namespace + ".addPoint", dto);
	}
	
	//[포인트 차감]
	public void MinusPoint(MemberDTO dto) {
		session.update(namespace + ".MinusPoint", dto);
	}
	
	//[포인트 가져오기]
	public MemberDTO userPoint(MemberDTO dto) {
		return session.selectOne(namespace+".userPoint", dto);	 
	}

	//[회원 정보 가져오기]
	public MemberDTO info(MemberDTO dto) {
		return session.selectOne(namespace + ".info", dto);	 
	}

	//[회원 탈퇴]
	public void leave(MemberDTO dto) {
		session.delete(namespace + ".leave", dto);	
	}

}
