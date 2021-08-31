package com.hanul.omr;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.TestServiceImpl;
import test.TestVO;

@Controller
public class HomeController {
	
	@Autowired private TestServiceImpl service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}
	
	@RequestMapping("test")
	public String test(String subjectName, Model model) {
		List<TestVO> list = service.listQuestion(subjectName);
		model.addAttribute("list",list);
		return "test/test";
	}
	
}
