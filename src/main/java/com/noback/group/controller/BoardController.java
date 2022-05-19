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

import com.noback.group.dao.BoardDAO;
import com.noback.group.util.PageNavigator;
import com.noback.group.vo.BoardVO;

@Controller
@RequestMapping(value = "board")
public class BoardController {
	
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/boardfile";	//파일 업로드 경로
	
	@Autowired
	BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(HttpSession session, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="search", defaultValue="") String search
			, Model model) {
		logger.info("게시판 접속");
		
		int total = dao.getTotal(search);			//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<BoardVO> boardlist = dao.list(search, navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("boardlist", boardlist);
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		
		return "board/boardList";
	}
	
	@RequestMapping(value = "board", method = RequestMethod.GET)
	public String board(String num, Model model) {
		logger.info("게시글 접속");
		BoardVO board = dao.board(num);
		model.addAttribute("board", board);
		return "board/board";
	}
	
	@RequestMapping(value = "boardWrite", method = RequestMethod.GET)
	public String boardWrite() {
		logger.info("게시글 작성 접속");
		return "board/boardWrite";
	}
	
	@RequestMapping(value = "boardWrite", method = RequestMethod.POST)
	public String boardWrite(HttpSession session, BoardVO board) {
		logger.info("게시글 접속");
		String writer = (String) session.getAttribute("LoginId");
		board.setBoard_writer(writer);
		int result = dao.boardWrite(board);
		return "redirect:boardList";
	}
}
