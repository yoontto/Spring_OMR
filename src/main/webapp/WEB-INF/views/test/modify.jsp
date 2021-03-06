<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 수정 완료 페이지</title>
<style type="text/css">
	@import url('css/general.css');
</style>
</head>
<body>
<div class="container_modify">
	<div class="title_modify">과목별 문제 보기</div>
	<div class="tempsizing_modify">
		<form action="modify" method="post">
			<select id="subject" name="test_name" class="sel" onchange="$('form').submit()">
			<option ${empty test_name or test_name eq 'no_select' ? 'selected' : '' } value="no_select" >과목 선택</option>
				<option ${test_name eq 'bread' ? 'selected' : '' } value="bread" >빵</option>
				<option ${test_name eq 'fruit' ? 'selected' : '' } value="fruit">과일</option>
				<option ${test_name eq 'icecream' ? 'selected' : '' } value="icecream">아이스크림</option>
				<option ${test_name eq 'snack' ? 'selected' : '' } value="snack">과자</option>
			</select>
		</form>
		<input type="button" class="btn_2" value="시험푸는 페이지로 이동" onclick="location.href='list?subjectName=${empty test_name ? 'bread' : test_name }'"/>
		<input type="button" class="btn_2" value="시험문제 추가" 
			onclick="location.href='test.add?subjectName=${test_name}'"/>
		<!-- <input type="hidden" name="test_name" value="${test_name}" /> -->
	</div>
	
	
		<c:if test="${!empty listQuestion}">
			<c:forEach var="list" items="${listQuestion}">
				<div class="item_modify">
					<div class="inner_item_test">
						<div class="align_left_test">
							${list.test_num }.
							${list.test_problem }
						</div>
						<div class="align_left_test">
							1. ${list.test_choice1 }<br/>
							2. ${list.test_choice2 }<br/>
							3. ${list.test_choice3 }<br/>
							4. ${list.test_choice4 }
						</div>
						<div >
							<button  class="btn_modify" onclick="location.href='search?test_num=${list.test_num}&test_name=${test_name}'">문제 수정</button>
							<!-- <button onclick="location.href='search'">문제 수정</button> -->
							<input type="button" class="btn_modify" value="문제 삭제" onclick="fnDelete('${list.test_num }')" >
						</div>
					</div>
				</div>
			</c:forEach>
		</c:if>
</div>
<script type="text/javascript">
	function fnDelete(test_num) {
		var subject = "${test_name}";
		alert(subject, test_num);
		$.ajax({
			type:'post',
			url : 'delete',
			data : { subject:subject,  pnum:test_num },
			success: function ( response ) {
				alert("문제가 삭제되었습니다.");
				location.reload();
			},error : function (req,text) {
				alert(subject);
				alert(text + " : " + req.status);
			}
		});
	}
</script>
</body>
</html>