package com.team.service;

import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.ReplyDAO;
import com.team.dto.ReplyDTO;
@Service
public class ReplyService implements IReplyService{
	@Autowired
	ReplyDAO dao;
	
	@Override
	public void replySave(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		
		//텍스트 에어리어에 담긴 내용을 가져옴.. 
		String content = request.getParameter("wReplyArea");
		System.out.println(content);
		
		//현재 접속한 닉네임 가져옴.. 
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		System.out.println("닉네임 : "+nick);
 
		//현재 설문조사 글번호 가져옴..
		String hnum = request.getParameter("hnum");
		int num = Integer.parseInt(hnum);
		System.out.println("글번호 : "+num); 
		
		ReplyDTO dto = new ReplyDTO();
		dto.setNum(num);
		dto.setContent(content);
		dto.setNick(nick);
		
		
  
 
		
		dao.replySave(dto);
		
		
		
	}

	@Override
	public void replySelect(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String hnum = request.getParameter("num");
		int num = Integer.parseInt(hnum);
		System.out.println("글번호 : "+num); 
		
		model.addAttribute("replyList",dao.replyList(num));
		
	}

	@Override
	public void reReplySave(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String hnum = request.getParameter("hnum");
		int num = Integer.parseInt(hnum); // 글번호
		
		String tcnum = request.getParameter("cnum");
		int cnum = Integer.parseInt(tcnum); // 댓글번호
		
		String content = request.getParameter("reReplyWrite"); // 대댓글 내용 
		
		//현재 접속한 닉네임 가져옴.. 
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		System.out.println("닉네임 : "+nick);
		 
		System.out.println("service의 reReplySave 안쪽 >> 글번호 >>"+num );
		System.out.println("service의 reReplySave 안쪽 >> 댓글번호 >>"+cnum );
		System.out.println("service의 reReplySave 안쪽 >> 댓글내용 >>"+content );
		
		ReplyDTO dto = new ReplyDTO();
		dto.setNick(nick);
		dto.setNum(num);
		dto.setIntent(cnum);
		dto.setContent(content);
		
		dao.reReplySave(dto);
	}
 
}
