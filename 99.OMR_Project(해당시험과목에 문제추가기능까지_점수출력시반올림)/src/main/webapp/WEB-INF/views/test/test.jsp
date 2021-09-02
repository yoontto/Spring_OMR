<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function fnSubmit() {
	
}
</script>
</head>
<body>
		<div>
			<input type="button" value="시험문제 추가" onclick="location.href='test.add?subjectName=${subjectName}'"/>
			<form action="test.Result" method="post" onsubmit="return fnSubmit()">
			<table>
				<tr>
					<th>문제번호</th>
					<th>시험문제</th>
					<th>보기1</th>
					<th>보기2</th>
					<th>보기3</th>
					<th>보기4</th>
				</tr>
				<c:set var="problem_num" value="0" />
				<c:forEach items="${list}" var="vo">
					<c:set var="problem_num" value="${problem_num + 1}"/>
					<tr><td>[${problem_num}번]</td>
						<td>${vo.test_problem }</td>
						<td><label for='answer${problem_num}_1'>${vo.test_choice1 }</label><input type="radio" id="answer${problem_num}_1" name="answer${problem_num}" value="1"/></td>
						<td><label for='answer${problem_num}_2'>${vo.test_choice2 }</label><input type="radio" id="answer${problem_num}_2" name="answer${problem_num}" value="2"/></td>
						<td><label for='answer${problem_num}_3'>${vo.test_choice3 }</label><input type="radio" id="answer${problem_num}_3" name="answer${problem_num}" value="3"/></td>
						<td><label for='answer${problem_num}_4'>${vo.test_choice4 }</label><input type="radio" id="answer${problem_num}_4" name="answer${problem_num}" value="4"/></td>
					</tr>
				</c:forEach>
			</table>
			<input type="hidden" value="${subjectName}" name="subjectName" />
			<input type="hidden" value="${problem_num}" name="problem_num" />
			<input type="submit" value="전송"/>
			</form>
		</div>
</body>
</html>