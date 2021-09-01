<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
	<title>Home</title>
</head>
<body>


<form action="list.test" method="post">
		<table border="1">
		<tr><td colspan="2" align="center">
				<label>
				  <select name="subjectName" multiple size="5" required onchange="$('form').submit()">
				    <optgroup label="접수할 시험 선택">
				      <option value="fruit">과일</option>
				      <option value="icecream">아이스크림</option>
				      <option value="snack">스낵</option>
				      <option value="bread">빵</option>
				    </optgroup>
				  </select>
				</label>
			</td>
		</tr>
		</table>
</form>
		
	

</body>
</html>
