/**
 * @author 정수현
 * 마이페이지  컨트롤러
 */

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
@RequestMapping("mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageDAO dao;
	
	//게시판 관련 상수값들
	final int countPerPage = 10;		
	final int pagePerGroup = 5;				
	final String uploadPath = "/boardfile";	
		
	/**
	 * 마이페이지로 이동
	 */
	@RequestMapping(value = "mypage", method = RequestMethod.GET) 
	public String showMypage()
			throws Exception {
		logger.info("마이페이지 페이지 로딩성공");
		return "mypage/mypage"; 
	}
	
	/**
	 * 개인정보 수정 페이지 로딩
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET) 
	public String showMyupdate(Model model, HttpSession session)
			throws Exception {
		logger.info("개인수정 페이지 로딩성공");
		// 세션에서 ID가져오기
		String searchId = (String) session.getAttribute("LoginId");
		MemberVO member = dao.getMember(searchId);
		// 멤버 객체를 model에 저장
		model.addAttribute("member", member);
		return "mypage/myUpdate"; 
	}
	
	
	/**
	 * 개인정보 수정 @RequestParam
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(HttpSession session, MemberVO member) {
		String searchId = (String) session.getAttribute("LoginId");
		member.setEmployee_num(searchId);
		
		// 수정 dao로
		int result = dao.updateMember(member);
		logger.info("member", member);
		session.setAttribute("LoginLv", member.getEmployee_level());
		return "mypage/mypage";	
	}
	
	/**
	 * 마이페이지-내 게시글로 이동
	 * 내가 쓴 글만 모아보기
	 */
	@RequestMapping(value = "board", method = RequestMethod.GET) 
	public String showMyboard(@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, Model model) {
		logger.debug("page: {}", page);
		
		// 내가 쓴 글 개수
		int total = dao.getTotal(searchText);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 	
		
		logger.info("마이 게시글 페이지 로딩성공");
		//게시글 리스트 저장
		ArrayList<BoardVO> boardlist  = dao.list(searchText, navi.getStartRecord(), navi.getCountPerPage());		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("myboardlist", boardlist);
		model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "mypage/myBoard"; 
	}
	
	/**
	 * 마이페이지-게시글-글상세 읽기
	 */
	@RequestMapping(value = "readBoard", method = RequestMethod.GET)
	public String readMyboard(String board_num, Model model) {
		logger.info("게시글 접속");
		BoardVO board = dao.board(board_num);
		model.addAttribute("board", board);
		return "mypage/myBoardForm";
	}
	

	/**
	 * 마이페이지-내 스케줄로 이동
	 */
	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String showMyschedule() {
		logger.info("마이 스케줄 페이지 로딩성공");
		
		return "mypage/mySchedule"; 
	}

}