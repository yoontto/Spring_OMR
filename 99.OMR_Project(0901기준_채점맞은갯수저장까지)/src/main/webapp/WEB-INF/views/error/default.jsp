<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="error">
	<div class="left" style="height: 80%">
		<a href='<c:url value="/" />' ><img alt="x" src="imgs/hanul.logo.png"/></a>
	</div>
	<div class="left">
		${msg}
		<h3>내부적인 오류가 발생했습니다.</h3>
		<p>빠른 시일내에 복구시키겠습니다.</p>
		<p>관련 문의사항은 개발자 또는 고객센터로 문의바랍니다.</p>
		<!-- msg에는 String형식으로 메시지가 담겨서 출력됨 -->
	</div>
</div>