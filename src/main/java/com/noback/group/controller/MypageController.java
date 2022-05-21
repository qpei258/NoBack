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

import com.noback.group.dao.MypageDAO;
import com.noback.group.vo.*;
import com.noback.group.util.*;

@Controller
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageDAO dao;
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
		
		
	/**
	 * 마이페이지로 이동
	 */
	@RequestMapping(value = "mypage/update", method = RequestMethod.GET) 
	public String showMypage(Model model, HttpSession session)
			throws Exception {
		logger.info("마이페이지 페이지 로딩성공");
		
		// 세션에서 ID가져오기
		String searchId = (String) session.getAttribute("LoginId");
		MemberVO member = dao.getMember(searchId);
		// 멤버 객체를 model에 저장
		model.addAttribute("member", member);
		return "mypage/mypage"; 
	}
	
	/**
	 * 개인정보 수정
	 */
	@RequestMapping(value = "updateinfo", method = RequestMethod.POST)
	public String update(HttpSession session, @RequestParam MemberVO member) {
		logger.info("회원정보수정 페이지 로딩 성공");
		
		String searchId = (String) session.getAttribute("LoginId");
		member.setEmployee_num(searchId);
		int result = dao.updateMember(searchId);
		session.setAttribute("LoginLv", member.getEmployee_level());
		return "redirect:/";	
	}
	
	/**
	 * 마이페이지-내 게시글로 이동
	 */
	@RequestMapping(value = "mypage/board", method = RequestMethod.GET) 
	public String showMyboard(@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, Model model) {
		logger.debug("page: {}", page);
		
		int total = dao.getTotal(searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 	
		
		logger.info("마이 게시글 페이지 로딩성공");
		
		ArrayList<BoardVO> boardlist  = dao.list(searchText, navi.getStartRecord(), navi.getCountPerPage());		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("myboardlist", boardlist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		
		return "mypage/myBoard"; 
	}
	

	/**
	 * 마이페이지-내 스케줄로 이동
	 */
	@RequestMapping(value = "mypage/schedule", method = RequestMethod.GET) 
	public String showMyschedule() {
		logger.info("마이 스케줄 페이지 로딩성공");
		
		return "mypage/mySchedule"; 
	}

}