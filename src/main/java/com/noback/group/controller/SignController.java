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
import org.springframework.web.multipart.MultipartFile;

import com.noback.group.dao.SignDAO;
import com.noback.group.vo.SignVO;
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
			, Model model) {
		
		logger.debug("page: {}, searchText: {}", page, searchText);
		
		int total = dao.getTotal(searchText);//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<SignVO> listSign = dao.listSign(searchText, navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("listSign", listSign);
	    model.addAttribute("navi", navi);
		model.addAttribute("searchText", searchText);
		
		return "sign/main";	
	}
	
	//결재 대기 중인 서류 리스트(내가 결제해야하는것)
	@RequestMapping(value = "sdelay", method = RequestMethod.GET)
	public String sdelay() {
			return "sign/sdelay";
	}
	
    //결제서류작성 페이지
	@RequestMapping(value = "swrite", method = RequestMethod.GET)
	public String swrite() {
		return "sign/swrite";
	}
	
	//글쓰기 처리

	@RequestMapping(value = "swrite", method = RequestMethod.POST)
	public String swrite2(HttpSession session, SignVO sign, MultipartFile upload) {
		logger.info("저장할 글정보 {}", sign);
		logger.info("파일정보:{}", upload.getContentType());
		logger.info("파일정보:{}", upload.getName());
		logger.info("파일정보:{}", upload.getOriginalFilename());
		logger.info("파일정보:{}", upload.getSize());
		logger.info("파일정보:{}", upload.isEmpty());
			
			
		//String id = (String) session.getAttribute("loginId");
		sign.setSign_sender("000000");
			
			//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 Board객체에 세팅
		if (!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			sign.setSign_originfile(upload.getOriginalFilename());
			sign.setSign_savedfile(savedfile);
		}

			logger.info("저장할 글정보 {}", sign);
			dao.write(sign);
			return "redirect:smain";
		}
	
	
	//글 읽기
	@RequestMapping (value="scomplete", method=RequestMethod.GET)
	public String read(int sign_num, Model model) {
		//글 번호를 전달
		SignVO sign = dao.getSign(sign_num);
			//결과가 없으면 글 목록으로 이동
		if (sign == null) {
			return "redirect:smain";
		}
			//결과가 있으면 모델에 글 정보 저장하고 JSP로 포워딩
		model.addAttribute("sign", sign);

			
		return "sign/scomplete";
	}
	
	//사원검색 페이지로 이동
	@RequestMapping(value = "check", method = RequestMethod.GET)
	public String check() {
		return "sign/check";
	}
		
	//사원검색
	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String idcheck(String searchname, Model model) {
		logger.info("검색할 이름 : {}", searchname);
		MemberVO member = dao.getMember(searchname);
		model.addAttribute("member", member);
		model.addAttribute("searchname", searchname);
			
			return "sign/check";
	}
}
