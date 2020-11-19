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
	/* ================== 초기화 ==================*/
	*{margin:0; padding:0; text-decoration:none; list-style:none;}
	.container{width:600px; padding:0px;}
	/* ================== 초기화 ==================*/
	
	/* ================== 돌볼 수 있는 아이의 나이 ================== */
	#childrenAgeHeader{width:100%; overflow:hidden; height:auto; margin-top:40px; text-align:center; font-size:2em;}
	#childrenAgeDiv{width:100%; overflow:hidden; height:auto; margin-top:30px; }	
	#childrenAgeDiv input[type=checkbox]{display:none;}
	#childrenAgeDiv label{width:130px; height:80px; margin:10px; float:left; line-height:80px; text-align:center;}
	/* ================== 돌볼 수 있는 아이의 나이 ================== */
	
	/* ================== 가능한 돌봄유형 ====================*/
	#careTypeHeader{width:100%; overflow:hidden; height:auto; margin-top:30px; text-align:center; font-size:2em;}
	#careTypeDiv{width:100%; overflow:hidden; height:auto; margin-top:30px;}
	#careTypeDiv input[type=checkbox]{display:none;}
	#careTypeDiv label{width:130px; height:80px; margin:10px; float:left; line-height:80px; text-align:center;}
	#careTypeDiv label:nth-of-type(12){clear:left;}
	/* ================== 가능한 돌봄유형 ====================*/
	label{margin:0; border:1px solid black; background-color:#EFEFEF; color:black;}
	/* ============= */
	form{text-align:center;}
	input[type=submit]{width:80%; height:40px; margin-top:15px;}
</style>
<script>
	
	$(function(){
		$("label").click(function(){
			var dd = $(this).css("color");
			console.log(dd);
			if(dd=="rgb(0, 0, 0)"){
				$(this).css("background-color", "green").css("color", "navy");
			}else {
				$(this).css("background-color", "#EFEFEF").css("color","black");				
			}
			
		});
	});
</script>
<body>
	<div class="container">
		<form action="<%=request.getContextPath()%>/dbm/location">
			<div id="childrenAgeHeader">어떤 아이를 돌볼 수 있나요?</div>
			<div id="childrenAgeDiv">
				<input type="checkbox" id="age1" value="신생아" name="child_age" />
				<input type="checkbox" id="age2" value="영아" name="child_age" />
				<input type="checkbox" id="age3" value="유아" name="child_age" />
				<input type="checkbox" id="age4" value="초등학생" name="child_age" />
				<label for="age1">신생아</label>
				<label for="age2">영아</label>
				<label for="age3">유아</label>
				<label for="age4">초등학생</label>
			</div>
			<div id="careTypeHeader">어떤 활동을 할 수 있나요?</div>
			<div id="careTypeDiv">
				<input type="checkbox" id="1" value="실내놀이" name="care_type" />
				<input type="checkbox" id="2" value="등하원돕기" name="care_type" />
				<input type="checkbox" id="3" value="책읽기" name="care_type" />
				<input type="checkbox" id="4" value="야외활동" name="care_type" />
				<input type="checkbox" id="5" value="한글놀이" name="care_type" />
				<input type="checkbox" id="6" value="영어놀이" name="care_type" />
				<input type="checkbox" id="7" value="학습지도" name="care_type" />
				<input type="checkbox" id="8" value="체육놀이" name="care_type" />
				<input type="checkbox" id="9" value="간단청소" name="care_type" />
				<input type="checkbox" id="10" value="밥챙겨주기" name="care_type" />
				<input type="checkbox" id="11" value="간단설거지" name="care_type" />
				<input type="checkbox" id="12" value="장기입주" name="care_type" />
				<input type="checkbox" id="13" value="단기입주" name="care_type" />
				<label for="1">실내놀이</label>
				<label for="2">등하원 돕기</label>
				<label for="3">책읽기</label>
				<label for="4">야외활동</label>
				<label for="5">한글놀이</label>
				<label for="6">영어놀이</label>
				<label for="7">학습지도</label>
				<label for="8">체육놀이</label>
				<label for="9">간단청소</label>
				<label for="10">밥챙겨주기</label>
				<label for="11">간단설거지</label>
				<label for="12">장기입주</label>
				<label for="13">단기입주</label>
			</div>
			<input type="submit" value="다음" />
		</form>
	</div>
</body>
</html>