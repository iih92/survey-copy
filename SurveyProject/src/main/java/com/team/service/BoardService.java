package com.team.service;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
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
		String code="";
		BoardDTO dto = new BoardDTO();
		Enumeration<Object> params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    if(name.equals("title")) { } 
		    else {
		    	code = code + name +":" + request.getParameter(name)+",";		    	
		    }
		}		
		dto.setTitle(request.getParameter("title"));
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

}
