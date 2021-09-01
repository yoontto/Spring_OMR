<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 수정</title>
</head>
<body>
<h4>[문제 수정]</h4>
	<div>
	<form action="modify" method="post">
		<span>과목 선택</span>
		<select id="subject" name="subjectName" onchange="$('form').submit()">
			<option ${subjectName eq 'bread' ? 'selected' : '' } value="bread">빵</option>
			<option ${subjectName eq 'fruit' ? 'selected' : '' } value="fruit">과일</option>
			<option ${subjectName eq 'icecream' ? 'selected' : '' } value="icecream">아이스크림</option>
			<option ${subjectName eq 'snack' ? 'selected' : '' } value="snack">과자</option>
		</select>
	</form>
	<!-- <input type="hidden" name="subjectName" value="${subjectName}" /> -->
	</div>
	<br/><button>문제 추가</button><br/><br/>
	<div>
		<c:if test="${!empty listQuestion}">
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
					<button onclick="location.href='update?test_num=${list.test_num}&subjectName=${subjectName}'">문제 수정</button>
					<button>문제 삭제</button>
				</div>
			</c:forEach>
		</c:if>
	</div>

</body>
</html>