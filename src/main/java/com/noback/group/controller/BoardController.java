package com.noback.group.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/boardfile";	//파일 업로드 경로
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(HttpSession session, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="search", defaultValue="") String search
			, Model model) {
		logger.info("게시판 접속");
		return "board/boardList";
	}
	
}
