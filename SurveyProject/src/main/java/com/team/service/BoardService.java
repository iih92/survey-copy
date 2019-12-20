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
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.team.dao.BoardDAO;
import com.team.dto.BoardDTO;
import com.team.dto.PageCount;
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

	/*페이징 처리--------------------------------------------------------------------*/
	@Override
	public PageCount pagingNum(Model model) {
		int start = 0;

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		// start 값 가져오기
		if(request.getParameter("start") == null ) start = 0;
		else start = Integer.parseInt(request.getParameter("start"));

		// 맨처음 리뷰게시판 들어올때 
		if(start == 0) start=1;      

		// 페이지에 보여줄 게시글 갯수
		int pageNum=8;

		// 전체 게시글 갯수 가져오기
		int totalPage = getTotalPage();

		// 전체 게시글 갯수 / 페이지 보여줄 게시글 갯수 + (나머지 값이 있으면 + 1) 마지막 페이지 번호를 정하는 식
		int totEndPage = totalPage/pageNum + (totalPage%pageNum == 0 ?0 :1);

		// 페이지 넘버를 눌렀을때 첫번째 상단에 보여줄 게시글 번호 
		int startPage = (start - 1) * pageNum + 1;

		// 페이지 넘버를 눌렀을 때 마지막에 보여줄 게시글 번호
		int endPage = pageNum * start;

		//PageCount dto에 변수 저장
		PageCount pc = new PageCount();
		pc.setTotEndPage(totEndPage);
		pc.setStartPage(startPage);
		pc.setEndPage(endPage);

		model.addAttribute("pc", pc);
		return pc;         
	}

	private int getTotalPage() {
		return dao.getTotalPage();
	}

	@Override
	public void page_board_list(Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		HttpSession session = request.getSession(); 
		
		try {
			if(session.getAttribute("lineupSession")==null) {
				System.out.println("세션이 널이다.");
				model.addAttribute("list", dao.page_board_list(pagingNum(model)));
			}
			else if(session.getAttribute("lineupSession").equals("1")) {
				System.out.println("세션이 1이다.");
				model.addAttribute("list", dao.page_board_list(pagingNum(model)));
			}else if(session.getAttribute("lineupSession").equals("2")) {
				System.out.println("세션이 2다.");
	 			model.addAttribute("list", dao.page_board_list_dead((pagingNum(model))));
			}else if(session.getAttribute("lineupSession").equals("3")) {
				System.out.println("세션이 3이다.");
				model.addAttribute("list", dao.page_board_list_hit((pagingNum(model))));
			}
			
			
		}catch(NullPointerException e) {
			System.out.println("트라이캐치 >> 널포인터익셉션.");
			
		}


 
		

	}
	/*-----------------------------------------------------------------------*/
}
