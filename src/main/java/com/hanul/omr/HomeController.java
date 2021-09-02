package com.hanul.omr;

import java.net.http.HttpRequest;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.ResultVO;
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
	
	@RequestMapping("list")
	public String listQuestion(Model model ,String subjectName) {
		
		List<TestVO> listQuestion = service.listQuestion(subjectName);
		model.addAttribute("listQuestion", listQuestion);
		model.addAttribute("subjectName", subjectName);
		
		
		return "test/test";
	}
	
	//재욱 : 결과 창 불러오기
	@RequestMapping("result")
	public String result(String subjectName, Model model, 
			int num, HttpServletRequest request) {
		
		String answer = null;
		List<String> answer_arr = new ArrayList<String>();
		
		for(int i = 1; i <= num; i++) {
			answer = request.getParameter("q" + i);
			if(answer == null) {
				answer = "0";
			}//if
			answer_arr.add(answer);
			
		}//for
		List<TestVO> vo = service.listQuestion(subjectName);
		int o = 0;
		
		System.out.println(answer_arr.get(0));
		System.out.println(vo.get(0).getTest_answer());
		
		for(int i = 0; i < num; i++) {
			if(answer_arr.get(i).equals(Integer.toString(vo.get(i).getTest_answer()))) {
				o++;
				
			}//if
		}//for
		System.out.println(o);
		
		o *= 10;
		
		model.addAttribute("subjectName", subjectName);
		model.addAttribute("answer_arr", answer_arr);
		model.addAttribute("o", o);
		model.addAttribute("list", vo);
		model.addAttribute("size", vo.size());
		
		return "test/result";
	}//result
	
	
	
	//대돈 : 결과가져오기
	@RequestMapping("get")
	public String getResult(Model model, String subjectName) {
		List<ResultVO> getResult = service.getResult(subjectName);
		model.addAttribute("getResult", getResult);
		return "";
	}
	
	//대돈 : 결과 입력하기
	@RequestMapping("insertResult")
	public String insertResult(ResultVO vo, String subjectName) {
		//ArrayList<ResultVO> list
		service.insertResult(vo, subjectName);
		return "";
	}
	
	//문제 수정 기능
	@RequestMapping("modify")
	public String modifyQuestion(TestVO vo, String subjectName) {
		service.modifyQuestion(vo, subjectName);
		return "";
	}
	
	//문제 추가 기능
	@RequestMapping("insertQuestion")
	public String insertQuestion(TestVO vo, String subjectName) {
		service.insertQuestion(vo, subjectName);
		return "";
	}
	
}
