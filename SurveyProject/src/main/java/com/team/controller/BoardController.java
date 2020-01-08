package com.team.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.team.dto.BoardDTO;
import com.team.dto.TakeSurvey;
import com.team.service.IBoardService;
import com.team.service.IMemberService;
import com.team.service.IReplyService;

@Controller
public class BoardController {

	@Autowired
	private IBoardService bService;
	@Autowired
	private IReplyService rService;
	@Autowired
	private IMemberService mService;
	
	//[로그인 후 메인페이지]
	@RequestMapping(value = "mainpage")
	public String mainPage(Model model, HttpServletRequest request, HttpSession session) {
		model.addAttribute("request",request);   
		mService.userPoint(model);
		bService.pageBoardList(model);
		bService.pagingNum(model,1); 
		bService.bestSurvey(model);
		return "Main/main";
	}
	

	//[정렬]
	@RequestMapping(value="lineupMain")
	public String lineupMain(Model model, HttpServletRequest request,HttpSession session) {
		session.setAttribute("lineupSession", request.getParameter("lineup"));
		return "redirect:mainpage";
	}	

	//[게시글 작성 페이지]
	@RequestMapping(value = "board")
	public String board() {
		return "board/board";
	}

	//[게시글 저장]
	@RequestMapping(value = "surveySave")
	public String surveySave(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		/*포인트 차감 및 포인트 가져오기*/
		mService.minusPoint(model);
		mService.userPoint(model);
		int num = bService.surveySave(model);

		if(num != 0) {
			redirect.addAttribute("num",num);
			return "redirect:boarddetail";			
		} else {
			return "redirect:mainpage";		
		}

	}

	//[게시글 보기]
	@RequestMapping(value = "boarddetail")
	public String surveySelect(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		bService.surveySelect(model);
		rService.replySelect(model);
		return "board/boardDetail";
	}

	//[게시글 수정 페이지]
	@RequestMapping(value = "boardmodify")
	public String surveyModify(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		bService.surveyModify(model);
		return "board/boardModify";
	}

	//[게시글 수정]
	@RequestMapping(value = "surveyUpdate")
	public String surveyUpdate(Model model, HttpServletRequest request, RedirectAttributes redirect) {
		model.addAttribute("request", request);
		int num = bService.surveyUpdate(model);
		if(num != 0) {
			redirect.addAttribute("num",num);
			return "redirect:boarddetail";			
		} else {
			return "redirect:mainpage";		
		}
	}

	//[게시글 삭제]
	@RequestMapping(value="boardDelete")
	public String boardDelete(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		bService.surveyDelete(model);
		return "redirect:mainpage";
	}

	//[게시글 검색]
	@RequestMapping(value="search")
	public String search(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		bService.surveySearch(model);
		return "board/search";
	}

	//[설문조사 투표]
	@RequestMapping(value="vote")
	public String vote(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		int num = bService.surveyVote(model);	
		/*참여한 설문조사 저장하기*/
		bService.takeSurvey(num, model);
		mService.addPoint(model);
		mService.userPoint(model);
		return "redirect:mainpage";
	}

	//[설문조사 결과 페이지]
	@RequestMapping(value = "result")
	public String resultpPage(Model model,HttpServletRequest request) {
		model.addAttribute("request", request);
		bService.surveySelect(model);
		return "board/result";
	}

	//[설문조사 결과 데이터 가져오기]
	@RequestMapping(value = "result.do")
	@ResponseBody
	public String[] result(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		String[] answer = bService.surveyResult(model);
		return answer;
	}
	
	//[마이페이지 페이징 처리(나의 설문조사)]
	@RequestMapping(value = "page.do")
	@ResponseBody
	public List<BoardDTO> page(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	
		return bService.pageBoardListNick(model);
	}
	
	//[마이페이지 페이징 처리(최근 설문조사)]
	@RequestMapping(value = "page2.do")
	@ResponseBody
	public List<TakeSurvey> page2(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);	
		return bService.pageBoardListTake(model);
	}

}
