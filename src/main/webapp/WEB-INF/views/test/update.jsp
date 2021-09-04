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
		<input type="hidden" name="test_name" value="${test_name}">
		<div>
			<span>과목명 : ${test_name}</span>
		</div>
		<div>	
			<c:forEach var="list" items="${searchQuestion}">	
				<div>
					문제번호 : [${list.test_num }].<br/>
					<input type="hidden" name="test_num" value="${list.test_num }">
					<textarea rows="10" cols="50" name="test_problem" style="resize: none;" required="required">${list.test_problem }</textarea>
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;1.<input type="text" name="test_choice1" value="${list.test_choice1 }" required="required"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;2.<input type="text" name="test_choice2" value="${list.test_choice2 }" required="required"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;3.<input type="text" name="test_choice3" value="${list.test_choice3 }" required="required"> <br/>
					&nbsp;&nbsp;&nbsp;&nbsp;4.<input type="text" name="test_choice4" value="${list.test_choice4 }" required="required">	<br/>
					<br/>
					정답선택 : 
<label for='answer1'> 1 </label><input type="radio" id = "answer1" name="test_answer" value="1" ${ list.test_answer eq 1 ? 'checked' : '' }/>
<label for='answer2'> 2 </label><input type="radio" id = "answer2" name="test_answer" value="2" ${ list.test_answer eq 2 ? 'checked' : '' }/>
<label for='answer3'> 3 </label><input type="radio" id = "answer3" name="test_answer" value="3" ${ list.test_answer eq 3 ? 'checked' : '' }/>
<label for='answer4'> 4 </label><input type="radio" id = "answer4" name="test_answer" value="4" ${ list.test_answer eq 4 ? 'checked' : '' }/><br/>
				</div>
				
			</c:forEach>	
		</div>
		<div>
			<input type="submit" value="문제 저장" />
		</div>
	</form>
</body>
</html>