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
	#profBox{
	
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
	#proofFile{
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
	.warning {
	color: gray;
	text-align: center;
}
	label{
	background-color: orange;
	width:100%;
	height:50px;
	text-align:center;
	color:white;
	border-radius:10px;
	line-height:50px;
	}
</style>	
</head>
<body>
	<div class="container">
		<div id="title">
	   		<div id="titlefont">학교 인증</div>
	 	</div>
		
			<div id="profBox">
				<div class="badge badge-warning">1번째</div>
				<div>소속기관과 전공분야를 확인하기<br/>
				위해서 아래 서류 중 1개를 사진으로<br/>
				찍어서 올려주세요.<br/></div>
				<div class="warning">
				<i class="fas fa-exclamation-circle"></i>사진첨부는 최대 5장까지 가능합니다.
				</div>
				
				<label for="proofFile">
					<i class="fas fa-upload"></i>사진 추가하기
					<input type="file" id="proofFile" accept="image/*,application/pdf">
				</label>
				
				
			</div>	
			<div class="badge badge-warning">2번째</div>
			<div>등(초)본에 적혀있는 현주소를
			아래 입력칸에 똑같이 적어주세요.</div>
			<input type="text" placeholder="여기에 똑같이 적어주세요" />
			
			<div class="warning">
				<i class="fas fa-exclamation-circle"></i>
				올리신 등(초)본 현주소와 적어주신 내용이<br/>
				일치되어야 인증처리가 완료됩니다.<br/>
			</div>
			
			<div class="badge badge-warning">3번째</div>
			<div>등(초)본 우측 상단에 적혀있는<br/>
				발급일자를 아래 입력칸에<br/>
				똑같이 입력해주세요.</div>
			<input type="text" placeholder="여기에 똑같이 적어주세요" />
			
			
			
				<input type="submit" class="btn btn-warning" value="저장" />
			</div>
		

</body>
</html>