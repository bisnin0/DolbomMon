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
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style>
.container{width:800px;}
i{color:gray;}

h5{
	padding: 20px 0px 0px 0px;
	font-weight: bold;
}
 .fa-check-circle{
 font-size:60px;
 margin: 8px;
}

#cctvLst>label{
width:45%;
height:150px;
border: 1px solid #ddd;
padding:50px 0;
margin:5px;
text-align:center;

}
#cctvWarning{
font-size: 0.8em;
color: gray;
text-align:center;
}
#cctvHidden{
overflow:hidden;
height:0px;
}
#cctvCheck1, #cctvCheck2{
font-size: 40px;
float:right;
color:white;
}
#profFrame{
	position: relative;
	width: 500px;
	height: 500px;
	display:block;
	left: calc(50% - 250px);
	overflow:visible;
	margin-top: 50px;
	}
	#profimg{
	position:absolute;
	width:500px;
	height:500px;	
	}
	.fa-pen{
	position: absolute;
	width:50px;
	height:50px;
	right:-10px;
	top:-10px;
	padding-top:17px;
	background-color:orange;
	color:white;
	border-radius:50%;
	text-align:center;
	z-index:100;
	}
	.editBtn{
	opacity:0%;
	position:absolute;
	top:0;
	left:0;
	bottom:0;
	right:0;
	width:100%;
	height:100%
	}
	.list-group-item{
	position:relative;
	padding: 20px;
	}

img{

width:50%;

}
</style>
<script>
	$(function(){
		$("#cctvLst>label").click(function(){
			$(this).css("background-color", "orange").css("font-weight", "bold");
			$(this).siblings().css("background-color", "white").css("font-weight", "normal");
	
		});
			
		
	});
</script>
</head>
<body>

<div class="container">
	<h5>내 사진</h5>

	   	<div id="profFrame">
				<img class="rounded mx-auto d-block" id="profimg" src="img/profilepic.png"/>
				<i class="fas fa-pen"><a class="editBtn" href="teacherPicture"></a></i>	
			</div>	
   

   	<h5>간단 자기소개</h5>
   	<li class="list-group-item" style="text-align:center">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherIntro"></a></i>
	   	아직 작성하지 않았습니다.
   	</li>
   	<h5>선호하는 돌봄유형</h5>
   	<li class="list-group-item" style="text-align:center">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherType"></a></i>
	   	"저는 <span>놀이/학습</span>돌봄을 가장 선호해요"
   	</li>
   	<h5>희망 시급</h5>
   	<li class="list-group-item" style="text-align:center">
   		<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
   		원하는 시급을 자유롭게 작성해주세요.
   	</li>
   	<h5>관련 경험</h5>
   	<li class="list-group-item" style="text-align:center">
   		<i class="fas fa-pen"><a class="editBtn" href="teacherExp"></a></i>
   		작성 시 부모로부터<br/>3배 더 많은 선택을 받게 됩니다!
   	</li>
   	<h5>활동 가능 시간</h5>
   	<li class="list-group-item">
	   	<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
	   	스케쥴차트</li>
   	<h5>돌봄 가능 연령</h5>
   	<li class="list-group-item">
   	 	<i class="fas fa-pen"><a class="editBtn" href="teacherAge"></a></i>
	   	<ul class="list-group list-group-horizontal-sm" >
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-new-off.svg" alt="신생아" /><br/>신생아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-young-off.svg" alt="영아" /><br/>영아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-child-off.svg" alt="유아" /><br/>유아</li>
		   	<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/sitter-profile-age-element-off.svg" alt="초등학생" /><br/>초등학생</li>
	   </ul>
   </li>
   <h5>가능한 활동</h5>
   <li class="list-group-item">
   	<i class="fas fa-pen"><a class="editBtn" href="teacherActivity"></a></i>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-indoorplay-off.svg" /><br/>실내놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-join-walk-off.svg"/><br/>등하원돕기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-read-off.svg" /><br/>책읽기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-outdooractivities-off.svg"/><br/>야외활동</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-korean-off.svg"/><br/>한글놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-english-off.svg"/><br/>영어놀이</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-study-off.svg"/><br/>학습지도</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-pe-off.svg"/><br/>체육놀이</li>
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-cleaning-off.svg"/><br/>간단 청소</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-cook-off.svg"/><br/>밥 챙겨주기</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-washing-off.svg"/><br/>간단 설거지</li>
   		
   		</ul>
   		<ul class="list-group list-group-horizontal-sm" >
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-longterm-off.svg"/><br/>장기입주</li>
   			<li class="list-group-item col-3" style="text-align:center; border:none;"><img src="icon/change-shortperiod-off.svg"/><br/>단기입주</li>

   		</ul>
   	</li>	
		<h5>활동 가능 지역</h5>
		
		<li class="list-group-item">
			<i class="fas fa-pen"><a class="editBtn" href="teacherWage"></a></i>
			<ul class="list-group" >
			<li class="list-group-item" style="border:none">
				<span class="badge badge-warning">1순위</span> 서울특별시 마포구 마포동
			</li>
			</ul>
		</li>
		
		<h5>CCTV동의 여부</h5>
		<li id="cctvLst" class="list-group-item" >
			<div id="cctvHidden">
				<input type="radio" name="options" id="cctvDisagree" />
			    <input type="radio" name="options" id="cctvAgree" />
		    </div>
		    <label for="cctvDisagree" class="rounded">   
		    CCTV촬영을<br/> 원치 않습니다.<br/>
		    	<i id="cctvCheck1" class="fas fa-check-circle"></i>
		    </label>
		    <label for="cctvAgree" class="rounded">
		    CCTV가 있어도<br/>당당히 일할 수 있습니다.<br/>
		    	<i id="cctvCheck2" class="fas fa-check-circle"></i>
			</label>
	
			<p id="cctvWarning">단, 녹화된 영상을 유출 배포하지 않는 전제</p>		
		
		</li>
   		
   <br/>
</div>



</body>
</html>

