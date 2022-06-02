package com.noback.group.controller;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.ScheduleVO;
import com.noback.group.dao.MemberDAO;
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
	MemberDAO mydao;
	
	/**
	 * 스케줄 캘린더 페이지 출력
	 */
	
	@RequestMapping(value = "schedule", method = RequestMethod.GET) 
	public String list(HttpSession session, Model d) {
		logger.info("사내 일정 페이지 로딩성공");
		
		String searchId = (String) session.getAttribute("LoginId");
		Integer searchLv = (Integer) session.getAttribute("LoginLevel");
		logger.info("searchId :{}", searchId);
		logger.info("searchLv :{}", searchLv);
		
		Map<String, String> map = new HashMap<String, String>();
		 
		map.put("searchId", searchId);
		map.put("searchLv", Integer.toString(searchLv));
		 
		d.addAttribute("list", dao.calenList(map));
		return "schedule/schedule"; 
	}
	
	/**
	 * 스케줄 전체 출력
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String data(HttpSession session, Model d) {
		logger.info("업데이트 완료:{}",d);
		
		String searchId = (String) session.getAttribute("LoginId");
		Integer searchLv = (Integer) session.getAttribute("LoginLevel");
		
		 Map<String, String> map = new HashMap<String, String>();
		 
		 map.put("searchId", searchId);
		 map.put("searchLv", Integer.toString(searchLv));
		
		d.addAttribute("list", dao.calenList(map));
		
		return "schedule/schedule";
	}
	
	/**
	 * 일정 등록 
	 */
	@ResponseBody
	@RequestMapping(value = "add", method = RequestMethod.POST)
	public String addSchedule(HttpSession session, @RequestBody Map<String, String> sked) {
		
		// ajax로 시작일, 종료일, 메모 불러오기
		String start = sked.get("start").split("[.]")[0].replace('T', ' '); 
		logger.info("start :{}", start);
	
		String end = sked.get("end").split("[.]")[0].replace('T', ' ');
		logger.info("end :{}", end);
		
		String content = sked.get("content");
		logger.info("content :{}", content);
			
		// 세션으로 아이디, 권한레벨 불러오기
		String searchId = (String) session.getAttribute("LoginId");
		Integer searchLv = (Integer) session.getAttribute("LoginLevel");
		logger.info("searchId :{}", searchId);
		logger.info("searchLv :{}", searchLv);
		
		ScheduleVO schedule  = new ScheduleVO();
		
		schedule.setSchedule_writer(searchId);
		schedule.setSchedule_level(searchLv);
		schedule.setSchedule_start(start);
		schedule.setSchedule_title(sked.get("title"));
		schedule.setSchedule_end(end);
		schedule.setSchedule_memo(content);
		schedule.setSchedule_allDay(true);
		
		
		logger.info("schedule :{}", schedule);
		 //dao로
		int result = dao.addSchedule(schedule);
		
		
		return "redirect:/schedule/schedule";	
	}
	
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
		int result = dao.addScheduleForm(sked);
		
		
		return "redirect:/schedule/schedule";	
	}
	

	/**
	 * 스케줄 이번달 일정 출력
	 
	@RequestMapping(value = "scheduleMonth", method = RequestMethod.GET) 
	public String showScheduleMonth(Model model, HttpSession session,  String month)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공");
		String searchId = (String) session.getAttribute("LoginId");
		
		// 스케줄 전체 데이터 저장
		ArrayList<ScheduleVO> scheduleList = dao.listScheduleMonth(searchId);
		// 스케줄 이번달 한정 데이터 저장
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("month", month);
		
		return "schedule/scheduleMonth";
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
		ArrayList<ScheduleVO> scheduleList = dao.listScheduleByMonth(month, searchId);
		// 스케줄 이번달 한정 데이터 저장
		model.addAttribute("scheduleList", scheduleList);
		model.addAttribute("month", month);
		
		return "schedule/scheduleByMonth"; 
	}
	
	
	/**
	 * 일정 개별 출력
	*/
	@RequestMapping(value = "scheduleInfo", method = RequestMethod.GET) 
	public String showScheduleinfo(int schedule_num, Model model, String month)
			throws Exception {
		logger.info("사내 일정 페이지 로딩성공"); 
		ScheduleVO schedule = dao.getSchedule(schedule_num);
		model.addAttribute("schedule", schedule);
		model.addAttribute("month", month);
		return "schedule/scheduleInfo"; 
	}
	
	/**
	 * 일정 수정
	 */
	@RequestMapping(value = "updateSchedule", method = RequestMethod.POST)
	public String updateSchedule(Model model,HttpSession session, ScheduleVO sked, String month) {
		// 아이디로 수정할 정보 불러오기
		
		String searchId = (String) session.getAttribute("LoginId");
		sked.setSchedule_writer(searchId);
		
		//ScheduleVO sked = dao.getSchedule(schedule_num);
		
		model.addAttribute("sked", sked);
		
		// dao로
		int result = dao.updateSchedule(sked);
		logger.info("sked", sked);
		
		return "redirect:/schedule/scheduleByMonth?month=" + month;	
	}

	
	/**
	 * 일정 삭제
	*/
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String deleteSchedule(HttpSession session, int schedule_num, String month) {
		
		//String searchId = (String) session.getAttribute("LoginId");
		// dao로
		//ScheduleVO sked = dao.getSchedule(schedule_num);
		
		int result = dao.deleteSchedule(schedule_num);
		logger.info("schedule_num :{}", schedule_num);
		
		return "redirect:/schedule/scheduleByMonth?month="+month;
	}

}