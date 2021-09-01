<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>result</title>
</head>
<body>
	<div align="center">
	<p>${subjectName}</p>
		<table border="1">
			<tr align="center">
				<th>응시번호</th>
				<td colspan="3"><input type="text" value="1234" readonly="readonly" style="text-align: center" > </td>
			</tr>
			<tr align="center">
				<td>문제</td>
				<td>정답</td>
				<td>내 정답</td>
				<td>결과</td>
			</tr>
			<c:forEach items="${list}" var="vo">
			<tr align="center">
				<td>${vo.test_num}</td>
				<td>${vo.test_answer}</td>
				<td>0</td>
				<td>x</td>
			</tr>
			</c:forEach>
			<tr>
				<th>점수</th>
				<td colspan="3"><input type="text" readonly="readonly" ></td>
			</tr>
		</table>
	</div>
</body>
</html>