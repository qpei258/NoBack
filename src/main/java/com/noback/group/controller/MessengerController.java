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

import com.noback.group.dao.MessengerDAO;
import com.noback.group.util.PageNavigator;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.MessengerVO;

@Controller
@RequestMapping(value = "messenger")
public class MessengerController {
	
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	
	@Autowired
	MessengerDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "messenger", method = RequestMethod.GET)
	public String multiList(HttpSession session, @RequestParam(value="page1", defaultValue="1") int page1
			, @RequestParam(value="page2", defaultValue="1") int page2
			, @RequestParam(value="search1", defaultValue="1") String search1
			, @RequestParam(value="search2", defaultValue="1") String search2
			, Model model1, Model model2) {
		logger.info("메세지 접속");
		  
		
		int totalmessenger = dao.getTotalmessenger(search1);			//전체 글 개수
		int totalmember = dao.getTotalmember(search2);
		
		
		//페이지 계산을 위한 객체 생성 각각 메세지창과 유저 정보창 (1,2)
		PageNavigator navi1 = new PageNavigator(countPerPage, pagePerGroup, page1, totalmessenger); 
		PageNavigator navi2 = new PageNavigator(countPerPage, pagePerGroup, page2, totalmember); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<MessengerVO> messengerlist = dao.listMessenger(search1, navi1.getStartRecord(), navi1.getCountPerPage());	
		ArrayList<MemberVO> memberlist = dao.listMember(search2, navi2.getStartRecord(), navi2.getCountPerPage());	
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model1.addAttribute("messengerlist", messengerlist);
		model1.addAttribute("navi1", navi1);
		model1.addAttribute("search1", search1);
		
		model2.addAttribute("memberlist", memberlist);
		model2.addAttribute("navi2", navi2);
		model2.addAttribute("search2", search2);
		
		
		return "messenger/messenger";
	}
	@RequestMapping(value = "chat", method = RequestMethod.GET)
	public String chat(String num, Model model) {
		logger.info("메신저챗 접속");
		MessengerVO messenger = dao.messenger(num);
		model.addAttribute("messenger", messenger);
		return "board/chat";
	}
	
	
	
}
