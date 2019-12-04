package com.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {

	@RequestMapping(value = "/")
	public String home() {
		return "main/home";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login/login";
	}
	
	@RequestMapping(value = "/register")
	public String register() {
		return "login/register";
	}

	@RequestMapping(value = "/main")
	public String main() {
		return "include/main";
	}

}
