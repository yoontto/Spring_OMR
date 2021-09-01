<%@page import="com.hanul.omr.omrDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	omrDTO dto = (omrDTO) request.getAttribute("dto");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
@import url("css/omrPage.css");
</style>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="js/omrPage.js"></script>
</head>
<body oncontextmenu="return false">
	<form action="sos.do" method="get" id="main_form">
		<input type="hidden" name="numb" value="${dto.numb }">
		<input type="hidden" name="name" value="${dto.name }">
		<div>
			<h3 id="subject" style="margin-left: 800px;">
				과목 : ${dto.subject }</h3>
		</div>
		<br>
		<table id="table">
			<tr>
				<td style="font-weight: bold">1. 입출력 조작의 시간과 중앙처리장치의 처리시간과의
					불균형을 보완하는 것은?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num1" id="num1-1" value="1" class="anwser" /><label for="num1-1">1. 채널장치</label><br />
				<input type="radio" name="num1" id="num1-2" value="2" class="anwser" /><label for="num1-2">2. 제어장치</label><br />
				<input type="radio" name="num1" id="num1-3" value="3" class="anwser" /><label for="num1-3">3. 터미널장치</label><br />
				<input type="radio" name="num1" id="num1-4" value="4" class="anwser" /><label for="num1-4">4. 콘솔장치</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">2. 명령어 형식(instruction format)에서 첫
					번째 바이트에 기억되는 것은?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num2" id="num2-1" value="1" class="anwser" /><label for="num2-1">1. operand</label><br />
					<input type="radio" name="num2" id="num2-2" value="2" class="anwser" /><label for="num2-2">2. length</label><br />
					<input type="radio" name="num2" id="num2-3" value="3" class="anwser" /><label for="num2-3">3. question mark</label><br />
					<input type="radio" name="num2" id="num2-4" value="4" class="anwser" /><label for="num2-4">4. opcode</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">3. 반가산기(Half-Adder)의 논리회로도에서
					자리올림이 발생하는 회로는?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num3" id="num3-1" value="1" class="anwser" /><label for="num3-1">1. OR</label><br />
				<input type="radio" name="num3" id="num3-2" value="2" class="anwser" /><label for="num3-2">2. NOT</label><br />
				<input type="radio" name="num3"	id="num3-3" value="3" class="anwser" /><label for="num3-3">3. ExclusiveOR</label><br />
				<input type="radio" name="num3" id="num3-4" value="4" class="anwser" /><label for="num3-4">4. AND</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">4. 기억 장치 고유의 번지로서 0, 1, 2, 3,
					...과 같이 16진수로 약속하여 순서대로 정해 놓은 번지는?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num4" id="num4-1" value="1" class="anwser" /><label for="num4-1">1. 절대번지</label><br />
				<input type="radio" name="num4" id="num4-2" value="2" class="anwser" /><label for="num4-2">2. 상대번지</label><br />
				<input type="radio" name="num4"	id="num4-3" value="3" class="anwser" /><label for="num4-3">3. 필수번지</label><br />
				<input type="radio" name="num4" id="num4-4" value="4" class="anwser" /><label for="num4-4">4. 선택번지</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">5. 2진수의 1011의 1의 보수는?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num5" id="num5-1" value="1" class="anwser" /><label for="num5-1">1. 0100</label><br />
				<input type="radio" name="num5" id="num5-2" value="2" class="anwser" /><label for="num5-2">2. 1000</label><br />
				<input type="radio" name="num5"	id="num5-3" value="3" class="anwser" /><label for="num5-3">3. 0010</label><br />
				<input type="radio" name="num5" id="num5-4" value="4" class="anwser" /><label for="num5-4">4. 1010</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">6. 1개의 입력선으로 들어오는 정보를 2n개의 출력선 중
					1개를 선택하여 출력하는 회로는?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num6" id="num6-1" value="1" class="anwser" /><label for="num6-1">1. 멀티플렉서</label><br />
				<input type="radio" name="num6" id="num6-2" value="2" class="anwser" /><label for="num6-2">2. 인코더</label><br />
				<input type="radio" name="num6" id="num6-3" value="3" class="anwser" /><label for="num6-3">3. 디코더</label><br />
				<input type="radio" name="num6"	id="num6-4" value="4" class="anwser" /><label for="num6-4">4. 디멀티플렉서</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">7. 불(Boolean) 대수의 정리 중 틀린 것은?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num7" id="num7-1" value="1" class="anwser"/><label for="num7-1">1. 1+A=A</label><br />
					<input type="radio" name="num7" id="num7-2" value="2" class="anwser" /><label for="num7-2">2. 1·A=A</label><br />
					<input type="radio" name="num7" id="num7-3" value="3" class="anwser" /><label for="num7-3">3. 0+A=A</label><br />
					<input type="radio" name="num7" id="num7-4" value="4" class="anwser" /><label for="num7-4">4. 0·A=0</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">8. 데이터 전송 명령어의 기능이 아닌 것은?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num8" id="num8-1" value="1" class="anwser" /><label for="num8-1">1. 상수값을 레지스터 또는 주기억장치로 전송</label><br />
				<input type="radio" name="num8" id="num8-2"	value="2" class="anwser" /><label for="num8-2">2. 스택에 저장된 값을 레지스터로 전송</label><br />
				<input type="radio" name="num8" id="num8-3" value="3" class="anwser" /><label for="num8-3">3. 레지스터에 저장된 값을 스택으로 전송</label><br />
				<input type="radio" name="num8" id="num8-4" value="4" class="anwser" /><label for="num8-4">4. 레지스터에 저장된 값을 연산</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">9. 다음 주소지정 방법 중 처리속도가 가장 빠른 것은?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num9" id="num9-1" value="1" class="anwser" /><label for="num9-1">1. direct address</label><br />
				<input type="radio" name="num9" id="num9-2" value="2" class="anwser" /><label for="num9-2">2. indirect address</label><br />
				<input type="radio" name="num9"	id="num9-3" value="3" class="anwser" /><label for="num9-3">3. calculated address</label><br />
				<input type="radio" name="num9"	id="num9-4" value="4" class="anwser" /><label for="num9-4">4. immediate address</label></td>
			</tr>
			<tr>
				<td><br></td>
			</tr>
			<tr>
				<td style="font-weight: bold">10. ASCII 코드에 대한 설명으로 잘못된 것은?</td>
			</tr>
			<tr>
				<td><input type="radio" name="num10" id="num10-1" value="1" class="anwser" /><label for="num10-1">1. 개의 Zone비트를 가지고 있다.</label><br />
				<input type="radio" name="num10" id="num10-2" value="2" class="anwser" /><label for="num10-2">2. 16비트 코드로 미국 표준협회에서 개발하였다.</label><br />
				<input type="radio" name="num10" id="num10-3" value="3" class="anwser" /><label for="num10-3">3. 통신 제어용으로 사용한다.</label><br />
				<input type="radio" name="num10" id="num10-4" value="4" class="anwser" /><label for="num10-4">4. 128가지의 문자를 표현한다.</label></td>
			</tr>
			<tr>
				<td style="width: 1500px;"><input type="submit" value="제출하기" id="submit" />
				 <input type="reset" value="초기화하기" id="reset" /></td>
			</tr>
		</table>
	</form>
	<div id="answer"
		style="position: fixed; right: 50px; top: 150px; font-family: 'Jua', sans-serif;">
		<div id="user" style="color: #5D5D5D;">
			<div id="usernum">
				수험번호 :
				${dto.numb }
			</div>
			<div id="username">
				이&nbsp;&nbsp;&nbsp;&nbsp;름 :
				${dto.name }
			</div>
		</div>
		<br>
		<div id="omr_wrap">
			<div id="omr_answer1">
				01. <label for="num1-1">①</label> <label for="num1-2">②</label> <label
					for="num1-3">③</label> <label for="num1-4">④</label>
			</div>
			<div id="omr_answer2">
				02. <label for="num2-1">①</label> <label for="num2-2">②</label> <label
					for="num2-3">③</label> <label for="num2-4">④</label>
			</div>
			<div id="omr_answer3">
				03. <label for="num3-1">①</label> <label for="num3-2">②</label> <label
					for="num3-3">③</label> <label for="num3-4">④</label>
			</div>
			<div id="omr_answer4">
				04. <label for="num4-1">①</label> <label for="num4-2">②</label> <label
					for="num4-3">③</label> <label for="num4-4">④</label>
			</div>
			<div id="omr_answer5">
				05. <label for="num5-1">①</label> <label for="num5-2">②</label> <label
					for="num5-3">③</label> <label for="num5-4">④</label>
			</div>
			<div id="omr_answer6">
				06. <label for="num6-1">①</label> <label for="num6-2">②</label> <label
					for="num6-3">③</label> <label for="num6-4">④</label>
			</div>
			<div id="omr_answer7">
				07. <label for="num7-1">①</label> <label for="num7-2">②</label> <label
					for="num7-3">③</label> <label for="num7-4">④</label>
			</div>
			<div id="omr_answer8">
				08. <label for="num8-1">①</label> <label for="num8-2">②</label> <label
					for="num8-3">③</label> <label for="num8-4">④</label>
			</div>
			<div id="omr_answer9">
				09. <label for="num9-1">①</label> <label for="num9-2">②</label> <label
					for="num9-3">③</label> <label for="num9-4">④</label>
			</div>
			<div id="omr_answer10">
				10. <label for="num10-1">①</label> <label for="num10-2">②</label> <label
					for="num10-3">③</label> <label for="num10-4">④</label>
			</div>
		</div>
		<div>
			<div>
				<img src="./img/clock.png"
					style="width: 40px; height: 40px; margin-top: 10px; float: left; border-radius: 10px;">
			</div>
			<div id="time"
				style="font-size: 30px; float: right; margin-top: 10px; color: #B70000;"></div>
		</div>
	</div>
	<div>
			<input type="button" value="시험 시작" id="startBtn" onclick="fnStart()">
	</div>
</body>
</html>