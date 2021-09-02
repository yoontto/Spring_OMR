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
		<input type="hidden" name="subjectName" value="${subjectName}">
		<div>
			<span>과목명 : ${subjectName}</span>
		</div>
		<div>	
			<c:forEach var="list" items="${searchQuestion}">	
				<div>
					문제번호 : [${list.test_num }].<br/>
					<input type="hidden" name="test_num" value="${list.test_num }">
					<textarea rows="10" cols="50" name="test_problem" >${list.test_problem }</textarea>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;1.<input type="text" name="test_choice1" value="${list.test_choice1 }"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;2.<input type="text" name="test_choice2" value="${list.test_choice2 }"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;3.<input type="text" name="test_choice3" value="${list.test_choice3 }"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;4.<input type="text" name="test_choice4" value="${list.test_choice4 }">	<br/>
					<br/>
					문제의 답 번호: <input type="text" name="test_answer" value="${list.test_answer}">	<br/>
				</div>
				
			</c:forEach>	
		</div>
		<div>
			<input type="submit" value="문제 저장" />
			<button>문제 삭제</button>
		</div>
	</form>
</body>
</html>