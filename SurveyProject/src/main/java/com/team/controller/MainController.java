package com.team.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team.service.IBoardService;

@Controller
public class MainController {
	
	@Autowired
	private IBoardService bService;
	
	//[첫 메인 페이지]
	@RequestMapping(value = "/")
	public String home(Model model) {
		bService.bestServey(model);
		return "home/main";
	}
}
