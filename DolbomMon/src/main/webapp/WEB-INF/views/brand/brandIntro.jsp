<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<style>
	body,li{margin:0; padding:0; text-align:center;}
	.img1{
		width:90%;
		height:480px;
	}
	#upper{
		text-align:center;
		color:black;
		
	}
	
	
</style>
</head>
<jsp:include page="../top.jsp"/>
<body>

<div id="upper">
	<img src="img/1212.PNG" class="img1"/>
	<br/><br/>
	<h1 class="brand">사업소개</h1>
	<h5>Services</h5>
	<br/><br/>
	<h2 style="color:gray">놀이부터 배움까지 선생님 매칭 웹</h2>
	<h2 style="font-weight:bold;">아이돌봄 웹 서비스</h2><br/><br/><br/>
	<img src="img/pic2.png"/>
	
</div>
</body>
</html>