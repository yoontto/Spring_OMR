<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>home</title>
</head>
<body>
<h1>시험 선택</h1>
<form action="test" method="post">
	<div>
		<select id="sel" name="subjectName">
			<option value="bread">빵</option>
			<option value="snack">과자</option>
			<option value="icecream">아이스크림</option>
			<option value="fruit">과일</option>
		</select>
	</div>
	<input type="submit" value="선택">
	<input type="reset" value="취소">
</form>
</body>
</html>
