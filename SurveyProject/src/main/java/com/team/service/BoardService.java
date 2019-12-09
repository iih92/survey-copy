package com.team.service;

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
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		Enumeration<Object> params = request.getParameterNames();
		System.out.println("----------------------------");
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    System.out.println(name + " : " +request.getParameter(name));
		}
		System.out.println("----------------------------");

		String code = request.getParameter("link");
		String title = request.getParameter("title");
		BoardDTO dto = new BoardDTO();
		dto.setTitle(title);
		dto.setCode(code);
		return dao.surveySave(dto);
	}

	@Override
	public void surveySelect(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("dto", dao.surveySelect(num));	
	}

}
