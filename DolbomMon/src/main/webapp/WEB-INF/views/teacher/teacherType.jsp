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

.warning {
	color: gray;
	text-align: center;
}




input[type=submit] {
	position: relative;
	display: block;
	width: 80px;
	left: calc(50% - 40px);
	margin-top: 30px;
}
label{
width:100%;
border:1px orange solid;
border-radius:10px;
padding:20px;
}

input[type=radio]{
padding:10px;
float:left;
vertical-align:middle;
}

</style>
</head>
<body>

	<div class="container">
		<div id="title">
			<div id="titlefont">돌봄 유형선택</div>
		</div>
	
		선호하는 유형을 선택해주세요<br/>

		
			<label for="typeOne">
			<input type="radio" name="tType" id="typeOne" class="col-1"/>
			<b>신생아/영아 풀타임 돌봄</b><br/>
						- 0~24개월 아이를 먹이고, 재우고, 놀아주는 활동<br/>
						- 보통 주5일 하루 8~10시간 책임지고 돌봄 필요<br/>
						- 아이 관련 가사활동 필수<br/></label>
			<label for="typeTwo">
			<input type="radio" name="tType" id="typeTwo" class="col-1"/>
			<b>등하원 돌봄</b>
						- 2~10세 아이를 기관에 가기 전후에 돌보는 활동<br/>
						- 보통 주5일 하루 3~5시간 책임지고 돌봄 필요<br/>
						- 등하원, 밥 챙겨주기, 씻기기, 놀아주기 활동 포함<br/></label>
			<label for="typeThree">
				<input type="radio" name="tType" id="typeThree" class="col-1"/>
			<b>신생아/영아 보조 돌봄</b><br/>
						- 0~24개월 아이를 보호자와 함께 또는 혼자 돌봄<br/>
						- 최근 0~12개월 돌본 경험 1주일 이상 필수<br/>
						- 주 1~4회 정기적으로 또는 단기로 2~4시간 활동<br/></label>
			<label for="typeFour">
			<input type="radio" name="tType" id="typeFour" class="col-1"/><b>놀이/학습 돌봄</b><br/>
						- 2~10세 아이와 특기를 활용해서 즐겁고 학습적인 시간을 보내는 활동<br/>
						- 주 1~4회 정기적으로 또는 단기로 2~4시간 활동<br/></label>
			<label for="typeFive">
				<input type="radio" name="tType" id="typeFive" class="col-1"/>
				<b>긴급/단기 돌봄</b><br/>
						- 정기 방문이 아닌, 1~2회 또는 짧은 기간 동안만 돌봄 활동<br/>
						- 프로필에 돌봄 가능한 아이 연령과 활동 명시 필요<br/></label>
			



			<input type="submit" class="btn btn-warning" value="저장" />
		</div>
</body>
</html>

