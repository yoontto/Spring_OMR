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
	
	@RequestMapping("update")
	public String updateQuestion(TestVO vo, String subjectName, String test_num) {
		
		
		service.modifyQuestion(vo, subjectName);
		return "";
	}
	
	@RequestMapping("modify")
	public String modifyQuestion(Model model, TestVO vo, String subjectName) {
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
	/*
	 * @RequestMapping("list.hr") public String listHr(Model model, String dept_id,
	 * HttpSession session) { session.setAttribute("category", "hr"); //dept_id 값이
	 * 있는지 없는지에 따라 전체목록을 조회할 것이지, 아니면 조건에 따라 검색할 것인지 //부서 정보가 없다면(또는 departments
	 * table에 데이터가 없을 때) ▶ 전체 조회가 되어야 함 List<DepartmentVO> depts =
	 * service.department_list(); //null : 파라미터가 없는 경우 //all : 전체 조회를 위한 파라메터 if
	 * (dept_id == null || dept_id.equals("all")) { model.addAttribute("list",
	 * service.employee_list()); }else { model.addAttribute("list",
	 * service.employee_list(dept_id)); }
	 * 
	 * //for (DepartmentVO departmentVO : depts) { //
	 * System.out.println(departmentVO.getDepartment_name()); //}
	 * 
	 * model.addAttribute("dept_id", (dept_id == null || dept_id.equals("all") ?
	 * "all" : dept_id)); model.addAttribute("depts", depts); return
	 * "employee/list"; }
	 */
	
	
	
	
	
	
	
	@RequestMapping("insertQuestion")
	public String insertQuestion(TestVO vo, String subjectName) {
		service.insertQuestion(vo, subjectName);
		return "";
	}
	
	//페이지 수정용 깡통 매핑
	@RequestMapping("/testing")
	public String testing() {
		return "test/modify";
	}
	
}
