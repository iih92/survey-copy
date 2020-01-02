package com.team.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team.service.IBoardService;

@Controller
public class MainController {
	
	@Autowired
	private IBoardService bService;

	@RequestMapping(value = "/")
	public String home(Model model) {
		bService.bestServey(model);
		return "home/main";
	}
}
