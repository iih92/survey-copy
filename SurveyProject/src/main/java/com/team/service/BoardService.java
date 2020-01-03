package com.team.service;

import java.sql.Date;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.team.dao.BoardDAO;
import com.team.dto.BoardDTO;
import com.team.dto.PageCount;
import com.team.dto.TakeSurvey;
import com.team.dto.VoteDTO;

@Service
public class BoardService implements IBoardService {

	@Autowired
	private BoardDAO dao;

	//[게시글 저장]
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
		dto.setBoardIcon(request.getParameter("boardIcon"));
		
		String P = request.getParameter("point");
		int point =  Integer.parseInt(P) * 100;
		dto.setPoint(point);
		
		String code="";

		/*request 객체 안에있는 모든 값을 조회할수 있는 역할*/
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

	//[게시글 가져오기]
	@Override
	public void surveySelect(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));	
		BoardDTO dto = dao.surveySelect(num);
		String code = dto.getCode();	
		/*설문 중복 참여 검사*/
		List<String> voteUser = dao.VoteSelect(num);
		model.addAttribute("dto",dto);
		model.addAttribute("code", code);
		model.addAttribute("voteUser", voteUser);
	}

	//[게시글 수정하기 위한 페이지 가져오기]
	@Override
	public void surveyModify(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("dto", dao.surveyModify(num));
	}

	//[게시글 수정하기]
	@Override
	public int surveyUpdate(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		BoardDTO dto = new BoardDTO();
		String date = request.getParameter("deadline");
		dto.setTitle(request.getParameter("title"));
		dto.setHashtag(request.getParameter("hashtag"));
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setBoardIcon(request.getParameter("boardIcon"));
		String code="";

		/*request 객체 안에있는 모든 값을 조회할수 있는 역할*/
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

	//[게시글 다 가져오기]
	@Override
	public void surveyAllSelect(Model model) {
		model.addAttribute("list", dao.surveyAllSelect());
	}

	//[게시글 삭제]
	@Override
	public void surveyDelete(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");	
		int num = Integer.parseInt(request.getParameter("num"));
		model.addAttribute("dto", dao.surveyDelete(num));
	}

	//[게시글 검색]
	@Override
	public void surveySearch(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String hashtag = request.getParameter("hashtag");
		model.addAttribute("list",dao.surveySearch(hashtag));
		model.addAttribute("searchHash",hashtag);

	}

	//[투표결과 저장하기]
	@Override
	public int surveyVote(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		/*세션값 받아오기*/
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");	
		
		VoteDTO dto = new VoteDTO();
		String result = "";
		int num = Integer.parseInt(request.getParameter("num"));
		Enumeration<Object> params = request.getParameterNames();
		
		while (params.hasMoreElements()){
			String name = (String)params.nextElement();
			if(name.equals("num")) {
				dto.setNum(num);
				dto.setNick(loginUser);
			}else if(name.equals("point")){			
			}else if(name.substring(0,1).equals("C")) {
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

	//[투표결과 가져오기]
	@Override
	public String[] surveyResult(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		List<VoteDTO> list = dao.surveyResult(num);
		/* 전체 설문조사 결과 저장용 배열 */
		String[] mix = null;
		/* !로 스플릿 하고 저장하기 위한 변수 */
		String[] first= {};
		for (int i = 0; i < list.size(); i++) {
			first = list.get(i).getResult().split("!");
			for (int j = 0; j < first.length; j++) {
				/* 문제 문항 갯수만큼 배열 생성 */
				if(mix == null) {
					mix = new String[(first.length)+1];
					/* 참가 인원을 배열 마지막에 추가 */
					mix[(first.length)] = Integer.toString(list.size());
				}
				/* : 로 스플릿 하고 저장하기 */
				String[] second = first[j].split(":");
				for (int qa = 0; qa < second.length; qa++) {
					if(i > 0) {
						/* 두 번째 for문 부턴 전에 있던 값이랑 같이 저장 */
						int an = 0;
						if(second[qa].equals(second[an])) {
							mix[j] = mix[j]+second[qa+1];
							an=an+2;
						}
					} else {
						/* 첫 for문엔 그냥 값 저장 */
						if(qa%2 == 0) {
							mix[j] = second[qa] + ":" + second[qa+1];
						}			
					}
				}
			}
		}
		return mix;
	}

	
	//[페이징 처리--------------------------------------------------------------------]
	
	//[페이징 수 계산하기]
	@Override
	public PageCount pagingNum(Model model, int daoNum) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");	
		/*세션값 받아오기*/
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");
		
		int start = 0;
		/* start 값 가져오기 */
		if(request.getParameter("start") == null ) start = 0;
		else start = Integer.parseInt(request.getParameter("start"));
		/* 맨처음 리뷰게시판 들어올때 */
		if(start == 0) start=1;      
		/* 페이지에 보여줄 게시글 갯수 */
		int pageNum=8;	
		int totalPage = 0;
		int totEndPage = 0;
		int startPage = 0;
		int endPage = 0;
		
		if(daoNum == 1) {
			totalPage = getTotalPage();
			totEndPage = totalPage/pageNum + (totalPage%pageNum == 0 ?0 :1);
			startPage = (start - 1) * pageNum + 1;
			endPage = pageNum * start;
			
			PageCount pc = new PageCount();
			pc.setTotEndPage(totEndPage);
			pc.setStartPage(startPage);
			pc.setEndPage(endPage);
			pc.setNick(loginUser);
			model.addAttribute("pc", pc);
			return pc; 
			
		}else if(daoNum == 2) {
			totalPage = getTotalPage_nick(loginUser);
			totEndPage = totalPage/pageNum + (totalPage%pageNum == 0 ?0 :1);
			startPage = (start - 1) * pageNum + 1;
			endPage = pageNum * start;
			
			PageCount pc2 = new PageCount();
			pc2.setTotEndPage(totEndPage);
			pc2.setStartPage(startPage);
			pc2.setEndPage(endPage);
			pc2.setNick(loginUser);
			model.addAttribute("pc2", pc2);		
			return pc2; 
			
		}else{
			totalPage = getTotalPage_take(loginUser);
			totEndPage = totalPage/pageNum + (totalPage%pageNum == 0 ?0 :1);
			startPage = (start - 1) * pageNum + 1;
			endPage = pageNum * start;
			
			PageCount pc3 = new PageCount();
			pc3.setTotEndPage(totEndPage);
			pc3.setStartPage(startPage);
			pc3.setEndPage(endPage);
			pc3.setNick(loginUser);
			model.addAttribute("pc3", pc3);	
			return pc3; 
		}
	}
	
	//[페이징 전체 행수 가져오기]
	private int getTotalPage() { return dao.getTotalPage(); }
	private int getTotalPage_nick(String loginUser) { return dao.getTotalPage_nick(loginUser); }
	private int getTotalPage_take(String loginUser) { return dao.getTotalPage_take(loginUser); }
	
	//[페이징 된대로 가져오기_내가 등록한 설문조사]
	@Override
	public List<BoardDTO> page_board_list_nick(Model model) {
		model.addAttribute("list", dao.page_board_list_nick(pagingNum(model,2)));
		return dao.page_board_list_nick(pagingNum(model,2));
	}
	
	//[페이징 된대로 가져오기_최근 한 설문조사]
	@Override
	public List<TakeSurvey> page_board_list_take(Model model) {
		model.addAttribute("Tdto", dao.page_board_list_take(pagingNum(model,3)));
		return dao.page_board_list_take(pagingNum(model,3));	
	}
	
	//[페이징 된대로 가져오기_main 및 각각 정렬기능]
	public void page_board_list(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");		
		HttpSession session = request.getSession(); 
		
		try {
			if(session.getAttribute("lineupSession") == null) {
				model.addAttribute("list", dao.page_board_list(pagingNum(model,1)));
			} else if(session.getAttribute("lineupSession").equals("1")) {
				model.addAttribute("list", dao.page_board_list(pagingNum(model,1)));
			} else if(session.getAttribute("lineupSession").equals("2")) {
	 			model.addAttribute("list", dao.page_board_list_dead((pagingNum(model,1))));
			} else if(session.getAttribute("lineupSession").equals("3")) {
				model.addAttribute("list", dao.page_board_list_hit((pagingNum(model,1))));
			}	
		} catch(NullPointerException e) {}
	}
	
	//[------------------------------------------------------------------------------------]
	
	//[참여한 설문조사 등록]
	@Override
	public void takeSurbey(int num, Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		/*세션값 받아오기*/
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");		
		BoardDTO dto = dao.surveySelect(num);	
		TakeSurvey Tdto = new TakeSurvey();
		Tdto.setBnum(num);
		Tdto.setTitle(dto.getTitle());
		Tdto.setPoint(dto.getPoint());
		Tdto.setDeadline(dto.getDeadline());
		Tdto.setHit(dto.getHit());
		Tdto.setNick(loginUser);	
		dao.takeSurbey(Tdto);
	}
	
	//[참여한 설문조사 검색(최신순)]
	@Override
	public void TakeSurbeySearch(Model model) {
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		//세션값 받아오기
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");		
		model.addAttribute("Tdto",dao.TakeSurbeySearch(loginUser));
	}
	
	//[포인트 내역 가져오기]
	@Override
	public void pointHistory(Model model) {
		// TODO Auto-generated method stub
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		String loginUser = (String) session.getAttribute("loginUser");		 
		model.addAttribute("pointHistory",dao.pointHistory(loginUser)); 
		model.addAttribute("dateSecond",dao.dateSecond(loginUser)); 	 
	}
	
	//[]
	@Override
	public List<String> ajax_getDatesecond(Model model) {Map<String,Object> map = model.asMap();
	HttpServletRequest request = (HttpServletRequest)map.get("request");
	HttpSession session = request.getSession();
	String loginUser = (String) session.getAttribute("loginUser");	
		return dao.dateSecond(loginUser);
	}
	
	//[]
	@Override
	public List<TakeSurvey> ajax_pointHistory(Model model) {Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();String loginUser = (String) session.getAttribute("loginUser");	
		return dao.pointHistory(loginUser);
	}
	
	//[엑셀로 만들기 위한 데이터 받기]
	public String[] surveyQuestion(Model model) {
		String[] result = new String[2];
		Map<String,Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		int num = Integer.parseInt(request.getParameter("num"));
		BoardDTO dto = dao.surveySelect(num);
		result[0] = dto.getTitle();
		result[1] = dto.getCode();
		return result;
	}

	//[best 설문조사 가져오기]
	@Override
	public void bestServey(Model model) {
		model.addAttribute("bestSurvey",dao.bestServey());	
	} 
	
}
