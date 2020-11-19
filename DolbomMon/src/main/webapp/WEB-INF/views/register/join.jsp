<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	*{margin:0; padding:0;}
	.container{width:600px;}
	.container>div{width:100%; height:300px; margin-top:80px; overflow:hidden;}
	
	
</style>
</head>
<body>
	<div class="container" >
		<div>
			<a href="<%=request.getContextPath()%>/parent/activityAndAge">
				<img src="<%=request.getContextPath()%>/img/mom.png"/>
			</a>
		</div>
		<div>
			<a href="<%=request.getContextPath()%>/dbm/dbmType">
				<img src="<%=request.getContextPath()%>/img/dbm.png"/>
			</a>
		</div>
	</div>
</body>
</html>