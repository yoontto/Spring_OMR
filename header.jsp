<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<header style="border-bottom: 1px solid #000000; padding: 15px 0; text-align: left;">
		<div class="category" style="margin-left: 100px">
			<ul>
			<!-- 한울 로고 이미지 삽입 예정 -->
				<li><a href='<c:url value="/" />'><img alt="x" src="imgs/hanul.logo.png"></a></li>
				<%-- <li><a class="${category eq 'cu' ? 'active' : ''}"></a></li> --%>
				<li><a class="${category eq 'cu' ? 'active' : ''}" href='list.cu'>고객관리</a></li>
				<li><a class="${category eq 'hr' ? 'active' : ''}" href='list.hr'>사원관리</a></li>
				<li><a class="${category eq 'no' ? 'active' : ''}" href='list.no'>공지사항</a></li>
				<li><a class="${category eq 'bo' ? 'active' : ''}" href='list.bo'>방명록</a></li>
				<li><a class="${category eq 'da' ? 'active' : ''}" href='list.da'>공공데이터</a></li>
			</ul>		
		</div>
		<div style="position: absolute; right: 0; top: 25px; margin-left: 100px">
			<ul>
				<!-- 로그인 된 경우와 안된 경우의 기능 추가 (?소셜 로그인) -->
				<c:if test="${empty loginInfo}">
					<li><a class="btn-fill" href="login">로그인</a></li>
					<li><a class="btn-fill" href="member">회원가입</a></li>
				</c:if>
				<c:if test="${!empty loginInfo}">
					<li><a class="btn-fill">${loginInfo.name } 님</a></li>
					<li><a class="btn-fill" href="logout">로그아웃</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<style>
		header ul, header ul li{
			margin: 0px; padding: 0px; display: inline;
		}
		.category{
			font-size: 16px;
		}
		.category li:not(first-child){
			padding-left: 30px;
		}
		.category li a:hover, .category li a:active{
			font-weight: bold;
			color: #0000cd;
		}
		
	</style>
	
