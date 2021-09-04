<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TeamA OMR</title>
<link rel="icon" type="images/x-icon" href="imgs/hanul.ico">
<link rel="stylesheet" type="text/css" href="css/common.css?v="<%=new java.util.Date().getTime() %>>
<!-- v?= 시간 넣는 이유 : href 한번만 넣어서 동기화가 안되니까 버전을 줘서 새로고침이 되게 만들어서 적용시킴 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/js/all.min.js"></script>
</head>
<body>
	<tiles:insertAttribute name="header"/>
	<div id="content" >
		<tiles:insertAttribute name="content"/>
	</div>
	<tiles:insertAttribute name="footer"/>
</body>
</html>