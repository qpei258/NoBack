package com.noback.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noback.group.dao.MemberDAO;
import com.noback.group.dao.NoticeDAO;
import com.noback.group.util.PageNavigator;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.NoticeVO;

/**
 * 메인 콘트롤러
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 메인 화면으로 이동
	 */
	
	@Autowired
	NoticeDAO ndao;
	
	@Autowired
	MemberDAO mdao;
	//홈화면 
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="search", defaultValue="") String search
			, Model model) {
		int total = ndao.getTotal(search);	
		
		String id = (String) session.getAttribute("LoginId");
		
		MemberVO member = mdao.getMember(id);
		
		PageNavigator navi = new PageNavigator(5, 1, page, total); 
		ArrayList<NoticeVO> noticelist = ndao.list(search, navi.getStartRecord(), navi.getCountPerPage());	
		
		model.addAttribute("member", member);
		model.addAttribute("noticelist", noticelist);
		logger.info("홈 실행");
		return "home";
	}
	

}
