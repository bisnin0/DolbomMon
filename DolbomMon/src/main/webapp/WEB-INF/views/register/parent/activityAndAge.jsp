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
<style>
	/* ============= 초기화 ==============  */
	*{margin:0; padding:0; list-style:none; text-decoration:none;}
	.container{width:600px; margin-top:100px;}
	/* ============= 초기화 ==============  */
	
	/* ============= 헤더 =============== */
	#header{ padding:10px;}
	#header img{width:50%; height:130px; display:block; margin:0 auto;}
	#header>div{text-align:center; font-size:2em; }
	/* ============= 헤더 =============== */
	
	/* ============= 돌봄 유형 목록 ============== */
	#activityListDiv{overflow:hidden; height:auto;}
	#activityListDiv li{overflow:hidden; width:25%; height:90px;  float:left; padding:10px;}
	#activityListDiv label{width:100%; height:100%; line-height:70px; text-align:center; background-color:#EFEFEF; border:1px solid black; border-radius:12px;}
	/* ============= 돌봄 유형 목록 ============== */
	
	/* ============= 원하는 선생님 나이 선택 ================ */
	#ageDiv{overflow:hidden; height:auto; margin-top:40px;}
	#ageDivTitle{text-align:center; font-size:2em;}
	#ageDiv ul{overflow:hidden; width:65%; margin:0 auto;}
	#ageDiv li{width:20%; height:50px; line-height:50px; float:left; margin:10px 0; border:1px solid black; border-radius:20px; background-color:#EFEFEF; color:black; font-weight:bold; }
	#ageDiv label{width:100%; height:100%; text-align:center; }
	#ageDiv>input[type=submit]{width:100%; height:40px; margin-top:30px;}
	/* ============= 원하는 선생님 나이 선택 ================ */
	
	.opacity{position:absolute; opacity:0; width:0;}
</style>
<script>
	$(function(){
		// 돌봄유형 클릭 시
		$("#activityListDiv label").click(function(){
			var activityCnt = $("input[name=activity]:checked").length;
			var selectedAct = $(this).attr("for");
			var alt = $("input[id="+selectedAct+"]").attr('alt');
			console.log("alt = " + alt);
			console.log("actCnt =>> "+activityCnt);
			console.log("for =>> " + selectedAct);
			
			// 선택할 수 있는 돌봄유형 갯수 제한
			if(activityCnt<=2){	
				if(alt=='2'){ // 선택 해제했을 떄
					$(this).css('background-color', '#EFEFEF').css('color', 'black').css('border', '1px solid black');
					$("input[id="+selectedAct+"]").attr('alt','1');
				}else if(alt=='1'){ // 선택헀을 때
					$(this).css('background-color', 'rgb(255,222,89)').css('color', 'navy').css('border', '1px solid navy'); 
					$("input[id="+selectedAct+"]").attr('alt','2');
				}
			}else if(activityCnt==3){
				$("input[name=activity]").attr('disabled', true);
				if(alt=2){
										
				}
			}
		});
		
		// 포커스 없애기
		$(":focus").blur();
	});

</script>
</head>
<body>
	<div class="container">
		<form method="get" action="<%=request.getContextPath()%>/parent/children">
			<div id="header">
				<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/img/logo.png"/></a>
				<div id="headerTxt">어떤 돌봄을 원하세요?</div>
			</div>
			<div id="activityListDiv">
				<input class="opacity" type="checkbox" id="1" alt="1" name="activity" value="실내놀이"/>		
				<input class="opacity" type="checkbox" id="2" alt="1" name="activity" value="등하원돕기"/>		
				<input class="opacity" type="checkbox" id="3" alt="1" name="activity" value="영어놀이"/>	
				<input class="opacity" type="checkbox" id="4" alt="1" name="activity" value="한글놀이"/>		
				<input class="opacity" type="checkbox" id="5" alt="1" name="activity" value="학습지도"/>	
				<input class="opacity" type="checkbox" id="6" alt="1" name="activity" value="야외활동"/>	
				<input class="opacity" type="checkbox" id="7" alt="1" name="activity" value="밥챙겨주기"/>	
				<input class="opacity" type="checkbox" id="8" alt="1" name="activity" value="책읽기"/>		
				<ul>
					<li><label for="1" >실내놀이</label></li>
					<li><label for="2" >등하원 돕기</label></li>
					<li><label for="3" >영어놀이</label></li>
					<li><label for="4" >한글놀이</label></li>
					<li><label for="5" >학습지도</label></li>
					<li><label for="6" >야외활동</label></li>
					<li><label for="7" >밥 챙겨주기</label></li>
					<li><label for="8" >책읽기</label></li>
				</ul>
			</div>
			<div id="ageDiv">
				<div id="ageDivTitle">
					어느 나이대의 돌봄몬을 원하시나요?
				</div>
				<input class="opacity" type="checkbox" id="20" name="wish_age" value="20" checked="checked"/>
				<input class="opacity" type="checkbox" id="30" name="wish_age" value="30" checked="checked"/>
				<input class="opacity" type="checkbox" id="40" name="wish_age" value="40" checked="checked"/>
				<input class="opacity" type="checkbox" id="50" name="wish_age" value="50" />
				<input class="opacity" type="checkbox" id="60" name="wish_age" value="60" />
				<ul>
					<li><label for="20">20</label></li>
					<li><label for="30">30</label></li>
					<li><label for="40">40</label></li>
					<li><label for="50">50</label></li>
					<li><label for="60">60</label></li>
				</ul>
				<input type="submit" value="다음" />
			</div>
		</form>
	</div>
</body>
</html>