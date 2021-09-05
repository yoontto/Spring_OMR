<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% String subjectName = (String) request.getAttribute(subjectName);%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시험 페이지</title>
<style type="text/css">
	@import url(css/general.css);
	body{
		font-size: 1.4rem;
		font-weight: bold;
	}
</style>
</head>
<body>
<div class="container_test">
	<form action="result" method="get">
	<input type="hidden">
		<h3 class="title_test"> 
			${ subjectName eq 'bread' ? '빵' : '' }
      		${ subjectName eq 'fruit' ? '과일' : '' }
      		${ subjectName eq 'icecream' ? '아이스크림' : '' }
		    ${ subjectName eq 'snack' ? '과자' : '' }
		</h3>
		<!-- 시험 종료 타이머 -->
		<span id="timer" class="timer_test"></span>
		<input type="hidden" value="${subjectName }" name="subjectName">
		<c:set var="problem_num" value="0" />
		<div class="align_right">
			<input type="button" class="btn_2" value="시험문제 추가" onclick="location.href='test.add?subjectName=${subjectName}'"/>
		</div>
		
		<div>
			<c:forEach var="list" items="${listQuestion}">
				<c:set var="problem_num" value="${problem_num + 1}"/>
				<div class="item_test">
					<div class="inner_item_test">
						<div class="align_right_test">
							<input type="button" class="btn_2" value="문제 수정" onclick="location.href='search?test_num=${list.test_num}&test_name=${subjectName}'">
							<input type="button" class="btn_2" value="문제 삭제" onclick="fnDelete('${list.test_num }')" >
						</div>
						<div class="align_left_test">${problem_num}.
							${list.test_problem }
						</div>
						<!-- foreach 바꿀수 있지 않을까요? -->
						<div class="align_left_test">
							<input type="radio" value="1" class="radio_hidden_test" id="${list.test_num}_1" name="q${problem_num}" />
							<label for="${list.test_num}_1" class="label_test">1. ${list.test_choice1 }</label><br/>
							<input type="radio" value="2" class="radio_hidden_test" id="${list.test_num}_2" name="q${problem_num}" />
							<label for="${list.test_num}_2" class="label_test">2. ${list.test_choice2 }</label><br/>
							<input type="radio" value="3" class="radio_hidden_test" id="${list.test_num}_3" name="q${problem_num}" />
							<label for="${list.test_num}_3" class="label_test">3. ${list.test_choice3 }</label><br/>
							<input type="radio" value="4" class="radio_hidden_test" id="${list.test_num}_4" name="q${problem_num}" />
							<label for="${list.test_num}_4" class="label_test">4. ${list.test_choice4 }</label>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
			<input type="hidden" value="${problem_num}" name = "problem_num"/>
			<input type="hidden" value="${test_num}" name = "test_num"/>
			
		<div class="btn_3_margin_test">
			<input type="submit" class="btn_3_test" value="답안제출" />
			
		</div>
	</form>
</div>
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