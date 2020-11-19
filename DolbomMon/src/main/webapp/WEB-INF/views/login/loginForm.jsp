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
		width: 800px;
	}
	#loginChk{
		margin-left: 0px;
	}
	#search{
		text-align: center;
	}
	a:link, a:visited, a:hover, a:active {
		color: gray;
	}
	#logo{
		padding: 20px;
		width: 50%;
		display: block;
		margin: 0px auto;
	}
</style>
</head>
<body>
<div class="container">
	<div>
	<a href="/dbmon"><img src="<%=request.getContextPath()%>/img/dbLogo.png" id="logo" align="middle"/></a>
	
	</div>
	<form method="post" action="loginOk">
		<div class="form-group">
			<label for="lblId">아이디</label>
			<input type="text" class="form-control" id="InputId" placeholder="아이디를 입력하세요">
		</div>
		<div class="form-group">
			<label for="lblPwd">비밀번호</label>
			<input type="password" class="form-control" id="inputPwd" placeholder="비밀번호를 입력하세요">
		</div>
		<div>	
			<input type="submit" class="btn btn-warning btn-lg btn-block" value="로그인"/><br/>
			<input class="form-check-input" type="checkbox" id="loginChk">
			<label class="form-check-label" for="loginChkLbl">
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