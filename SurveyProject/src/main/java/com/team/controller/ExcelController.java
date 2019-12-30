package com.team.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team.service.ExcelService;
import com.team.service.IBoardService;

@Controller
public class ExcelController {

	@Autowired
	private IBoardService bservice;
	
	@RequestMapping(value="makeExcel.do", method=RequestMethod.GET)
	@ResponseBody
	public void makeExcel(Model model,HttpServletRequest request) throws Exception{
		model.addAttribute("request",request);
		String[] result = bservice.surveyResult(model);
		String[] info = bservice.surveyQuestion(model);
		String title = info[0];
		String question = info[1];
		ExcelService.makeExcel(title + ".xls", result, question);

	}
}
