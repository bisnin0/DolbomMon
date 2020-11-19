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
<script>
	$(function(){
		$("a").hover(function(){
			  $(this).css("text-decoration", "none").css("color", "black");
			  }, function(){
			  $(this).css("text-decoration", "none").css("color", "black");
			});
		
	});
</script>
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
	#pwdchg, #lgt {
	background-color:white;
	text-decoration:none;
	color:black;
	border:none;
	border-color:white;
	outline:none;
	display: inline-block;
	}
	#dividebar{
	margin: 0px 5px; 
	}
	a{
	text-decoration: none; cursor:pointer;
	color:black;
	}
	i{ color: orange;}
	
	.rightlog>i, .rightlog>a, .rightlog>div {
	float:right;
	
	}
	

</style>
</head>
<body>

<div class="container" >
   <div id="title">
   		<div id="titlefont">마이페이지</div>
   		<div class="rightlog">   
			   <a id="lgt">로그아웃</a>
			   <div id="dividebar">|</div>
			   <a id="pwdchg">비밀번호 변경</a>
			   <i class="fas fa-pen"></i>
	   </div>
	</div>   
 <br/>
 
   <ul class="list-group list-group-flush">
   		<li class="list-group-item list-group-item-action"><a href="teacherApplyHistory"><i class="fas fa-clipboard mx-2"></i> 내 구직현황</a><i class="fas fa-angle-right float-right mt-1 mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherHeart"><i class="fas fa-heart mx-2"></i> 찜한 일자리</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherView"><i class="fas fa-user-circle mx-2"></i> 내 프로필 보기</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherEdit"><i class="fas fa-user-edit mx-2"></i> 내 프로필 수정</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="teacherProof"><i class="fas fa-check-circle mx-2"></i> 인증 관리</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="#"><i class="fas fa-chalkboard-teacher mx-2"></i> 활동내역</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   		<li class="list-group-item list-group-item-action"><a href="#"><i class="fas fa-exclamation-triangle mx-2"></i> 신고내역</a><i class="fas fa-angle-right float-right mt-1  mx-2"></i></li>
   </ul>
   <br/>
   <ul class="list-group">
   		<li class="list-group-item list-group-item-action"><a href="#">결제내역</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">공지사항</a></li>
   		<li class="list-group-item list-group-item-action"><a href="#">계정관리</a></li>
   </ul>
</div>

</body>
</html>

