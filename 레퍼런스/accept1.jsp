<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>accept1.jsp : 과목선택창 -> accept2.jsp : 주의사항 확인창</title>
<link rel="icon" type="image/png" href="http://example.com/myicon.png">
<style type="text/css">
    @import url("css/accept1.css");
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/accept1.js"></script>
</head>
<body>
	<form action="accept2.jsp" method="get" name="FormName" id="FormName" onsubmit="return fnSubmit()" onreset="return fnReset()">
		<table border="1">
		<tr><td colspan="2" align="center">
				<label id="subjectLabel" >
				  <select class="subject" name="subject" id="sel" multiple size="5" required>
				    <optgroup class="subject_label" label="접수할 시험 선택">
				      <option class="subject_item" value="fruit" id="fruit">과일</option>
				      <option class="subject_item" value="icecream" id="icecream">아이스크림</option>
				      <option class="subject_item" value="snack" id="snack">스낵</option>
				      <option class="subject_item" value="bread" id="bread">빵</option>
				    </optgroup>
				  </select>
				</label>
			</td>
		</tr>
		<tr><td colspan="2" align="center">
				<input type="button" class="inputBtn" id="welcomeIndexBtn" name="welcomeIndexBtn" value="뒤로가기" onclick="location.href='WelcomeIndex.jsp'"/>
				<input type="submit" class="inputBtn" id="submitBtn" name="submitBtn" value="선택"/>
			</td>
		</tr>
		</table>
	</form>
</body>
</html>