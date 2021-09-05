<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url('css/general.css');
</style>
</head>
<body>

<div class="container_input">
<div class="title_input2">문제 추가 페이지</div>
	<div class="item_input">
		<div class="inner_item">
		<form action="addQuestion" method="post">
			<input type="hidden" readonly="readonly" value="${subjectName}" name="subjectName" /><br/>
			<table class="table_input">
				<tr>
					<th>과목</th>
					<td>
						${ subjectName eq 'bread' ? '빵' : '' }
						${ subjectName eq 'fruit' ? '과일' : '' }
						${ subjectName eq 'icecream' ? '아이스크림' : '' }
						${ subjectName eq 'snack' ? '과자' : '' }
					</td>
				</tr>
				<tr>
					<th>문항 작성</th><!-- <input type="text" name="test_problem" maxlength="666"/> -->
					<td>
						<textarea class="test_input" rows="5" cols="50" name="test_problem" style="resize: none;" maxlength="666" required="required"></textarea>
					</td>
				</tr>
				
			<tr>
				<th>보기1 작성</th>
				<td>
					<input class="test_input" type="text" name="test_choice1" maxlength="100"/>
				</td>
				</tr>
			<tr>
				<th>보기2 작성</th>
				<td>
					<input class="test_input" type="text" name="test_choice2" maxlength="100"/>
				</td>
			</tr>
			
			<tr>
				<th>보기3 작성</th>
				<td><input class="test_input" type="text" name="test_choice3" maxlength="100"/></td>
			</tr>
			<tr>
				<th>보기4 작성</th>
				<td><input class="test_input" type="text" name="test_choice4" maxlength="100"/></td>
			</tr>
			<tr>
				<th>정답 선택</th>
				<td>
					<label for='answer1'> 1 </label><input class="radio_size_input" type="radio" id = "answer1" name="test_answer" value="1" checked="checked"/>
					<label for='answer2'> 2 </label><input class="radio_size_input" type="radio" id = "answer2" name="test_answer" value="2"/>
					<label for='answer3'> 3 </label><input class="radio_size_input" type="radio" id = "answer3" name="test_answer" value="3"/>
					<label for='answer4'> 4 </label><input class="radio_size_input" type="radio" id = "answer4" name="test_answer" value="4"/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="btn_2_input" type="submit" value="전송"/>
				</td>
				</tr>
			</table>
		</form>
		</div>
	</div>
</div>


</body>
</html>