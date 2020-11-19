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
	img { width: 50px; height:50px;}
	
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
	.nav-item>a {
	color:black;
	}
	.fa-check-circle, .fa-times-circle{
		font-size: 50px;
		margin: 10px;
		color:orange;
	}
</style>
</head>
<body>
<div class="container">
	<div id="title">
   		<div id="titlefont">내 구직현황</div>
	</div>
	<nav>
		<ul class="nav nav-tabs justify-content-center">
			<li class="nav-item">
				<a class="nav-link active px-5" id="nav-apply-tab" href="#nav-apply" data-toggle="tab" role="tab">
			내가 지원한</a>
			</li>
			<li class="nav-item">
				<a class="nav-link px-5" id="nav-inbox-tab" href="#nav-inbox" data-toggle="tab" role="tab">
				내게 신청한</a>
			</li>
		</ul>
	</nav>
	<div class="tab-content" id="nav-tabContent">
		<div class="tab-pane fade show active" id="nav-apply" role="tabpanel">
			<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<div class="row">
						<div class="col-1">
								<img src="img/profilepic.png" class="rounded-circle"/>
							</div>	
						<div class="col-11">
								<b>김O욱 부모</b><i class="fas fa-search ml-1"></i><br/>
								희망시급: 10,000원<br/>
								신청시간: 2018.09.26 16:59<br/>
								<i class="far fa-check-circle"></i>
								<i class="fas fa-times-circle"></i><br/>
								부모님이 내 지원을 거절하였습니다.<br/>
						</div>	
					</div>
				</li>
				<li class="list-group-item">
					<div class="row">
						<div class="col-1">
								<img src="img/profilepic.png" class="rounded-circle"/>
							</div>	
						<div class="col-11">
								<b>김O욱 부모</b><i class="fas fa-search ml-1"></i><br/>
								희망시급: 10,000원<br/>
								신청시간: 2018.09.26 16:59<br/>
								<i class="fas fa-check-circle"></i>
								<i class="far fa-times-circle"></i><br/>
								부모님이 내 지원을 수락하였습니다.<br/>
						</div>	
					</div>
				</li>
			</ul>
		</div>
		<div class="tab-pane fade" id="nav-inbox" role="tabpanel">
		<ul class="list-group list-group-flush">
				<li class="list-group-item">
					<div class="row">
						<div class="col-1">
								<img src="img/profilepic.png" class="rounded-circle"/>
							</div>	
						<div class="col-11">
								<b>김O욱 부모</b><i class="fas fa-search ml-1"></i><br/>
								희망시급: 10,000원<br/>
								신청시간: 2018.09.26 16:59<br/>
								<i class="far fa-check-circle"></i>
								<i class="far fa-times-circle"></i><br/>
								부모님에게 응답하지 않았습니다.<br/>
						</div>	
					</div>
				</li>
				
				<li class="list-group-item">
					<div class="row">
						<div class="col-1">
								<img src="img/profilepic.png" class="rounded-circle"/>
							</div>	
						<div class="col-11">
								<b>김O욱 부모</b><i class="fas fa-search ml-1"></i><br/>
								희망시급: 10,000원<br/>
								신청시간: 2018.09.26 16:59<br/>
								<b>-거절완료-</b><br/>
								부모님에게 내 거절의사를 전달하였습니다.<br/>
						</div>	
					</div>
				</li>
				
			</ul>
		
		
		
		</div>
	</div>
</div>
</body>
</html>