package com.noback.group.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;

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
import org.springframework.web.multipart.MultipartFile;

import com.noback.group.dao.NoticeDAO;
import com.noback.group.util.FileService;
import com.noback.group.util.PageNavigator;
import com.noback.group.vo.NoticeVO;

@Controller
@RequestMapping(value = "notice")
public class NoticeController {
	
	
	//게시판 관련 상수값들
	final int countPerPage = 10;			//페이지당 글 수
	final int pagePerGroup = 5;				//페이지 이동 링크를 표시할 페이지 수
	final String uploadPath = "/noticefile";	//파일 업로드 경로
	
	@Autowired
	NoticeDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	//공지사항 리스트로 이동
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public String noticeList(HttpSession session, @RequestParam(value="page", defaultValue="1") int page
			, @RequestParam(value="search", defaultValue="") String search
			, Model model) {
		logger.info("게시판 접속");
		  
		int total = dao.getTotal(search);			//전체 글 개수
		
		//페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total); 
		
		//검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		ArrayList<NoticeVO> noticelist = dao.list(search, navi.getStartRecord(), navi.getCountPerPage());	
		
		//페이지 정보 객체와 글 목록, 검색어를 모델에 저장
		model.addAttribute("noticelist", noticelist);
		model.addAttribute("navi", navi);
		model.addAttribute("search", search);
		
		return "notice/noticeList";
	}
	
	
	//공지글 확인
	@RequestMapping(value = "notice", method = RequestMethod.GET)
	public String notice(String num, Model model) {
		logger.info("게시글 접속");
		NoticeVO notice = dao.notice(num);
		
		model.addAttribute("notice", notice);
		return "notice/notice";
	}
	
	
	//공지글 쓰기 폼으로 이동
	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public String noticeWrite(HttpSession session) {
		logger.info("게시글 작성 접속");
		
		return "notice/noticeWrite";
	}
	
	
	//공지 글 쓰기
	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public String noticeWrite(HttpSession session, NoticeVO notice, MultipartFile upload) {
		logger.info("게시글 작성");
		String writer = (String) session.getAttribute("LoginId");
		notice.setNotice_writer(writer);
		 
		if(!upload.isEmpty()) {
			String savedfile = FileService.saveFile(upload, uploadPath);
			notice.setNotice_originfile(upload.getOriginalFilename());
			notice.setNotice_savedfile(savedfile);
		}
		
		int result = dao.noticeWrite(notice);
		return "redirect:noticeList";
	}
	
	
	//공지글 수정 폼으로 이동
	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(String notice_num, Model model) {
		logger.info("게시글 수정 접속 : {}");
		NoticeVO notice = dao.notice(notice_num);
		model.addAttribute("notice", notice);
		return "notice/noticeUpdate";
	}
	
	
	//공지글 삭제
	@RequestMapping(value = "noticeDelete", method = RequestMethod.POST)
	public String noticeDelete(String notice_num) {
		logger.info("게시글 삭제");
		NoticeVO notice = dao.notice(notice_num);
		if (notice.getNotice_savedfile() != null) {
			FileService.deleteFile(uploadPath + "/" + notice.getNotice_savedfile());
		}
		int result = dao.noticeDelete(notice_num);
		return "redirect:noticeList";
	}
	
	
	//공지글 수정
	@RequestMapping(value = "noticeUpdateDo", method = RequestMethod.POST)
	public String noticeUpdate(NoticeVO notice, MultipartFile upload, HttpSession session) {
		logger.info("게시글 수정  : {}", notice);
		String notice_num = Integer.toString(notice.getNotice_num());
		NoticeVO oldNotice = dao.notice(notice_num);
		if (!upload.isEmpty()) {
			//기존 글에 첨부된 파일의 실제 저장된 이름
			String savedfile = oldNotice.getNotice_savedfile();
			//기존 파일이 있으면 삭제
			if (savedfile != null) {
				FileService.deleteFile(uploadPath + "/" + savedfile);
			}
			
			//새로 업로드한 파일 저장
			savedfile = FileService.saveFile(upload, uploadPath);
			
			//수정 정보에 새로 저장된 파일명과 원래의 파일명 저장
			notice.setNotice_originfile(upload.getOriginalFilename());
			notice.setNotice_savedfile(savedfile);
		}
		
		int result = dao.noticeUpdate(notice);
		return "redirect:notice?num=" + notice.getNotice_num();
	}
	
	
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public String fileDownload(String notice_num, Model model, HttpServletResponse response) {
		System.out.println("testsdsdgsg ---------->" + notice_num);
		NoticeVO notice = dao.notice(notice_num);
		
		String originfile = new String(notice.getNotice_originfile());
		
		try {
			response.setHeader("Content-Disposition", " attachment;filename="+ URLEncoder.encode(originfile, "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		//저장된 파일 경로  "/boardfile/20220420.jpg"
		String fullPath = uploadPath + "/" + notice.getNotice_savedfile();
		 
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
}
