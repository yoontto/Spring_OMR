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
	
	@RequestMapping("test")
	public String test(String subjectName, Model model) {
		List<TestVO> list = service.listQuestion(subjectName);
		model.addAttribute("list",list);
		return "test/test";
	}
	
	@RequestMapping("list")
	public String listQuestion(Model model ,String subjectName) {
		List<TestVO> listQuestion = service.listQuestion(subjectName);
		model.addAttribute("listQuestion", listQuestion);
		model.addAttribute("subjectName", subjectName);
		for (TestVO testVO : listQuestion) {
			System.out.println(testVO.getTest_answer());
		}
		return "test/test";
	}
	
	//재욱 : 결과 창 불러오기
	@RequestMapping("result")
	public String result(Model model) {
		
		List<TestVO> vo = service.listQuestion(null);
		
//		for (TestVO testVO : vo) {
//			System.out.println(testVO.getTest_answer());
//		}
		
		model.addAttribute("list", vo);
		
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
