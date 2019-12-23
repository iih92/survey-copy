package com.team.service;

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
		//현재 접속한 닉네임 가져옴.. 
		HttpSession session = request.getSession();
		String nick = (String) session.getAttribute("loginUser");
		//현재 설문조사 글번호 가져옴..
		String hnum = request.getParameter("hnum");
		int num = Integer.parseInt(hnum);
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
		
		ReplyDTO dto = new ReplyDTO();
		dto.setNick(nick);
		dto.setNum(num);
		dto.setIntent(cnum);
		dto.setContent(content);
		dao.reReplySave(dto);
	}

	@Override
	public void replyDelete(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");	
		
		String cnum = request.getParameter("cnum");	
		dao.replyDelete(cnum);		
	}

	@Override
	public void replyUpdate(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		ReplyDTO dto = new ReplyDTO();
		String cnum_string = request.getParameter("cnum");
		int cnum = Integer.parseInt(cnum_string);
		
		dto.setCNum(cnum);
		dto.setContent(request.getParameter("replyUpdate"));
		dao.replyUpdate(dto);
	}
 
}
