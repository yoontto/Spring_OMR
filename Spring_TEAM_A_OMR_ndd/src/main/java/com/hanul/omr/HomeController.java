package com.hanul.omr;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import test.ResultVO;
import test.TestServiceImpl;
import test.TestVO;

@Controller
public class HomeController {
	@Autowired private TestServiceImpl service;
	//@Autowired @Qualifier("hanul") SqlSession sql;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
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
	
	
	@RequestMapping("get")
	public String getResult(Model model, String subjectName) {
		List<ResultVO> getResult = service.getResult(subjectName);
		model.addAttribute("getResult", getResult);
		return "";
	}
	
	@RequestMapping("insertResult")
	public String insertResult(ResultVO vo, String subjectName) {
		//ArrayList<ResultVO> list
		service.insertResult(vo, subjectName);
		return "";
	}
	
	@RequestMapping("modify")
	public String modifyQuestion(TestVO vo, String subjectName) {
		service.modifyQuestion(vo, subjectName);
		return "";
	}
	
	@RequestMapping("insertQuestion")
	public String insertQuestion(TestVO vo, String subjectName) {
		service.insertQuestion(vo, subjectName);
		return "";
	}
	
	
	
	
}
