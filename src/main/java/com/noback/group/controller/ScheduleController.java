package com.noback.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.ScheduleVO;


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
	
	/**
	 * 사내 일정 페이지로 이동
	 * 일정 전체 출력
	 */
	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String showSchedule(Model model, String schedule_num)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		
		ArrayList<ScheduleVO> scheduleList  
		= dao.listSchedule(schedule_num);
		
		model.addAttribute("scheduleList", scheduleList);
		
		return "schedule/schedule"; 
	}
	
	/**
	 * 일정 개별 출력
	 */
	@RequestMapping(value = "scheduleInfo", method = RequestMethod.GET) 
	public String showScheduleinfo(String schedule_num, Model model)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		ScheduleVO schedule = dao.selectSchedule(schedule_num);
		model.addAttribute("schedule", schedule);
		
		return "schedule/scheduleInfo"; 
	}
	
	/**
	 * 일정 등록 
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addSchedule(HttpSession session, ScheduleVO sked) {
		
		String searchId = (String) session.getAttribute("LoginId");
		sked.setSchedule_writer(searchId);
		// dao로
		int result = dao.addSchedule(sked);
		logger.info("member", sked);
		session.setAttribute("LoginLv", sked.getSchedule_level());
		return "schedule/schedule";	
	}
	
	/**
	 * 일정 수정
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String updateSchedule(HttpSession session, ScheduleVO sked) {
		
		String searchId = (String) session.getAttribute("LoginId");
		sked.setSchedule_writer(searchId);
		// dao로
		int result = dao.updateSchedule(sked);
		logger.info("member", sked);
		session.setAttribute("LoginLv", sked.getSchedule_level());
		
		return "schedule/schedule";	
	}

	/**
	 * 일정 삭제
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteSchedule(HttpSession session, ScheduleVO sked) {
		
		String searchId = (String) session.getAttribute("LoginId");
		sked.setSchedule_writer(searchId);
		// dao로
		int result = dao.deleteSchedule(sked);
		logger.info("member", sked);
		session.setAttribute("LoginLv", sked.getSchedule_level());
		
		return "schedule/schedule";	
	}


}
