<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
</head>
<style>
	*{margin:0; padding:0;}
	.container{width:600px; padding:0px;}
	/* ================== 상단 =====================*/
	#top{width:100%; overflow:hidden; height:auto; text-align:center; font-size:3em;}
	/* ================== 상단 =====================*/
	/* ==================== 라디오 버튼 ====================== */
	#dbmTypeDiv input[type=radio]{display:none;}
	.d1{width:100%; overflow:hidden; height:150px; margin-top:10px;}
	.d2{width:450px; height:150px; float:right; padding:20px;}
	
	#dbmTypeDiv input[type=submit]{width:100%; hieght:40px; margin-top:20px;}
	/* ==================== 라디오 버튼 ====================== */
</style>
<script>
	$(function(){
		$("label").click(function(){
		});
	});
	
</script>
<body>
	<div class="container">
		<div id="top">
			당신은 어떤분 인가요?
		</div>
		<div id="dbmTypeDiv">
			<form action="<%=request.getContextPath()%>/dbm/activityAndAge">
				<input type="radio" name="dbmType" id="t" value="선생님" />
				<input type="radio" name="dbmType" id="m" value="엄마" />
				<input type="radio" name="dbmType" id="d" value="대학생" />
				<input type="radio" name="dbmType" id="n" value="일반" />
				<div class="d1"><label for="t"><img src=http://placehold.it/150x150/></label><div class="d2">선생님</div></div>
				<div class="d1"><label for="m"><img src=http://placehold.it/150x150/></label><div class="d2">학부모</div></div>
				<div class="d1"><label for="d"><img src=http://placehold.it/150x150/></label><div class="d2">대학생</div></div>
				<div class="d1"><label for="n"><img src=http://placehold.it/150x150/></label><div class="d2">일반</div></div>
				<input type="submit" value="다음" />
			</form>
		</div>
	</div>
</body>
</html>