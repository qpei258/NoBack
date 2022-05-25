package com.noback.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.ScheduleVO;
import com.noback.group.dao.MypageDAO;
import com.noback.group.dao.ScheduleDAO;

/**
 * 사내 일정 콘트롤러
 */
@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	ScheduleDAO dao;
	
	@Autowired
	MypageDAO mydao;
	
	/**
	 * 스케줄 캘린더 페이지 출력
	 */
	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String showSchedule(Model model, HttpSession session)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		
		
		String searchId = (String) session.getAttribute("LoginId");
		String level = (String) session.getAttribute("LoginLevel");

		MemberVO member = mydao.getMember(searchId);
		member.setEmployee_num(searchId);
		
		model.addAttribute("member", member);
		
		// 스케줄 전체 데이터 저장
		ArrayList<ScheduleVO> scheduleList = dao.listSchedule();
		// 스케줄 이번달 한정 데이터 저장
		ArrayList<ScheduleVO> MonthScheduleList = dao.listScheduleMonth();
		
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("MonthScheduleList", MonthScheduleList);
	
		
		return "schedule/schedule"; 
	}
	
	
	/**
	 * 일정 개별 출력
	*/
	@RequestMapping(value = "scheduleInfo", method = RequestMethod.GET) 
	public String showScheduleinfo(int schedule_num, Model model)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공"); 
		ScheduleVO schedule = dao.getSchedule(schedule_num);
		model.addAttribute("schedule", schedule);
		
		return "schedule/scheduleInfo"; 
	}
 
	
	/**
	 * 일정 등록 
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addSchedule(HttpSession session, ScheduleVO sked) {
		// 아이디로 권한레벨 불러오기
		String searchId = (String) session.getAttribute("LoginId");
		String level = (String) session.getAttribute("LoginLevel");
		
		sked.setSchedule_writer(searchId);
		sked.setSchedule_level(level);
		
		// dao로
		int result = dao.addSchedule(sked);
		
		logger.info("sked", sked);
		
		return "redirect:/schedule/schedule";	
	}
		
	/**
	 * 일정 수정
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSchedule(Model model,HttpSession session, int schedule_num) {
		// 아이디로 수정할 정보 불러오기
		//String searchId = (String) session.getAttribute("LoginId");
		
		ScheduleVO sked = dao.getSchedule(schedule_num);
		// sked.setSchedule_writer(searchId);
		
		//model.addAttribute("sked", sked);
		
		// dao로
		int result = dao.updateSchedule(sked);
		logger.info("sked", sked);
		//session.setAttribute("LoginLv", sked.getSchedule_level());
		
		return "redirect:/schedule/schedule";	
	}

	
	/**
	 * 일정 삭제
	*/
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteSchedule(HttpSession session, int schedule_num) {
		
		//String searchId = (String) session.getAttribute("LoginId");
		// dao로
		ScheduleVO sked = dao.getSchedule(schedule_num);
		
		int result = dao.deleteSchedule(schedule_num);
		logger.info("sked", sked);
		
		return "redirect:/schedule/schedule";	
	}
	 
	 
}
