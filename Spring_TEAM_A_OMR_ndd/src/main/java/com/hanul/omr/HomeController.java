package com.hanul.omr;

import java.net.http.HttpRequest;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
	public String modifyQuestion(Model model, String subjectName) {
		
		//List<TestVO> listQuestion = service.listQuestion(subjectName);
		List<TestVO> listQuestion = null;
		
		if(subjectName == null) {
			model.addAttribute("listQuestion", listQuestion);
			model.addAttribute("subjectName", subjectName);
		}else {
			listQuestion = service.listQuestion(subjectName);
			model.addAttribute("listQuestion", listQuestion);
			model.addAttribute("subjectName", subjectName);
		}
		return "test/modify";
	}
	
	@RequestMapping("search")
	public String searchQuestion(Model model, String subjectName, int test_num) {
		System.out.println("과목: " + subjectName + "문제번호: " + test_num);
		TestVO vo = new TestVO();
		vo.setsubjectName(subjectName);
		vo.setTest_num(test_num);
		
		List<TestVO> searchQuestion = service.searchQuestion(vo);
		
		model.addAttribute("searchQuestion", searchQuestion);
		model.addAttribute("subjectName", subjectName);
		System.out.println(searchQuestion.get(0).getTest_problem());
		return "test/update";
	}
	
	@RequestMapping("update")
	public String updateQuestion(Model model, HttpServletRequest request, TestVO vo) {
		int test_num = Integer.parseInt(request.getParameter("test_num")) ;
		String subjectName = request.getParameter("subjectName");
		String test_problem = request.getParameter("test_problem");
		String test_choice1 = request.getParameter("test_choice1");
		String test_choice2 = request.getParameter("test_choice2");
		String test_choice3 = request.getParameter("test_choice3");
		String test_choice4 = request.getParameter("test_choice4");
		int test_answer = Integer.parseInt(request.getParameter("test_answer"));
		
		vo.setTest_num(test_num);
		vo.setsubjectName(subjectName);
		vo.setTest_problem(test_problem);
		vo.setTest_choice1(test_choice1);
		vo.setTest_choice2(test_choice2);
		vo.setTest_choice3(test_choice3);
		vo.setTest_choice4(test_choice4);
		vo.setTest_answer(test_answer);
		
		service.updateQuestion(vo);
		model.addAttribute(subjectName);
		return "test/modify";
	}
	
	@RequestMapping("insertQuestion")
	public String insertQuestion(TestVO vo, String subjectName) {
		service.insertQuestion(vo, subjectName);
		return "";
	}
	
	//페이지 수정용 깡통 매핑
	@RequestMapping("/testing")
	public String testing() {
		
		
		return "test/imsi";
	}
	
}
