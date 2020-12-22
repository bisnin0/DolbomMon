<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄몬 로그인</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>

	.container{
		width: 700px;
		min-height: 530px;
		margin-bottom: 100px;
	}
	#top{
		margin: 15px;
		margin-top: 40px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	#loginInfo{
		color: gray;
		font-size: 0.9em;
		margin: 0 auto;
		margin-bottom: 10px;
		text-align: center;
		
	}
	
	#loginCookie{
		margin-left: 0px;
	}
	#search{
		text-align: center;
	}
	a:link, a:visited, a:hover, a:active {
		color: gray;
	}

</style>
<script>
$(function(){
	
	//데이터 입력유무 확인
	$("#loginFrm").submit(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;	
		}
		if($("#userpwd").val()==""){
			alert("비밀번호를 입력하세요.");
			$("#userpwd").focus();
			return false;
		}
		return true;
	});	
});

</script>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<div class="container">
	<div id="top">
		<b>로그인</b>
	</div>
	<div id="loginInfo">로그인을 하시면 더욱 편리하게 돌봄몬 서비스를 이용하실 수 있습니다.</div>
	<form method="post" action="loginOk" id="loginFrm">
		<div class="form-group">
			<label for="userid">아이디</label>
			<input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요">
		</div>
		<div class="form-group">
			<label for="userpwd">비밀번호</label>
			<input type="password" class="form-control" name="userpwd" id="userpwd" placeholder="비밀번호를 입력하세요">
		</div>
		<div>	
			<input type="submit" class="btn btn-warning btn-lg btn-block" value="로그인"/><br/>
			<input class="form-check-input" type="checkbox" id="loginCookie" name="loginCookie">
			<label class="form-check-label" for="loginCookie">
			&nbsp;&nbsp;&nbsp;&nbsp;로그인 상태 유지
			</label><hr/>
		</div>
		<div id="search">
		<a href="/dbmon/searchId">로그인 정보를 잊으셨나요?</a><br/>
		<a href="join">회원가입</a>
		</div>
	</form>
</div>
</body>
</html>
<jsp:include page="../footer.jsp"/>