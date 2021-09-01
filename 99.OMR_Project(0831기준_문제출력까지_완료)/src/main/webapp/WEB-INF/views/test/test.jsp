<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div>
			<table>
				<tr>
					<th>시험문제</th>
					<th>보기1</th>
					<th>보기2</th>
					<th>보기3</th>
					<th>보기4</th>
				</tr>
				<form>
				<c:set var="count">0</c:set>
				<c:forEach items="${list}" var="vo">
					<tr>
						<td>${vo.test_problem }</td>
						<td>${vo.test_choice1 }<input type="radio" name="answer<%=i%>" value="1"/></td>
						<td>${vo.test_choice2 }<input type="radio" value="2"/></td>
						<td>${vo.test_choice3 }<input type="radio" value="3"/></td>
						<td>${vo.test_choice4 }<input type="radio" value="4"/></td>
					</tr>
				</c:forEach>
				</form>
			</table>
		</div>
</body>
</html>

			<% for(int i = 1; i <= 10; i ++){ %>
			<tr id="q<%=i%>" class="questionList">
				<th>&nbsp;<%=i%> 번&nbsp;</th>
				<td><label for="q_1_<%=i%>">&nbsp;1&nbsp;</label><input type="radio" id="q_1_<%=i%>" class="qNum1" value="1" name="answer<%=i%>" /></td>
				<td><label for="q_2_<%=i%>">&nbsp;2&nbsp;</label><input type="radio" id="q_2_<%=i%>" class="qNum2" value="2" name="answer<%=i%>" /></td>
				<td><label for="q_3_<%=i%>">&nbsp;3&nbsp;</label><input type="radio" id="q_3_<%=i%>" class="qNum3" value="3" name="answer<%=i%>" /></td>
				<td><label for="q_4_<%=i%>">&nbsp;4&nbsp;</label><input type="radio" id="q_4_<%=i%>" class="qNum4" value="4" name="answer<%=i%>" /></td>
			</tr>
			<%} %>