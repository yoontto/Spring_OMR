<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 
	문제 갯수 출력 
	 ${fn:length(list)} 개
	<br/>
	
	문제 정답 출력
	<c:forEach items="${list}" var="j">
		${j.test_answer}
	</c:forEach>
	<br/>
	
	응시자의 응시답 출력
	<c:forEach items="${answer_arr}" var="i">
		${i}
	</c:forEach>
	<br/>
	
	해당 과목의 평균 맞춘 갯수 출력
	${avgScore} 개
	<br/>
	
	해당 과목의 평균 점수 출력(반올림)
	${Math.round(avgScore * (100/fn:length(list))*100 )/100 } 점
	<br/>
	
	수험자의 맞춘 갯수 출력
	${score} 개
	<br/>
	수험자의 점수 출력(반올림)
	${Math.round(score * (100/fn:length(list))*100 )/100 } 점
	
</body>
</html>