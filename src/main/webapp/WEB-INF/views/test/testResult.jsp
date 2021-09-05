<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	@import url(css/general.css);
</style>
<body> 
	<div class="container_result">
		<div class="inner_container_result">
		<h1 class="title_result">시험 결과</h1>
		<div class="item_result">
			<div>
				<div>
					<form action="insertResult" method="post">
						<input type="hidden" value="${subjectName}" name="candidate_test_name">
						<input type="hidden" value="${o}" name="candidate_get_right">
						<input type="hidden" value="1" name="candidate_num">
						<table border="1" style="width: 80%;">
							<tr>
								<th class=th_result>응시과목</th>
								<c:if test="${subjectName eq 'icecream' }">
									<th colspan="10" class=th_result>아이스크림</th>
								</c:if>
								<c:if test="${subjectName eq 'snack' }">
									<th colspan="10" class=th_result>과자</th>
								</c:if>
								<c:if test="${subjectName eq 'bread' }">
									<th colspan="10" class=th_result>빵</th>
								</c:if>
								<c:if test="${subjectName eq 'fruit' }">
									<th colspan="10" class=th_result>과일</th>
								</c:if>
							</tr>
							<tr>
								<th class=th_result>문제</th>
								<c:forEach items="${list}" var="vo">
									<c:if test="${vo.test_num < 10 }">
										<td>0${vo.test_num}</td>
									</c:if>
									<c:if test="${vo.test_num >= 10 }">
										<td>${vo.test_num}</td>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<th class=th_result>정답</th>
								<c:forEach items="${list}" var="vo">
									<td>${vo.test_answer}</td>
								</c:forEach>
							</tr>
							<tr>
								<th class=th_result>내 정답</th>
								<c:forEach items="${answer_arr}" var="i">
									<td>
											${i}
									</td> 
								</c:forEach> 
							</tr>
							<%-- 
							<tr>
								<th>결과</th>
								<c:forEach items="${answer_result}" var="j">
									<c:if test="${j eq 'O' }">
										<td>
											<p style="color: blue;">${j}</p>
										</td> 
									</c:if>
									<c:if test="${j eq 'X' }">
										<td>
											<p style="color: red;">${j}</p>
										</td> 
									</c:if>
								</c:forEach> 
							</tr>
							--%>
							<tr align="center">
								<th class=th_result>점수</th>
								<td colspan="10">${Math.round(score * (100/fn:length(list))*100 )/100 }</td>
							</tr>
							<tr align="center">
								<th class=th_result>과목평균</th>
								<td colspan="10">${Math.round(avgScore * (100/fn:length(list))*100 )/100 }</td>
							</tr>
						</table>
					</form>
				
					<%-- 
					<table>
						<tr>
							<th>문제 갯수 출력</th> 
							<td>${fn:length(list)} 개</td>
						</tr>
						<tr>
							<th>해당 과목의 평균 맞춘 갯수 출력</th> 
							<td>${Math.round(avgScore)} 개</td>
						</tr>
						<tr>
							<th>수험자의 맞춘 갯수 출력</th> 
							<td>${score} 개</td>
						</tr>
					</table>
					--%>
				</div>
			</div>
		</div>
		<input type="button" class="btn_2_result" value="메인으로 돌아가기" onclick="location.href='/omr'">
		</div>
	</div>
	
</body>
</html>