package com.hanul.omr;

import java.util.List;
import java.util.Locale;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.TestServiceImpl;
import test.TestVO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "home";
	}
	
	@Autowired private TestServiceImpl service;
	
	@RequestMapping("list.test")
	public String list(Model model, String subjectName) {
		//HttpSession session을 받아서 로그인할 떄 물려놓기
		
		System.out.println(subjectName);
		
		List<TestVO> list = service.listQuestion(subjectName);
		
		System.out.println(list.get(0).getTest_problem());
		
		model.addAttribute("list",list);
		
		
		
		return "test/test";//페이지에 위치.
	}
	
}
