package com.hanul.omr;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
	
	@RequestMapping("/list")
	public String listQuestion(Model model ,String test_name) {
		List<TestVO> listQuestion = service.listQuestion(test_name);
		model.addAttribute("listQuestion", listQuestion);
		model.addAttribute("test_name", test_name);
		for (TestVO testVO : listQuestion) {
			System.out.println(testVO.getTest_answer());
		}
		return "test/test";
	}
	
	
	@RequestMapping("get")
	public String getResult(Model model, String test_name) {
		List<ResultVO> getResult = service.getResult(test_name);
		model.addAttribute("getResult", getResult);
		return "";
	}
	
	@RequestMapping("insertResult")
	public String insertResult(ResultVO vo, String test_name) {
		//ArrayList<ResultVO> list
		service.insertResult(vo, test_name);
		return "";
	}
	
	@RequestMapping("update")
	public String updateQuestion(TestVO vo, String test_name, String test_num) {
		
		service.modifyQuestion(vo, test_name);
		return "";
	}
	
	@RequestMapping("modify")
	public String modifyQuestion(Model model, TestVO vo, String test_name) {
		List<TestVO> listQuestion = null;
		if(test_name == null) {
			model.addAttribute("listQuestion", listQuestion);
			model.addAttribute("test_name", test_name);
		}else {
			listQuestion = service.listQuestion(test_name);
			model.addAttribute("listQuestion", listQuestion);
			model.addAttribute("test_name", test_name);
		}
		return "test/modify";
	}
	
	/*
	@RequestMapping("search")
	public String searchQuestion(Model model, String test_name, String test_num) {
		TestVO vo = null;
		vo.setTest_name(test_name);
		
		service.searchQuestion(, test_num);
		return "test/update";
	}
	*/
	
	@RequestMapping("insertQuestion")
	public String insertQuestion(TestVO vo, String test_name) {
		service.insertQuestion(vo, test_name);
		return "";
	}
	
	//페이지 수정용 깡통 매핑
	@RequestMapping("/testing")
	public String testing() {
		
		
		return "test/imsi";
	}
	
}
