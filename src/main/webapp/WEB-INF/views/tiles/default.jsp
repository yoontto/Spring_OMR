<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <c:choose>
	<c:when test="${category eq 'login' }">
		<c:set var="title" value="login"></c:set>
	</c:when>
</c:choose> --%>
<title>IoT</title>
<link rel="icon" type="images/x-icon" href="imgs/hanul.ico">
<link rel="stylesheet" type="text/css" href="css/common.css?v="<%=new java.util.Date().getTime() %>>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="content">
		<tiles:insertAttribute name="content"/>
	</div>
</body>
</html>