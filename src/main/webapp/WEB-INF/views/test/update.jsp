<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 세부 수정</title>
</head>
<body>
	<h3>[문제 세부수정]</h3>
	<form action="update" method="post">
		<div>
			<span>과목명 : ${test_name}</span>
		</div>
		<div>	
			<c:forEach var="list" items="${searchQuestion}">	
				<div>
					문제번호 : [${list.test_num }].<br/>
					<textarea rows="10" cols="50" name="" >${list.test_problem }</textarea>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;1.<input type="text" value="${list.test_choice1 }"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;2.<input type="text" value="${list.test_choice2 }"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;3.<input type="text" value="${list.test_choice3 }"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;4.<input type="text" value="${list.test_choice4 }">
				</div>
	
			</c:forEach>	
		</div>
		<div>
			<button onclick="location.href='update?test_num=${list.test_num}&test_name=${test_name}'">문제 저장</button>
			<button>문제 삭제</button>
		</div>
	</form>
</body>
</html>