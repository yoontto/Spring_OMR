<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.teamb.omr.TesterAnswerDTO"%>
<%@page import="com.teamb.omr.TestDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");

String name = request.getParameter("name");			//이름
//String num = request.getParameter("num");			//번호
String subject = request.getParameter("subject");	//과목


String[] answer = {
		request.getParameter("answer1"),
		request.getParameter("answer2"), 
		request.getParameter("answer3"), 
		request.getParameter("answer4"), 
		request.getParameter("answer5"), 
		request.getParameter("answer6"), 
		request.getParameter("answer7"), 
		request.getParameter("answer8"), 
		request.getParameter("answer9"), 
		request.getParameter("answer10") 
};	//제출받은 답

for(int i = 0; i < answer.length; i++){
	if(answer[i] == null){
		answer[i] = "0";
	}
}	//제출받은 답의 공백부분(null)을 0 값으로 수정

TestDAO dao = new TestDAO();
TesterAnswerDTO dto = new TesterAnswerDTO();

ArrayList <String> list = new ArrayList<>();
list = dao.selectSubject(subject);
	//정답 리스트

ArrayList <Integer> result = new ArrayList<>();
for(int i = 0; i < answer.length; i++){
	if(answer[i].compareTo(list.get(i+1)) == 0){
		result.add(1);
	} else{
		result.add(0);
	}
}	//제출받은 답과 정답을 비교
/* 
//-------------------------------------------------------------------------
for(int i = 0; i < answer.length; i++){
	out.println("제출받은"+ (i + 1) +"번 문제 답 : "+ answer[i] +"<br/>");
}//for

for(int i = 1; i < list.size(); i++){
	out.println((i) +"번 문제의 답 : "+ list.get(i) + "<br/>");
} 
for(int i = 0; i < result.size(); i++){
	if(result.get(i) == 1){
		out.println(result.get(i) + ",");
		out.println("O" + "<br/>");
	}else{
		out.println(result.get(i) + ",");
		out.println("X" + "<br/>");
	}
} 

out.println(name);
out.println(num);
out.println(subject);
//입력값 테스트 --------------------------------------------------------------------------
 */

request.setAttribute("answer", answer);
request.setAttribute("list", list);
request.setAttribute("subject", subject);
request.setAttribute("result", result);

%>

<jsp:forward page="Result.jsp" />
 
 
 
 
 
 
 
 
 
 
 