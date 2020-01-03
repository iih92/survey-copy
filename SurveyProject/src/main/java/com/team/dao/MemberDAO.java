package com.team.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team.dto.MemberDTO;


@Repository
public class MemberDAO {

	private static final String namespaceMember = "Member";
	
	@Autowired
	private SqlSession session;

	//[회원가입]
	public void singUp(MemberDTO dto) {
		session.insert(namespaceMember+".singUp",dto);	
	}
	
	//[아이디 중복체크]
	public int checkOverId(String id) {	
		return session.selectOne(namespaceMember+".checkOverId",id);
	}
	
	//[닉네임 중복체크]
	public int checkOverNick(String nick) {
		return session.selectOne(namespaceMember+".checkOverNick",nick);
	}

	//[로그인]
	public MemberDTO signIn(String id,String pw) {
		return session.selectOne(namespaceMember+".signIn", id);		 
	}
	
	//[비밀번호 변경]
	public void changePw(MemberDTO dto) {
		session.update(namespaceMember + ".changePw", dto);
	}
	
	//[닉네임 변경]
	public void changeNick(MemberDTO dto) {
		session.update(namespaceMember + ".changeNick", dto);
	}
	
	//[포인트 추가]
	public void addPoint(MemberDTO dto) {
		session.update(namespaceMember + ".addPoint", dto);
	}
	
	//[포인트 차감]
	public void MinusPoint(MemberDTO dto) {
		session.update(namespaceMember + ".MinusPoint", dto);
	}
	
	//[포인트 가져오기]
	public MemberDTO userPoint(MemberDTO dto) {
		return session.selectOne(namespaceMember+".userPoint", dto);	 
	}

	//[회원 정보 가져오기]
	public MemberDTO info(MemberDTO dto) {
		return session.selectOne(namespaceMember + ".info", dto);	 
	}

	//[회원 탈퇴]
	public void leave(MemberDTO dto) {
		session.delete(namespaceMember + ".leave", dto);	
	}

}
