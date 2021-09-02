<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% String subjectName = (String) request.getAttribute(subjectName);%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 페이지</title>
<script type="text/javascript">
function fnInput(){
	location.href="input.jsp";
}
</script>
</head>
<body>
	<form action="result" method="get">
	<input type="hidden">
		<h3>[시험 페이지]</h3>		
		<h3>[과목 : ${subjectName }]</h3>
		<input type="hidden" value="${subjectName }" name="subjectName">
		<div>
			<input type="button" value="시험문제 추가" onclick="location.href='test.add?subjectName=${subjectName}'"/>
			<c:set var="problem_num" value="0" />
			<c:forEach var="list" items="${listQuestion}">
				<c:set var="problem_num" value="${problem_num + 1}"/>
				<div>
					[${problem_num}].
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
							<td><label for="${problem_num}_1">1</label><input type="radio" value="1" id="${problem_num}_1" name="q${problem_num}" /></td>      
							<td><label for="${problem_num}_2">2</label><input type="radio" value="2" id="${problem_num}_2" name="q${problem_num}" /></td>
							<td><label for="${problem_num}_3">3</label><input type="radio" value="3" id="${problem_num}_3" name="q${problem_num}" /></td>
							<td><label for="${problem_num}_4">4</label><input type="radio" value="4" id="${problem_num}_4" name="q${problem_num}" /></td>
						</tr>                 
					</table>
				</div>
			</c:forEach>
		</div>
		<div>
		<input type="hidden" value="${problem_num}" name="problem_num" />
			<input type="submit" value="답안제출" />
			<input type="button" value="수정" onclick="fnInput()">
		</div>
	</form>
</body>
</html>











