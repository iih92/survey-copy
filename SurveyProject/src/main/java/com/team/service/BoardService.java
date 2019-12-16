package com.team.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.BoardDAO;
import com.team.dto.BoardDTO;

@Service
public class BoardService implements IBoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public int surveySave(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		BoardDTO dto = new BoardDTO();
		String date = request.getParameter("deadline");
		Date deadline = Date.valueOf(date);
		dto.setDeadline(deadline);
		dto.setTitle(request.getParameter("title"));
		dto.setHashtag(request.getParameter("hashtag"));
		dto.setPoint(500);
		String code="";

		// request 객체 안에있는 모든 값을 조회할수 있는 역할
		Enumeration<Object> params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    if(name.equals("title") || name.equals("hashtag") || name.equals("deadline")) { } 
		    else {
		    	code = code + name +":" + request.getParameter(name)+",";		    	
		    }
		}
		dto.setCode(code);
		return dao.surveySave(dto);
	}

	@Override
	public void surveySelect(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO dto = dao.surveySelect(num);
		String code = dto.getCode();
		model.addAttribute("dto",dto);
		model.addAttribute("code", code);
	}

	@Override
	public void surveyModify(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("dto", dao.surveyModify(num));
	}

	@Override
	public int surveyUpdate(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		BoardDTO dto = new BoardDTO();
		String date = request.getParameter("deadline");
		dto.setTitle(request.getParameter("title"));
		dto.setHashtag(request.getParameter("hashtag"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		String code="";

		// request 객체 안에있는 모든 값을 조회할수 있는 역할
		Enumeration<Object> params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    if(name.equals("title") || name.equals("hashtag") || name.equals("deadline")) { } 
		    else {
		    	code = code + name +":" + request.getParameter(name)+",";		    	
		    }
		}
		dto.setCode(code);
		Date deadline = Date.valueOf(date);
		dto.setDeadline(deadline);
		dao.surveyUpdate(dto);
		return dto.getNum();
	}

	@Override
	public void surveyAllSelect(Model model) {
		model.addAttribute("list", dao.surveyAllSelect());
	}

}
