<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문제 세부 수정</title>
<style type="text/css">
	@import url('css/general.css');
</style>
</head>
<body>
<div class="container_update">
	<div class="title_update">문제 세부수정</div>
	<div class="item_update">
		<div class="inner_item_update">
			<form action="update" method="post" style="width: 100%; height: 100%">
				<input type="hidden" name="test_name" value="${test_name}">
				
				<div class="subtitle_update">
					<c:if test="${test_name eq 'icecream' }"> 아이스크림</c:if>
					<c:if test="${test_name eq 'snack' }"> 과자</c:if>
					<c:if test="${test_name eq 'bread' }"> 빵</c:if>
					<c:if test="${test_name eq 'fruit' }"> 과일</c:if>
				</div>
				
				<div>	
					<c:forEach var="list" items="${searchQuestion}">	
						<div class="subtitle_update1">
							${list.test_num }번 문제
						</div>
						
						<div>
							<input type="hidden" name="test_num" value="${list.test_num }">
							<textarea class="textarea_update" rows="10" cols="30" name="test_problem"  required="required">${list.test_problem }</textarea>
						</div>
						<div class="subtitle_update1">정답선택</div>
						<div class="subtitle_update1">
						  <input type="radio" class="radio_hidden_test" id = "answer1" name="test_answer" value="1" ${ list.test_answer eq 1 ? 'checked' : '' }/>
							<label for='answer1'>  1.  </label><input type="text" name="test_choice1" value="${list.test_choice1 }" required="required"><br>
						  <input type="radio" class="radio_hidden_test" id = "answer2" name="test_answer" value="2" ${ list.test_answer eq 2 ? 'checked' : '' }/>
							<label for='answer2'>  2.  </label><input type="text" name="test_choice2" value="${list.test_choice2 }" required="required"><br>
						  <input type="radio" class="radio_hidden_test" id = "answer3" name="test_answer" value="3" ${ list.test_answer eq 3 ? 'checked' : '' }/>
							<label for='answer3'>  3.  </label><input type="text" name="test_choice3" value="${list.test_choice3 }" required="required"><br>
						  <input type="radio" class="radio_hidden_test" id = "answer4" name="test_answer" value="4" ${ list.test_answer eq 4 ? 'checked' : '' }/>
							<label for='answer4'>  4.  </label><input type="text" name="test_choice4" value="${list.test_choice4 }" required="required">
							<%-- 2.<input type="text" name="test_choice2" value="${list.test_choice2 }" required="required"> <br/>
							3.<input type="text" name="test_choice3" value="${list.test_choice3 }" required="required"> <br/>
							4.<input type="text" name="test_choice4" value="${list.test_choice4 }" required="required">	<br/>
							<br/>
							  
		1 
		<label for='answer2'> 2 </label><input type="radio" id = "answer2" name="test_answer" value="2" ${ list.test_answer eq 2 ? 'checked' : '' }/>
		<label for='answer3'> 3 </label><input type="radio" id = "answer3" name="test_answer" value="3" ${ list.test_answer eq 3 ? 'checked' : '' }/>
		<label for='answer4'> 4 </label><input type="radio" id = "answer4" name="test_answer" value="4" ${ list.test_answer eq 4 ? 'checked' : '' }/><br/> --%>
						</div>
						
					</c:forEach>	
				</div>
				<div>
					<input type="submit" class="btn_2" value="문제 저장" />
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>