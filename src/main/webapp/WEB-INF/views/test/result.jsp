<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	<div align="center">
		<table border="1">
			<tr align="center">
				<th>응시번호</th>
				<td colspan="10"><input type="text" value="1234" readonly="readonly" style="text-align: center" > </td>
			</tr>
			
			<tr align="center">
				<th>응시과목</th>
				<td colspan="10">${subjectName }</td>
			</tr>
			
			<tr align="center">
				<th>문제</th>
				<c:forEach items="${list}" var="vo">
					<c:if test="${vo.test_num < 10 }">
						<td>0${vo.test_num}</td>
					</c:if>
					<c:if test="${vo.test_num >= 10 }">
						<td>${vo.test_num}</td>
					</c:if>
					
				</c:forEach>
			</tr>
			
			<tr align="center">
				<th>정답</th>
				<c:forEach items="${list}" var="vo">
					<td>${vo.test_answer}</td>
				</c:forEach>
			</tr>
			
			<tr align="center">
				<th>내 정답</th>
				<c:forEach items="${answer_arr}" var="i">
					<td>
							<%-- ${param.q1} --%>
							${i}
							
					</td> 
					<%-- 
					 	<c:set var="result" value="${param}" />  
							${result + . + q + i}
						<c:set var="i" value="${i + 1}"/>
					 --%>	
				</c:forEach> 
			</tr>
				 
				<%-- 
					 <c:set var="listSize" value="${fn:length(list)}"/>
				<%		*******java		
				int arrSize = 10;
				String[] answer = new String[arrSize];
				for(int i = 0; i < answer.length; i++){
					answer[i] = request.getParameter("q" + (i+1));
				}
				
				for(int i = 0; i < answer.length; i++ ){%>
					<td><%=answer[i] %></td>
				<%} %>
				--%>
	<%-- 	<c:forEach var="i" begin="0" end="${fn:length(fruit)-1}" step="1" > --%>
	<%--       <li>${fruit[i]}</li> --%>
	<%--    </c:forEach> --%>
			<tr align="center">
				<th>점수</th>
				<td colspan="10"><input type="text" readonly="readonly" value="${o}" style="text-align: center;" ></td>
			</tr>
		</table>
	</div>
</body>
</html>