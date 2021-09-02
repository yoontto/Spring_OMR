<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 페이지</title>
</head>
<body>
	
	<form action="testing" method="post">
		<h3>[시험 페이지]</h3>		
		<h3>[과목 : ${subjectName }]</h3>
		<input type="hidden" value="${subjectName }" name="subjectName">
		<div>
			<c:forEach var="list" items="${listQuestion}">
			
				<div>
					[${list.test_num }].
					${list.test_problem }
				</div>
				<div>
					&nbsp;&nbsp;&nbsp;&nbsp;1. ${list.test_choice1 }<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;2. ${list.test_choice2 }<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;3. ${list.test_choice3 }<br/>
					&nbsp;&nbsp;&nbsp;&nbsp;4. ${list.test_choice4 }
				</div>
				<div>
					<table>
						<tr>
							<td><label for="${list.test_num}_1">1</label><input type="radio" value="1" id="${list.test_num}_1" name="q${list.test_num}" /></td>      
							<td><label for="${list.test_num}_2">2</label><input type="radio" value="2" id="${list.test_num}_2" name="q${list.test_num}" /></td>
							<td><label for="${list.test_num}_3">3</label><input type="radio" value="3" id="${list.test_num}_3" name="q${list.test_num}" /></td>
							<td><label for="${list.test_num}_4">4</label><input type="radio" value="4" id="${list.test_num}_4" name="q${list.test_num}" /></td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="submit" value="답안제출" />
		</div>
	</form>
</body>
</html>











