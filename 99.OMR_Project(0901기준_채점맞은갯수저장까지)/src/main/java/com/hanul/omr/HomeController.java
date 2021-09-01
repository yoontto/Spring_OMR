package com.hanul.omr;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

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
		//System.out.println(subjectName);
		List<TestVO> list = service.listQuestion(subjectName);
		//System.out.println(list.get(0).getTest_problem());
		model.addAttribute("list",list);
		model.addAttribute("subjectName",subjectName);
		
		return "test/test";//페이지에 위치.
	}
	
	 //응시자의 응답 저장
	 
	 @RequestMapping("test.Result")
	 public String list(Model model, String
	 subjectName, int problem_num, HttpServletRequest request) {
	 
	 String answer = null;
	 ArrayList<String> answer_arr = new ArrayList<String>();
	 for(int i = 1; i <= problem_num; i++) {
	
		 
		 answer =request.getParameter("answer"+i);
		 
		 if(answer == null) {
			 answer = "0";
		 }
		 answer_arr.add(answer);
	 
	 }
	 service.insertResult(answer_arr, subjectName);
	 
	 return "test/testResult";//페이지에 위치. }
	 }
	
}
