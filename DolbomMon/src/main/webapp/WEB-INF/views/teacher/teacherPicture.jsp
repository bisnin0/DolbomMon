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
	#teacherWageBox{
	border-color: orange;
	display: flex;
	justify-content:center;
	width:200px;
	}
	.fa-coins{
	font-size: 50px;
	color:orange;
	display: flex;
	justify-content:center;
	
	}
	input[type="submit"]{
	display: flex;
	justify-content:center;
	
	}
	#picWarning{
		color:gray;
		text-align:center;
		margin:50px;
	}
	
	#profBox{
	position: relative;
	width: 120px;
	height: 120px;
	display:block;
	left: calc(50% - 60px);
	overflow:visible;
	margin-top: 50px;
	}
	#profIcon{
	width:120px;
	height:120px;
	position:absolute;
	}
	#profPlus{
	position: absolute;
	width:40px;
	height:40px;
	right:0;
	bottom:0;
	white-space:nowrap;
	vertical-align: middle;
	}
	#profFile{
	opacity:0%;
	position:absolute;
	top:0;
	left:0;
	bottom:0;
	right:0;
	width:100%;
	height:100%
	}
	#teacherPicRed{
	text-decoration: underline;
	color:red;
	font-weight:bold;
	}
	input[type=submit]{
	position:relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top:30px;
	}
	
</style>	
</head>
<body>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">내 사진 수정</div>
	 	</div>
		
			<div id="profBox">
				<img class="rounded-circle mx-auto d-block" id="profIcon" src="img/profilepic.png"/>
				<img id="profPlus" src="icon/profile-add-bt.svg"/>
				<input type="file" id="profFile" accept="image/*,video/*">
			</div>		
				<div id="picWarning">
				“내 사진을 올리면 부모회원의 선택을<br/> <span id="teacherPicRed">5배 더 많이</span> 받을 수 있습니다.”
				</div>
				<input type="submit" class="btn btn-warning" value="저장" />
			</div>
		

</body>
</html>