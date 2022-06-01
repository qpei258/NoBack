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
import org.springframework.web.bind.annotation.ResponseBody;

import com.noback.group.dao.MemberDAO;
import com.noback.group.util.PageNavigator;
import com.noback.group.vo.MemberVO;



@Controller
@RequestMapping(value = "manager")
public class MemberController {
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
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
	logger.info("로그인", member);
	
		MemberVO member2 = dao.getMember(member.getEmployee_num());
		logger.info("{}", member2);
		if (member2 != null && member2.getEmployee_password().equals(member.getEmployee_password())) {
			session.setAttribute("LoginId", member2.getEmployee_num());
			session.setAttribute("LoginLevel", member2.getEmployee_level());
			return "redirect:/";
		}
		String msg = "다시 로그인 해주세요.";
		session.setAttribute("msg", msg);
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
			logger.info("사원등록", member);
			int result = dao.insertMember(member);
			if (result != 1) {
				//DB저장에 실패한 경우 가입폼으로 이동
				return "manager/join";
			}
			//저장 성공한 경우 메인화면으로 이동
			return "redirect:memberlist";
		}

		// 모든 사원리스트 출력
		@RequestMapping(value = "memberlist", method = RequestMethod.GET)
		public String list(HttpSession session, @RequestParam(value="page", defaultValue="1") int page
				, @RequestParam(value="search", defaultValue="") String search
				, Model model){
			int total = dao.count(search);
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
			//전체 회원 정보 목록 읽기
			ArrayList<MemberVO> memberlist = dao.memberlist(search, navi.getStartRecord(), navi.getCountPerPage());
			//모델에 목록 저장하고 뷰로 이동
			model.addAttribute("memberlist", memberlist);
			model.addAttribute("navi", navi);
			return "manager/memberlist";
		}
		
		// 사원 삭제
		@RequestMapping(value = "memberdelete", method = RequestMethod.GET)
		public String memberdelete(String employee_num) {
			logger.info("사원 삭제" + employee_num);
			int result = dao.memberdelete(employee_num);
			return "redirect:memberlist";
		}
		
		// 사원 수정 페이지로 이동
		@RequestMapping(value = "memberlistupdate", method = RequestMethod.GET)
		public String memberlistupdate(String employee_num,  Model model) {
			
			MemberVO member = dao.getMember(employee_num);
			model.addAttribute("member", member);
			logger.info("사원 수정" + member);
			return "manager/memberlistupdate";
		}
		
	
		// 사원정보 수정
		@ResponseBody
		@RequestMapping(value = "memberlistupdate", method = RequestMethod.POST)
		public void memberlistupdate(HttpSession session, MemberVO member) {
			logger.info("사원 수정 처리" + member);
			
			//member객체를 dao로 보내서 테이블의 정보 수정
			int result = dao.memberlistupdate(member);
			
			//세션정보도 수정
			session.setAttribute("num", member.getEmployee_num());
			
		}
	
	
}
