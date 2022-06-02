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

import com.noback.group.dao.MemberDAO;
import com.noback.group.dao.MypageDAO;
import com.noback.group.dao.ScheduleDAO;
import com.noback.group.vo.*;
import com.noback.group.util.*;

@Controller
@RequestMapping("mypage")
public class MypageController {

	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	
	@Autowired
	MypageDAO dao;
	
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	ScheduleDAO caldao;
	
	//게시판 관련 상수값들
	final int countPerPage = 10;		
	final int pagePerGroup = 5;				
	final String uploadPath = "/boardfile";	
		
	/**
	 * 마이페이지로 이동
	 
	@RequestMapping(value = "mypage", method = RequestMethod.GET) 
	public String showMypage()
			throws Exception {
		logger.info("마이페이지 페이지 로딩성공");
		return "mypage/mypage"; 
	}
	*/
	
	/**
	 * 개인정보 수정 페이지 로딩
	 */
	@RequestMapping(value = "update", method = RequestMethod.GET) 
	public String showMyupdate(Model model, HttpSession session)
			throws Exception {
		logger.info("개인수정 페이지 로딩성공");
		// 세션에서 ID가져오기
		String searchId = (String) session.getAttribute("LoginId");
		MemberVO member = mdao.getMember(searchId);
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
		return "mypage/myUpdate";	
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
	
	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String showMyschedule(Model model, HttpSession session) {
		logger.info("마이 스케줄 페이지 로딩성공");
		
		String searchId = (String) session.getAttribute("LoginId");
		// 스케줄 전체 데이터 저장
		ArrayList<ScheduleVO> scheduleList = caldao.listScheduleMonth(searchId);
		// 스케줄 이번달 한정 데이터 저장
		model.addAttribute("scheduleList", scheduleList);
		
		model.addAttribute("month", "00");
		
		return "mypage/mySchedule"; 
	}
	 */
	
	/**
	 * 스케줄 월별로 일정 출력
	 */
	@RequestMapping(value = "scheduleByMonth", method = RequestMethod.GET) 
	public String showScheduleByMonth(Model model, HttpSession session, String month)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		String searchId = (String) session.getAttribute("LoginId");
		
		// 스케줄 전체 데이터 저장
		ArrayList<ScheduleVO> scheduleList = caldao.listScheduleByMonth(month, searchId);
		// 스케줄 이번달 한정 데이터 저장
		model.addAttribute("scheduleList", scheduleList);
		
		model.addAttribute("month", month);

		return "mypage/mySchedule"; 
	}
	
	/**
	 * 마이페이지-내 스케줄 추가
	 */
	@RequestMapping(value = "addform", method = RequestMethod.POST)
	public String addScheduleForm(HttpSession session, ScheduleVO sked) {
			
		// 세션으로 아이디, 권한레벨 불러오기
		String searchId = (String) session.getAttribute("LoginId");
		Integer searchLv = (Integer) session.getAttribute("LoginLevel");
		logger.info("searchId :{}", searchId);
		logger.info("searchLv :{}", searchLv);
		
		
		sked.setSchedule_writer(searchId);
		sked.setSchedule_level(searchLv);
		
		
		logger.info("schedule :{}", sked);
		 //dao로
		int result = caldao.addScheduleForm(sked);
		
		
		return "redirect:/schedule/schedule";	
	}
	
	/**
	 * 일정 개별 출력
	*/
	@RequestMapping(value = "scheduleInfo", method = RequestMethod.GET) 
	public String showScheduleinfo(int schedule_num, Model model)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공"); 
		ScheduleVO schedule = caldao.getSchedule(schedule_num);
		model.addAttribute("schedule", schedule);
		
		return "schedule/scheduleInfo"; 
	}

	
	/**
	 * 일정 수정
	 */
	@RequestMapping(value = "updateSchedule", method = RequestMethod.POST)
	public String updateSchedule(Model model,HttpSession session, ScheduleVO sked) {
		// 아이디로 수정할 정보 불러오기
		
		String searchId = (String) session.getAttribute("LoginId");
		sked.setSchedule_writer(searchId);
		
		//ScheduleVO sked = dao.getSchedule(schedule_num);
		
		model.addAttribute("sked", sked);
		
		// dao로
		int result = caldao.updateSchedule(sked);
		logger.info("sked", sked);
		session.setAttribute("LoginLv", sked.getSchedule_level());
		
		return "redirect:/mypage/schedule";	
	}

	/**
	 * 일정 삭제
	*/
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteSchedule(HttpSession session, int schedule_num) {
		
		//String searchId = (String) session.getAttribute("LoginId");
		// dao로
		//ScheduleVO sked = dao.getSchedule(schedule_num);
		
		int result = caldao.deleteSchedule(schedule_num);
		logger.info("schedule_num :{}", schedule_num);
		
		return "redirect:/mypage/schedule";
	}

}