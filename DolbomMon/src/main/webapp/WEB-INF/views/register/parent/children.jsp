<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	*{margin:0; padding:0; text-decoration:none; list-style:none;}
	.container{width:600px; padding:0px;}
	#header{width:100%; height:60px; margin-top:50px; text-align:center;}
	/* ====================== 자녀 수 ========================= */
	#childrenInfo{width:100%; overflow:hidden; height:auto; }
	#childrenCnt input[type=button]{width:130px; height:70px; margin:10px; float:left;}
	
	/* ===================== 자녀 세부정보 ==================== */
	#childrenDetailDiv{width:100%; overflow:hidden; height:auto;}
	
	/* =================== 희망급여 ==================== */
	#wageDiv{width:100%; overflow:hidden; height:auto;}
	
	#childrenInfo input[type=submit]{width:100%; height:50px; margin-top:30px;}
</style>

<script>
	$(function(){
		// 자녀 수 선택버튼 클릭
		$("#childrenCnt input").click(function(){
			$(this).css('background-color', 'rgb(255,222,89)').css('color', 'navy').css('border', '1px solid navy');
			$(this).siblings().css('background-color', '#EFEFEF').css('color', 'black').css('border', '1px solid black');
			
			// 
			var childrenCnt = $(this).attr("name");
			childrenCnt = Number(childrenCnt);
			$("#childrenDetail").html("");
			var tag = ""
			tag += "<li><span>자녀 이름</span><input type='text' name='child_name' /><br/>";
			tag += "<span>자녀 생년월일</span><input type='text' name='child_birth' /></li>";
			for(var i=0;i<childrenCnt;i++){
				$("#childrenDetail").append(tag);
			}	 
		});
		$(":focus").blur();
	});
</script>
</head>
<body>
	<div class="container">
		<div id="header">몇 명의 아이를 돌봐드릴까요?</div>
		<div id="childrenInfo">
			<div id=childrenCnt>
				<input type="button" name="1" value="1명"/>
				<input type="button" name="2" value="2명"/>
				<input type="button" name="3" value="3명"/>
				<input type="button" name="4" value="4명"/>
			</div>
			<form action="<%=request.getContextPath()%>/parent/location">
				<div id="childrenDetailDiv">
					<ul id="childrenDetail"></ul>
				</div>
				<div id="wageDiv">
					<span>돌봄몬에게 지급할 희망시급을 적어주세요</span>
					<input type="text" value="13000" name="wish_wage"/><span id="won">원</span>
				</div>
				<input type="submit" value="다음"/>
			</form>
		</div>
	</div>	
</body>
</html>