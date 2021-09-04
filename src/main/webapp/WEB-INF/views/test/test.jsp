<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% String subjectName = (String) request.getAttribute(subjectName);%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 페이지</title>
</head>
<body>
	<form action="result" method="get">
	<input type="hidden">
		<h3>[시험 페이지]</h3>		
		<h3>[과목 : ${subjectName }]</h3>
		<!-- 시험 종료 타이머 -->
		<span id="timer"></span>
		<input type="hidden" value="${subjectName }" name="subjectName">
		<c:set var="problem_num" value="0" />
		<div>
			<input type="button" value="시험문제 추가" 
				onclick="location.href='test.add?subjectName=${subjectName}'"/>
			<c:forEach var="list" items="${listQuestion}">
				<c:set var="problem_num" value="${problem_num + 1}"/>
				<div>[${problem_num}번 문제].
				<input type="button" value="문제 수정" onclick="location.href='search?test_num=${list.test_num}&test_name=${subjectName}'">
				<input type="button" value="문제 삭제" onclick="fnDelete('${list.test_num }')" >문제 삭제
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
							<td><label for="${list.test_num}_1">1</label><input type="radio" value="1" id="${list.test_num}_1" name="q${problem_num}" /></td>      
							<td><label for="${list.test_num}_2">2</label><input type="radio" value="2" id="${list.test_num}_2" name="q${problem_num}" /></td>
							<td><label for="${list.test_num}_3">3</label><input type="radio" value="3" id="${list.test_num}_3" name="q${problem_num}" /></td>
							<td><label for="${list.test_num}_4">4</label><input type="radio" value="4" id="${list.test_num}_4" name="q${problem_num}" /></td>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
		<div>
			<input type="hidden" value="${problem_num}" name = "problem_num"/>
			<input type="hidden" value="${test_num}" name = "test_num"/>
			
			<input type="submit" value="답안제출" />
		</div>
	</form>
<script type="text/javascript">
	function fnDelete(test_num) {
		var subject = "${subjectName}";
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
	
	$(function(){
		
		//timer 함수
		var time = 60 * 60;   //기준시간 작성(총 sec)
		var min = "";   // 분
		var sec = "";   // 초
		var fntimer = setInterval(function () {
			min = parseInt(time/60);   //분 계산
			sec = (time%60);   //초 계산
			document.getElementById("timer").innerHTML = min + "분" + sec + "초";
			time--;
			//타임아웃
			 if (time < 0) {
				clearInterval(fntimer);
				$("form").submit(); 
		   }// if
			
		}, 1000);// fntimer()
		
	 	/* $("input[type=submit]").click(function() {
			$("form").submit();
		}) //submit click */
		 
		
		$("form").submit(function() {
			if(time > 0){
				if (confirm("시험을 종료하고 답안을 제출하시겠습니까?")) {
					return true;
				}else{
					return false;
				}
			} else{
				alert("시험 시간이 종료되었습니다.");
				return true;
			}  
		})//submit function()
		
	});//ready()
	
	
</script>
</body>
</html>