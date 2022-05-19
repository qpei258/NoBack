package com.noback.group.controller;

import javax.servlet.http.HttpSession;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.noback.group.dao.MemberDAO;
import com.noback.group.vo.MemberVO;



@Controller
@RequestMapping(value = "manager")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberDAO dao;
	
	// 로그인으로 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "manager/login";
	}
	
	//로그인처리
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO member, HttpSession session) {
	logger.info("{}", member);
	
		MemberVO member2 = dao.getMember(member.getEmployee_num());
		logger.info("{}", member2);
		if (member2 != null && member2.getEmployee_password().equals(member.getEmployee_password())) {
			session.setAttribute("LoginId", member2.getEmployee_num());
			session.setAttribute("LoginLevel", member2.getEmployee_level());
			return "redirect:/";
		}
		return "redirect:login";
	}
	
	//로그아웃
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.removeAttribute("LoginId");
			session.removeAttribute("LoginLevel");
			return "redirect:/";
		}
	
}
