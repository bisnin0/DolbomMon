<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 800px;
	}	
	#top{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	#inputBox{
		margin-top: 30px;
		padding: 20px;
		border: 1px solid lightgray;
	}
	#inputName, #inputBirth, #inputTel{
		width: 600px;
	}
</style>
</head>
<body>
<div class="container">
<div id="top">
<b>계정찾기</b>
</div>
<div>
<b>아이디나 비밀번호를 잊어버리셨나요?</b><br/>
이름과 생년월일, 휴대폰 번호를 입력하시면, 가입한 계정 정보를 알려드립니다.<br/>
</div>
	<form method="post" action="idInfo">
		<div id="inputBox">
			<div class="form-group row">
				<label for="lblName" class="col-sm-2 col-form-label">이름</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputName" placeholder="이름을 입력하세요">		
				</div>
			</div>
			<div class="form-group row">
				<label for="lblBirth" class="col-sm-2 col-form-label">생년월일</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputBirth" placeholder="생년월일 8자리(YYYYMMDD)를 입력해주세요">
				</div>
			</div>
			<div class="form-group row">
				<label for="lblTel" class="col-sm-2 col-form-label">휴대폰 번호</label>
				<div class="col-sm-10">
					<input type="text" class="form-control" id="inputTel" placeholder="휴대폰 번호를 '-'없이 입력해주세요">
				</div>
			</div>
		</div>
		<br/><input type="submit" class="btn btn-warning btn-lg btn-block" value="계정 찾기"/>
	</form>
</div>
</body>
</html>