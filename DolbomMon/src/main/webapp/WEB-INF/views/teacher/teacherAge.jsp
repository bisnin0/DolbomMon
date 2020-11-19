<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet"
	href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
	integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<style>
.container {
	width: 800px;
	text-align:center;
}

#title {
	margin: 20px 5px;
	display: block;
	width: 100%;
}

#titlefont {
	font-size: 25px;
	font-weight: 700;
	vertical-align: bottom;
	text-align: center;
}

#ageWarning {
	color: gray;
	text-align: center;
}

#ageHidden {
	overflow: hidden;
	height: 0px;
}

#shinsaenga, #yua, #younga, #chodeung {
	font-size: 40px;
	float: right;
	color: white;
}

input[type=submit] {
	position: relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top: 30px;
}
label{
width:24%;
}
img{
cursor:pointer;
border-radius:5px;
}
</style>
<script>
$(function(){
	
	$("input:radio[name=tAge]").click(function(){
		if($("input:radio[name=tAge]:checked").val()== "1"){
			$("input:radio[name=tAge]").parent().css("background-color","orange");
		}
		
		if( $(this).css("background-color") =="rgb(255, 255, 255)" ){
		$(this).css("background", "orange");
		}else{
			
			$(this).css("background", "white");
		}
		
	});
	
});

</script>
</head>
<body>

	<div class="container">
		<div id="title">
			<div id="titlefont">돌봄 가능 연령</div>
		</div>
		<div class="m-2" id="ageWarning">
			<b>돌봄 가능 연령</b><br /> 현재 놀이/학습 돌봄유형이므로 영아/유아/초등 중 1개 아이 연령은 필수로 선택되어야
			합니다<br />
		</div>


			<div id="ageHidden">
				
				<input type="radio" name="tAge" id="younga" />
				<input type="radio" name="tAge" id="yua" />
				<input type="radio" name="tAge" id="chodeung" />
			</div>

			<label for="shinsaenga"><input type="radio" name="tAge" id="shinsaenga" /><img src="icon/sitter-profile-age-new-off.svg" alt="신생아" /><br />신생아</label>
			<label for="younga"><img src="icon/sitter-profile-age-young-off.svg" alt="영아" /><br />영아</label>
			<label for="yua"><img src="icon/sitter-profile-age-child-off.svg" alt="유아" /><br />유아</label>
			<label for="chodeung"><img src="icon/sitter-profile-age-element-off.svg" alt="초등학생" /><br />초등학생</label>




			<input type="submit" class="btn btn-warning" value="저장" />
		</div>
</body>
</html>

