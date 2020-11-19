<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
	.container{width:800px;}
	
	#title{
		margin:20px 5px;
		display:block;
	width:100%;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	#teacherIntroBox{
	border-color: orange;
	
	}
	
	input[type=submit]{
	position:relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top:30px;
	}
	#introWarning{
		color:gray;
		text-align:center;
	}
</style>	
</head>
<body>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">자기 소개 수정</div>
	 	</div>
		<form method="get" action="">
			<div class="form-group">
				<textarea class="form-control" id="teacherIntroBox" rows="10" placeholder="자기소개 작성 시  부모님에게 2배 더 많은 신청을 받게 됩니다."></textarea>
				<div class="m-2" id="introWarning"><i class="fas fa-ban"></i>
				자기소개 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</div><br/>
				<input type="submit" class="btn btn-warning" value="저장" />
			</div>
		</form>
	</div>

</body>
</html>