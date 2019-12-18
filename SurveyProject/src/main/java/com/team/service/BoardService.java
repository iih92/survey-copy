package com.team.service;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.dao.BoardDAO;
import com.team.dto.BoardDTO;
import com.team.dto.VoteDTO;

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
		dto.setNick(request.getParameter("nick"));
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

	@Override
	public void surveyDelete(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("dto", dao.surveyDelete(num));
		
	}

	@Override
	public void surveySearch(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String hashtag = request.getParameter("hashtag");
		model.addAttribute("list",dao.surveySearch(hashtag));
		
	}

	@Override
	public int surveyVote(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		VoteDTO dto = new VoteDTO();
		String result = "";
		int num = Integer.parseInt(request.getParameter("num"));
		Enumeration<Object> params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    if(name.equals("num")) {
		    	dto.setNum(num);
		    } else if(name.substring(0,1).equals("C")) {
		    	String[] chbox = request.getParameterValues(name);
		    	result += name + ":";
		    	for (int i = 0; i < chbox.length; i++) {
					result += chbox[i] + ",";
				}
		    	result += "!";
		    } else {
		    	result += name + ":" + request.getParameter(name)+",!";		    	
		    }
		}
		dto.setResult(result);	    	
		dao.surveyVote(dto);
		return num;
	}

	@Override
	public String[] surveyResult(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
 		List<VoteDTO> list = dao.surveyResult(num);
 		// 전체 설문조사 결과 저장용 배열
 		String[] mix = null;
 		// !로 스플릿 하고 저장하기 위한 변수
		String[] first= {};
		for (int i = 0; i < list.size(); i++) {
			first = list.get(i).getResult().split("!");
			for (int j = 0; j < first.length; j++) {
				// 문제 문항 갯수만큼 배열 생성
				if(mix == null) {
					mix = new String[(first.length)+1];
					// 참가 인원을 배열 마지막에 추가
					mix[(first.length)] = Integer.toString(list.size());
				}
				// : 로 스플릿 하고 저장하기
				String[] second = first[j].split(":");
				for (int qa = 0; qa < second.length; qa++) {
					if(i > 0) {
						// 두 번째 for문 부턴 전에 있던 값이랑 같이 저장
						int an = 0;
						if(second[qa].equals(second[an])) {
							mix[j] = mix[j]+second[qa+1];
							an=an+2;
						}
					} else {
						// 첫 for문엔 그냥 값 저장
						if(qa%2 == 0) {
							mix[j] = second[qa] + ":" + second[qa+1];
						}			
					}
				}
			}
		}
		return mix;
	}
}
