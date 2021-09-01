<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<form action="list" method="post">
	<h4>과목 선택</h4>
	<select name="subjectName">
		<option value="bread">빵</option>
		<option value="fruit">과일</option>
		<option value="icecream">아이스크림</option>
		<option value="snack">과자</option>
	</select>
	<br/><br/>
	<input type="submit" value="시험 시작"/>
</form>
</body>
</html>
