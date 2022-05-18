package com.noback.group.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.noback.group.dao.SignDAO;
import com.noback.group.vo.MemberVO;
import com.noback.group.vo.SignVO;

import global.sesoc.web5.vo.Board;



@Controller
@RequestMapping("sign")
public class SignController {
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	
	//@Autowired
	//SignDAO dao;
	
	//결제 내역 리스트
	@RequestMapping(value = "sign", method = RequestMethod.GET)
	public String list() {
		return "sign/sign";	
	}
	
	//결제 서류 작성 페이지로 이동
		@RequestMapping(value = "swrite", method = RequestMethod.GET)
		public String swrite() {
			return "sign/swrite";
	}
		
	//글쓰기 처리
	@RequestMapping(value = "swrite", method = RequestMethod.POST)
	public String swrite(HttpSession session, MemberVO member, SignVO sign, MultipartFile upload) {
		logger.info("파일정보{}",upload.getContentType());
		logger.info("파일정보{}",upload);
		logger.info("파일정보{}",upload);
		logger.info("파일정보{}",upload);
			
		String id = (String) session.getAttribute("loginId");
		member.setEmployee_num(id);
			
		//첨부파일이 있는 경우 지정된 경로에 저장하고, 원본 파일명과 저장된 파일명을 Board객체에 세팅
		//if (!upload.isEmpty()) {
			//String savedfile = FileService.saveFile(upload, uploadPath);
			//board.setOriginalfile(upload.getOriginalFilename());
			//board.setSavedfile(savedfile);
		//}

		logger.info("저장할 글정보 {}", board);
		dao.write(board);
		return "redirect:list";
	}

}
