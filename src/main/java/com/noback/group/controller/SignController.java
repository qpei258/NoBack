package com.noback.group.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.noback.group.dao.SignDAO;



@Controller
@RequestMapping("sign")
public class SignController {
	private static final Logger logger = LoggerFactory.getLogger(SignController.class);
	
	//@Autowired
	//SignDAO dao;
	
	//글목록 이동
	@RequestMapping(value = "sign", method = RequestMethod.GET)
	public String list() {
		return "sign/sign";	
	}
}
