<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="addQuestion" method="post">
과목 : <input type="text" readonly="readonly" value="${subjectName}" name="subjectName" /><br/>
문제문항 작성 : <input type="text" name="test_problem" maxlength="666"/><br/>
문제보기1 작성 : <input type="text" name="test_choice1" maxlength="100"/><br/>
문제보기2 작성 : <input type="text" name="test_choice2" maxlength="100"/><br/>
문제보기3 작성 : <input type="text" name="test_choice3" maxlength="100"/><br/>
문제보기4 작성 : <input type="text" name="test_choice4" maxlength="100"/><br/>
정답선택 : 
<label for='answer1'> 1 </label><input type="radio" id = "answer1" name="test_answer" value="1" checked="checked"/>
<label for='answer2'> 2 </label><input type="radio" id = "answer2" name="test_answer" value="2"/>
<label for='answer3'> 3 </label><input type="radio" id = "answer3" name="test_answer" value="3"/>
<label for='answer4'> 4 </label><input type="radio" id = "answer4" name="test_answer" value="4"/><br/>
<input type="submit" value="전송"/>
</form>
</body>
</html>