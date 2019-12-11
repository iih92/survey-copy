package com.team.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.MemberDAO;
import com.team.dto.MemberDTO;

@Service
public class MemberService implements IMemberService{

	@Autowired
	private MemberDAO dao;

	@Override
	public void signIn(Model model) {
		// TODO Auto-generated method stub
		System.out.println("Service -> signIn 진입");
		
		
		// 모델 받아와서 
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		//스트링에 넣어줌 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("서비스에서의 ID : "+id);
		System.out.println("서비스에서의 PW : "+pw);
		//DAO 소환술!
//		int result = dao.signIn(id, pw);


		MemberDTO dto = new MemberDTO();
		dto = dao.signIn(id, pw);
		
		System.out.println(dto);
		try {
			String gId = dto.getId();
			String gPw = dto.getPw(); 
			
			if(pw.equals(gPw)) {
				//비밀번호 일치 로그인성공
				System.out.println("빔리번호 일치");
				
				//세션생성
				HttpSession session = request.getSession();
	            session.setAttribute("loginUser", dto.getNick());		
				
	            //모델 생성
	            model.addAttribute("rs", "1");
	            
	            
			}else {
				//비밀번호 불일치 로그인 실패 
				System.out.println("비밀번호 불일치");

	            model.addAttribute("rs", "2");
			}
			
				
		}catch(NullPointerException e) {
			System.out.println("널포인트 익셉션 = 일치하는 아이디가 없다.");

            model.addAttribute("rs", "3");
		}
		
		


		System.out.println("Service -> signIn 종료");
		
	
	}

	@Override
	public void signOut(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void signUp(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changePw(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void changeNick(Model model) {
		// TODO Auto-generated method stub
		
	}

	@Override
	   public String[] signIn2(MemberDTO dto) {
	      // TODO Auto-generated method stub
	      
	      String[] result = new String[2];
	      
	      MemberDTO mdto = new MemberDTO();
	      mdto = dao.signIn(dto.getId(), dto.getPw());
	      
	      try {

	         //dto는 사용자가 입력한 값
	         System.out.println("dto >> "+dto.getId()+" "+dto.getPw());
	         //mdto는 데이터베이스에서 얻어온값
	         System.out.println("mdto >> "+mdto.getId()+" "+mdto.getPw());
	         
	         if(dto.getPw().equals(mdto.getPw())) {
	            //비밀번호 일치
	            result[0]="1";
	            result[1]=mdto.getNick();
	            System.out.println("비밀번호 일치 >> "+mdto.getPw()+" "+dto.getPw());
	         }else {
	            //비밀번호 불일치 
	            result[0]="2";
	            System.out.println("비밀번호 불일치 >> "+mdto.getPw()+" "+dto.getPw());
	         }
	         
	      }catch (Exception e) {
	         // 아이디가 없다. 
	         result[0]="3";
	         System.out.println("아이디가 없다.");
	      }
	      
	      return result;
	      
	   }
	
}
