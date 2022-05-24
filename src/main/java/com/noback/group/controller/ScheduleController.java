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
	

	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String showSchedule(Model model, HttpSession session)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		String searchId = (String) session.getAttribute("LoginId");
		String level = (String) session.getAttribute("LoginLevel");

		MemberVO member = mydao.getMember(searchId);
		member.setEmployee_num(searchId);
		
		model.addAttribute("member", member);
		
		ArrayList<ScheduleVO> scheduleList  
		= dao.listSchedule();
		
		model.addAttribute("scheduleList", scheduleList);
		
		return "schedule/schedule2"; 
	}
	
	/**
	 * 일정 개별 출력
	 */
	@RequestMapping(value = "scheduleInfo", method = RequestMethod.GET) 
	public String showScheduleinfo(int schedule_num, Model model)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		ScheduleVO schedule = dao.selectSchedule(schedule_num);
		model.addAttribute("schedule", schedule);
		
		return "schedule/schedule"; 
	}

	
	/**
	 * 일정 등록 
	*/
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addSchedule(HttpSession session, ScheduleVO sked) {
		
		String searchId = (String) session.getAttribute("LoginId");
		String level = (String) session.getAttribute("LoginLevel");
		
		sked.setSchedule_writer(searchId);
		sked.setSchedule_level(level);
		
		// dao로
		int result = dao.addSchedule(sked);
		
		logger.info("skd", sked);
		//session.setAttribute("LoginLv", sked.getSchedule_level());
		
		return "schedule/schedule";	
	}
	 
}
