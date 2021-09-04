<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
	<title>home</title>
</head>
<style>
	@import url(css/general.css);
</style>
<body>
<div class="container">
	<div class="item">
		<div class="inner_item">
			<h1 class="title">시험 선택</h1>
			<form action="list" method="post">
				<select id="sel" name="subjectName">
					<option value="bread">빵</option>
					<option value="snack">과자</option>
					<option value="icecream">아이스크림</option>
					<option value="fruit">과일</option>
				</select>
				<input type="submit" class="btn_1" value="선택"><br>
				<input type="button" class="btn_2" value="문제 수정 페이지로 이동" onclick="location.href='modify'"/>
			</form>
		</div>
	</div>
</div>
</body>
</html>
