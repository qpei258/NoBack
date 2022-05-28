package com.noback.group.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;


import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.noback.group.dao.SignDAO;
import com.noback.group.vo.SignVO;

import com.noback.group.vo.BoardVO;
import com.noback.group.vo.MemberVO;



import com.noback.group.util.FileService;
import com.noback.group.util.PageNavigator;




/**
 * 메인 콘트롤러
 */
@Controller
@RequestMapping("sign")
public class SignController {
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);

	@Autowired
	SignDAO dao;
	
	//임시루트
	@RequestMapping(value = "smain", method = RequestMethod.GET)
	public String smain() {
				return "sign/smain";
	}
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/boardfile";	//파일 업로드 경로
	
	//결재 내역 전체 리스트(내가 결제를 올린것)
	@RequestMapping(value = "main", method = RequestMethod.GET)
	public String main(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, Model model,SignVO sign,HttpSession session) {
		logger.info("{}",sign);
		String searchId = (String) session.getAttribute("LoginId");
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		int total = dao.getTotal(searchText);//전체 글 개수
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchText", searchText);
		map.put("LoginId",searchId);
		
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<SignVO> listSign = dao.listSign(map, navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("listSign", listSign);
	    model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "sign/main";	
	}
	
	//결재 대기 중인 서류 리스트(내가 결제해야하는것)
	@RequestMapping(value = "sdelay", method = RequestMethod.GET)
	public String sdelay(
			@RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="searchText", defaultValue="") String searchText
			, Model model,SignVO sign, HttpSession session) {
		logger.info("{}",sign);
		String searchId = (String) session.getAttribute("LoginId");
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		int total = dao.getTotal(searchText);//전체 글 개수
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchText", searchText);
		map.put("LoginId",searchId);
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<SignVO> listSign2 = dao.listSign2(map, navi.getStartRecord(), navi.getCountPerPage());	
		

		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("listSign2", listSign2);
	    model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		
		return "sign/sdelay";
	}
	
	//자기 글 확인폼으로 이동
	@RequestMapping (value="sconfirm", method=RequestMethod.GET)
	public String sconfirm(int sign_num, Model model) {
		//글 번호를 전달
		SignVO sign = dao.getSignn(sign_num);
		//결과가 없으면 글 목록으로 이동
		if (sign == null) {
			return "redirect:smain";
		}
		model.addAttribute("sign", sign);
		return "sign/sconfirm";
	}
	
	//결제 서류 읽기
	@RequestMapping (value="scomplete", method=RequestMethod.GET)
	public String scomplete(int sign_num, Model model, HttpSession session) {
		String searchId = (String) session.getAttribute("LoginId");
		logger.info("로그인된 아이디 {}", searchId);
		//글 번호를 전달
		SignVO sign = dao.getSign(sign_num);
		logger.info("들어가는 글정보 {}", sign);
			//결과가 없으면 글 목록으로 이동
		if (sign == null) {
			return "redirect:smain";
		}
				//결과가 있으면 모델에 글 정보 저장하고 JSP로 포워딩
		model.addAttribute("sign", sign);
		return "sign/scomplete";
	}
	
	//결제 서류 처리
	@RequestMapping(value = "scomplete", method = RequestMethod.POST)
	public String scomplete(HttpSession session, SignVO sign, MultipartFile upload, Model model) {
	logger.info("수정할 글정보 {}", sign);
	String searchId = (String) session.getAttribute("LoginId");
	if(sign.getSign_receiver1()== searchId) {
		sign.setSign_ok1(1);
	}
	else if(sign.getSign_receiver2()== searchId) {
		sign.setSign_ok1(1);
		sign.setSign_ok2(1);
	}else if(sign.getSign_receiver3()== searchId ) {
		sign.setSign_ok1(1);
		sign.setSign_ok2(1);
		sign.setSign_ok3(1);
	}
	dao.complete(sign);
	return "redirect:sdelay";
	}
	
	
    //결제서류작성 페이지
	@RequestMapping(value = "swrite", method = RequestMethod.GET)
	public String swrite(String num, Model model, HttpSession session) {
		logger.info("결제작성페이지 접속");
		String searchId = (String) session.getAttribute("LoginId");
		MemberVO member = dao.member(searchId);
		logger.info("{}",member);
		
		model.addAttribute("member", member);
		return "sign/swrite";
	}
	
	
	
	//글쓰기 처리
	@RequestMapping(value = "swrite", method = RequestMethod.POST)
	public String swrite2(HttpSession session, SignVO sign, MultipartFile upload, Model model) {
		logger.info("저장할 글정보 {}", sign);	
			
		String id = (String) session.getAttribute("LoginId");
		sign.setSign_sender(id);
			//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 sign객체에 세팅
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			sign.setSign_originfile(upload.getOriginalFilename());
			sign.setSign_savedfile(savedfile);
		}

			dao.write(sign);
			return "redirect:main";
		}
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(int sign_num, Model model, HttpServletResponse response) {
		SignVO sign = dao.getSign(sign_num);
		
		//원래의 파일명
		String originalfile = new String(sign.getSign_originfile());
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originalfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로
		String fullPath = uploadPath + "/" + sign.getSign_savedfile();
		
		//서버의 파일을 읽을 입력 스트림과 클라이언트에게 전달할 출력스트림
		FileInputStream filein = null;
		ServletOutputStream fileout = null;
		
		try {
			filein = new FileInputStream(fullPath);
			fileout = response.getOutputStream();
			
			//Spring의 파일 관련 유틸 이용하여 출력
			FileCopyUtils.copy(filein, fileout);
			
			filein.close();
			fileout.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//사원검색 페이지로 이동
	@RequestMapping(value = "check1", method = RequestMethod.GET)
	public String check1() {
		return "sign/check1";
	}
		
	//사원검색
	@RequestMapping(value = "check1", method = RequestMethod.POST)
	public String idcheck1(String searchname, Model model) {
		logger.info("검색할 이름 : {}", searchname);
		ArrayList<MemberVO> member = dao.getMember(searchname);
		logger.info("검색한 이름 : {}", member);
		model.addAttribute("member", member);
		model.addAttribute("searchname", searchname);
			
		return "sign/check1";
	}
	
	//사원검색 페이지로 이동
	@RequestMapping(value = "check2", method = RequestMethod.GET)
	public String check2() {
		return "sign/check2";
	}
		
	//사원검색
	@RequestMapping(value = "check2", method = RequestMethod.POST)
	public String idcheck2(String searchname, Model model) {
		logger.info("검색할 이름 : {}", searchname);
		ArrayList<MemberVO> member = dao.getMember(searchname);
		logger.info("검색한 이름 : {}", member);
		model.addAttribute("member", member);
		model.addAttribute("searchname", searchname);
			
		return "sign/check2";
	}
	
	//사원검색 페이지로 이동
	@RequestMapping(value = "check3", method = RequestMethod.GET)
	public String check3() {
		return "sign/check3";
	}
		
	//사원검색
	@RequestMapping(value = "check3", method = RequestMethod.POST)
	public String idcheck3(String searchname, Model model) {
		logger.info("검색할 이름 : {}", searchname);
		ArrayList<MemberVO> member = dao.getMember(searchname);
		logger.info("검색한 이름 : {}", member);
		model.addAttribute("member", member);
		model.addAttribute("searchname", searchname);
			
		return "sign/check3";
	}
	
	//사원검색 페이지로 이동
	@RequestMapping(value = "check4", method = RequestMethod.GET)
	public String check4() {
		return "sign/check4";
	}
		
	//사원검색
	@RequestMapping(value = "check4", method = RequestMethod.POST)
	public String idcheck4(String searchname, Model model) {
		logger.info("검색할 이름 : {}", searchname);
		ArrayList<MemberVO> member = dao.getMember(searchname);
		logger.info("검색한 이름 : {}", member);
		model.addAttribute("member", member);
		model.addAttribute("searchname", searchname);
			
		return "sign/check4";
	}
	
		
}
