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
		min-height: 773px;
	}	
	#top{
		margin: 15px;
		margin-top: 40px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	#inputBox{
		margin-top: 30px;
		height: 190px;
		padding: 20px;
		border: 1px solid lightgray;
	}
	#username, #birth, #tel1{
		width: 600px;
	}

</style>
<script>
$(function(){
	
	//데이터 입력유무 확인
	$("#searchFrm").submit(function(){

		if($("#username").val()==""){
			alert("가입하신 계정의 이름을 입력하세요.");
			$("#username").focus();
			return false;		
		}
		if($("#birth").val()==""){
			alert("가입하신 계정의 생년월일을 입력하세요.");
			$("#birth").focus();
			return false;
		}
		if($("#tel1").val()==""){
			alert("가입하신 계정의 전화번호를 입력하세요.");
			$("#tel1").focus();
			return false;	
		}
		if ($("#birth").val().length<8) {
			alert("생년월일 여덟자리를 입력해주세요.");
			$("#birth").focus();
			return false;
		}
		if ($("#tel1").val().length<10) {
			alert("전화번호를 확인해주세요.");
			$("#tel1").focus();
			return false;
		}
		return true;
	});
});

</script>
</head>
<body>
<div class="container">
<%@include file="/WEB-INF/views/top.jsp"%>
<div id="top">
<b>계정찾기</b>
</div>
<div>
<b>아이디나 비밀번호를 잊어버리셨나요?</b><br/>
이름과 생년월일, 휴대폰 번호를 입력하시면, 가입한 계정 정보를 알려드립니다.<br/>
</div>
	<form method="post" action="idInfo" id="searchFrm">
		<div id="inputBox">
			<div class="form-group row">
				<label for="username" id="nameLbl" class="col-sm-2 col-form-label"> &nbsp;이름</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="username" name="username" placeholder="이름을 입력하세요">		
				</div>
			</div>
			<div class="form-group row">
				<label for="birth" id="birthLbl" class="col-sm-2 col-form-label"> &nbsp;생년월일</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="birth" name="birth" placeholder="생년월일 8자리(YYYYMMDD)를 입력해주세요">
				</div>
			</div>
			<div class="form-group row">
				<label for="tel1" id="telLbl" class="col-sm-2 col-form-label"> &nbsp;휴대폰 번호</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" id="tel1" name="tel1" placeholder="휴대폰 번호를 '-'없이 입력해주세요">
				</div>
			</div>
		</div>
		<br/><input type="submit" class="btn btn-warning btn-lg btn-block" value="계정 찾기"/>
	</form>
</div>
</body>
</html>
<jsp:include page="../footer.jsp"/>
