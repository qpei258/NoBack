package com.noback.group.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping(value = "member")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 로그인으로 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "manager/login";
	}

}
