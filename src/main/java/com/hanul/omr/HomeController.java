package com.hanul.omr;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ResponseBody;

import test.ResultVO;
import test.TestServiceImpl;
import test.TestVO;

@Controller
public class HomeController {

	@Autowired
	private TestServiceImpl service;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// 메인페이지
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "home";
	}

	// 에러난 경우 페이지 이동
	@RequestMapping("/error")
	public String error(HttpServletRequest request, Model model) {
		// 에러메시지msg 보내기 위한 모델
		Throwable exception = (Throwable) request.getAttribute("javax.servlet.error.exception");
		// Throwable최상위 오류 처리하는 클래스
		StringBuffer msg = new StringBuffer();
		while (exception != null) {
			msg.append("<p>").append(exception.getMessage()).append("</p>");
			exception = exception.getCause();// ?뭔지 모르겠음
		}
		model.addAttribute("msg", msg.toString());
		int code = (Integer) request.getAttribute("javax.servlet.error.status_code");
		return "error/" + (code == 404 ? "404" : "default");
	}

	// 고른 과목 페이지로 이동
	@RequestMapping("list")
	public String listQuestion(Model model, String subjectName) {
		List<TestVO> listQuestion = service.listQuestion(subjectName);
		model.addAttribute("listQuestion", listQuestion);
		model.addAttribute("subjectName", subjectName);
		for (TestVO testVO : listQuestion) {
			System.out.println(testVO.getTest_answer());
		}
		return "test/test";
	}

	// 응시자의 응답 저장 : 영은
	@RequestMapping("result")
	public String list(Model model, String subjectName, int test_num, HttpServletRequest request) {

		String answer = null;
		List<String> answer_arr = new ArrayList<String>();
		for (int i = 1; i <= test_num; i++) {
			answer = request.getParameter("answer" + i);
			if (answer == null) {
				answer = "0";
			}
			answer_arr.add(answer);
		}
		int score = service.insertResult(answer_arr, subjectName);// db저장 및 맞춘갯수 메소드
		List<TestVO> list = service.listQuestion(subjectName);
		double avgScore = service.avgResult(subjectName);// 과목별 평균점수 메소드
		model.addAttribute("answer_arr", answer_arr);// 해당과목별 응시자의 응시답 출력
		model.addAttribute("list", list);// 해당과목별정답 출력
		model.addAttribute("score", score);// 수험자의 맞춘갯수 출력
		model.addAttribute("avgScore", avgScore);// 해당과목별평균점수출력
		return "test/testResult";// 페이지에 위치.
	}

	// 문제 추가 페이지 이동 : 영은
	@RequestMapping("test.add")
	public String testadd(Model model, String subjectName) {
		// System.out.println("test.add : " + subjectName);
		model.addAttribute("subjectName", subjectName);
		return "test/input";
	}

	// 문제 추가 기능 : 영은
	@RequestMapping("addQuestion")
	public String addQuestion(Model model, String subjectName, String test_answer, String test_problem,
			String test_choice1, String test_choice2, String test_choice3, String test_choice4) {
		// System.out.println("addQuestion : " + subjectName);
		TestVO vo = new TestVO();
		vo.setTest_problem(test_problem);
		vo.setTest_choice1(test_choice1);
		vo.setTest_choice2(test_choice2);
		vo.setTest_choice3(test_choice3);
		vo.setTest_choice4(test_choice4);
		vo.setTest_answer(Integer.parseInt(test_answer));
		String tableName = "teamA_test_" + subjectName;
		vo.setTest_name(tableName);
		service.insertQuestion(vo);

		return "redirect:list.test?subjectName=" + subjectName;
	}

	@RequestMapping("modify")
	public String modifyQuestion(Model model, String test_name) {
		
		//List<TestVO> listQuestion = service.listQuestion(test_name);
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
	
	@RequestMapping("search")
	public String searchQuestion(Model model, String test_name, int test_num) {
		System.out.println("과목: " + test_name + "문제번호: " + test_num);
		TestVO vo = new TestVO();
		vo.setTest_name(test_name);
		vo.setTest_num(test_num);
		
		List<TestVO> searchQuestion = service.searchQuestion(vo);
		
		model.addAttribute("searchQuestion", searchQuestion);
		model.addAttribute("test_name", test_name);
		System.out.println(searchQuestion.get(0).getTest_problem());
		return "test/update";
	}
	
	@RequestMapping("delete")
	public String delete(String subject, int pnum) {
		System.out.println("subject" + subject + "pnum" + pnum);
		service.deleteQuestion(subject, pnum);
		return "test/test"; 
	}
}
