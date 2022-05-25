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

import com.noback.group.dao.MemberDAO;
import com.noback.group.vo.MemberVO;






@Controller
@RequestMapping(value = "manager")
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	MemberDAO dao;
	
	// 로그인으로 이동
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login() {
		return "manager/login";
	}
	
	//로그인처리
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO member, HttpSession session) {
	logger.info("{}", member);
	
		MemberVO member2 = dao.getMember(member.getEmployee_num());
		logger.info("{}", member2);
		if (member2 != null && member2.getEmployee_password().equals(member.getEmployee_password())) {
			session.setAttribute("LoginId", member2.getEmployee_num());
			session.setAttribute("LoginLevel", member2.getEmployee_level());
			return "redirect:/";
		}
		return "redirect:login";
	}
	
		//로그아웃
		@RequestMapping(value = "logout", method = RequestMethod.GET)
		public String logout(HttpSession session) {
			session.removeAttribute("LoginId");
			session.removeAttribute("LoginLevel");
			return "redirect:/";
		}
		
		// 사원등록으로 이동
		@RequestMapping(value = "join", method = RequestMethod.GET)
		public String join() {
			return "manager/join";
		}
		
		//사원등록 처리
		@RequestMapping(value = "join", method = RequestMethod.POST)
		public String join(MemberVO member) {
			logger.info("{}", member);
			int result = dao.insertMember(member);
			if (result != 1) {
				//DB저장에 실패한 경우 가입폼으로 이동
				return "manager/join";
			}
			//저장 성공한 경우 메인화면으로 이동
			return "redirect:/";
		}

		// 모든 사원리스트 출력
		@RequestMapping(value = "memberlist", method = RequestMethod.GET)
		public String list(Model model) {
			//전체 회원 정보 목록 읽기
			ArrayList<MemberVO> memberlist = dao.memberlist();
			//모델에 목록 저장하고 뷰로 이동
			model.addAttribute("memberlist", memberlist);
			
			return "manager/memberlist";
		}
		
		// 사원 수정 페이지로 이동
		@RequestMapping(value = "memberlistupdate", method = RequestMethod.GET)
		public String memberlistupdate(HttpSession session, Model model) {
			
			String employee_num = (String) session.getAttribute("employee_num");
			MemberVO member = dao.getMemberVO(employee_num);
			model.addAttribute("member", member);
			
			return "manager/memberlistupdate";
		}
		
		// 사원정보 수정
		@RequestMapping(value = "memberlistupdate", method = RequestMethod.POST)
		public String memberlistupdate(HttpSession session, MemberVO member) {
			
			//member객체를 dao로 보내서 테이블의 정보 수정
			int res = dao.memberlistupdate(member);
			
			//세션정보도 수정
			session.setAttribute("employee_num", member.getEmployee_num());
			
			return "manager/memberlist";
		}
		
	
}
