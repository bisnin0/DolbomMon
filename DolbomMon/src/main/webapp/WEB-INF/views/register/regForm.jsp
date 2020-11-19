
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/regFormStyle.css" type="text/css"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<script>
	$(function(){
		
		// 성별 라디오 버튼
		$("#genderLst>label").click(function(){
			$(this).css("color", "rgb(0,74,173)").css("background-color", "rgb(255, 222, 89)");
			$(this).siblings().css("color","black").css("background-color", "gray");
		});
		
		// 우편번호
		$("#zipcodeSearch").click(function(){
			window.open('<%=request.getContextPath()%>/zipcodeSearch', 'zipcode', 'top=300,left=500,width=500,height=600');
		});
		
		// 포커스 제거
		$(":focus").blur();
	});
	
	function formCheck(){
		
		// 아이디 정규식 첫번째글자 무조건 영문자 영어대소문자, 숫자, _, 8~14자리
		reg = /^[A-Za-z]{1}\w{7,13}$/;
		if(!reg.test(document.getElementById("userid").value())){
			alert("아이디가 적합하지 않습니다.");
			return false;
		}
		
		reg = /^[가-힣]{2,7}$/;
		if(!reg.test(document.getElementById("username").value())){
			alert("이름은 한글 2~7글자까지만 허용됩니다.")
			return false;
		}
		
		reg = /^\w{8,20}[@][a-zA-Z]{4,20}[.][a-zA-Z]{2,3}([.][a-zA-Z]{2,3})?$/;
		var email1 = document.getElementById("email1").value();
		var email2 = document.getElementById("email2").value();
		if(!reg.test(email1+email2)){
			alert("이메일 형식이 잘못 되었습니다.");
			return false;
		}
		
		reg = /^(010|02|031|032|041)[-][0-9]{3,4}[-][0-9]{4}$/;
		var tel1 = document.getElementById("tel1_1").value()+"-"+document.getElementById("tel1_2").value()+"-"+document.getElementById("tel1_3").value();
		if(!regtest(tel1)){
			alert("연락처 형식이 잘못 되었습니다.");
			return false;
		}
		
		return false;
	}
</script>
</head>
<body>
<div id="mainDiv">
	<div id="header">회원가입</div>
	<form method="post" action="<%=request.getContextPath()%>/regFormOk" onsubmit="formCheck()">
		<ul>
			<li><input type="text" id="userid" name="userid" placeholder="아이디 입력" /></li>
			<li><input type="password" name="userpwd" placeholder="비밀번호 입력" /></li>
			<li><input type="text" id="username" name="username" placeholder="이름 입력" /></li>
			<li>
				<input type="text" class="email" id="email1" name="email1" placeholder="이메일 입력"/>
				<input type="text" class="email" id="email2" name="email2" placeholder="직접 입력"/>
				<select id="selectEmail">
					<option>gmail.com</option>
					<option>naver.com</option>
					<option>daum.net</option>
					<option>nate.com</option>
					<option>직접 입력</option>
				</select>
			</li>
			<li>
				<input type="text" id="birth" name="birth" placeholder="생년월일 입력"/>
			</li>
			<li>
				<span>연락처</span><input type="text" class="tel" name="tel1_1" id="tel1_1"/><input type="text" class="tel" name="tel1_2" id="tel1_2"/><input type="text" class="tel" name="tel1_3" id="tel1_3"/>
				<span>비상연락처</span><input type="text" class="tel" name="tel2_1" id="tel2_1"/><input type="text" class="tel" name="tel2_2" id="tel2_2"/><input type="text" class="tel" name="tel2_3" id="tel2_3"/>
			</li>
			<li id="genderLst">
				<div id="radioDiv">
					<input id="M" type="radio" name="gender" checked="checked"/>
					<input id="F" type="radio" name="gender"/>
				</div>
				<label for="M">남</label>
				<label for="F">여</label>
			</li>
			<li>
				<input type="text" class="addr" name="zipcode" id="zipcode" placeholder="우편번호 입력" size="5"/><input type="button" class="addr" id="zipcodeSearch" value="우편번호 검색"/><input type="text" class="addr" name="addr" id="addr" placeholder="도로명주소 입력" />
				<input type="text" class="addr" name="addrdetail" id="addrdetail" placeholder="상세 주소 입력"/>
			</li>
			<li>
				<input type="submit" value="가입하기" />
			</li>
		</ul>
	</form>
</div>
</body>
</html>