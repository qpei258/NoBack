package com.noback.group.controller;



import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noback.group.vo.ScheduleVO;


import com.noback.group.dao.ScheduleDAO;

/**
 * 사내 일정 콘트롤러
 */
@Controller
public class ScheduleController {
	
	private static final Logger logger = LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	ScheduleDAO dao;
	
	/**
	 * 사내 일정 페이지로 이동
	 */
	
	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String showSchedule()
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		
		return "schedule/schedule"; 
	}

}
