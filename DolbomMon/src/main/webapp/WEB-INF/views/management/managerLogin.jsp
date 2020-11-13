<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script> 
</head>
<body>
<h1>로그인화면</h1>
<title>DolbomMon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href='https://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'> 
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>

	$(function(){
		$("#test").click(function(){ /*DB작업 전 임시 로그인버튼*/
			location.href="/dbmon/managerlogin2";
			
		});
		
		

		$(".user").focusin(function(){
		  $(".inputUserIcon").css("color", "#e74c3c");
		}).focusout(function(){
		  $(".inputUserIcon").css("color", "white");
		});

		$(".pass").focusin(function(){
		  $(".inputPassIcon").css("color", "#e74c3c");
		}).focusout(function(){
		  $(".inputPassIcon").css("color", "white");
		});
		
	});

</script>
<style>
	body{
		margin:0;
		padding:0;
		background : url("/dbmon/resources/managerLoginBackImg.jpg") no-repeat;
		background-size:cover;
	}
	.container{
		width:1300px;
		padding:150px 0px;
	}
	.loginText{
		width:200px;
	}
	#leftDiv, #rightDiv{
		margin:0;
		padding:50px;
		width:550px;
		height:700px;
		float:left;
		color:#A6A6A6;
	}
	#leftDiv{
		background-color:#399190;
		color:#FFFFFF;
		padding:300px 50px;
		border-radius: 15px 0px 0px 15px;
	}
	#rightDiv{
		padding:130px 50px;
		background-color:#2D3035;
		border-radius: 0px 15px 15px 0px;
	}
	h1 {
		font-size: 40px;
		font-weight: 200;
	}
	
	
	*,
	*:before,
	*:after {
	  -moz-box-sizing: border-box;
	  -webkit-box-sizing: border-box;
	  box-sizing: border-box; 
	}
	
	
	h2 {
	  color:rgba(255,255,255,.8);
	  margin-left:45px;
	}
	
	body {
	  font-family: 'Roboto', sans-serif;
	}
	
	form {
	  position:relative;
	  margin: 50px auto;
	  width: 380px;
	  height: auto;
	}
	
	input {
	  padding: 16px;
	  border-radius:7px;
	  border:0px;
	  background: rgba(255,255,255,.2);
	  display: block;
	  margin: 15px 45px;
	  width: 300px;  
	  color:white;
	  font-size:18px;
	  height: 54px;
	}
	
	
	input:focus {
	  outline-color: rgba(0,0,0,0);
	  background: rgba(255,255,255,.95);
	  color: #e74c3c;
	}
	
	input::-webkit-input-placeholder {
	  color: white;
	}
	
	input:focus::-webkit-input-placeholder {
	  color: #e74c3c;
	}


</style>
</head>
<body>
<div class="container">

	<div id="leftDiv">
	<h1>Welcome</h1>
	</div>
	<div id="rightDiv">
	
	<form method="post" id="managerLogin" action="">
	  <h2>Login</h2>
	  <input type="text" class="user" placeholder="userid"/>
	  <input type="password" class="pass"placeholder="password"/>
	  <input type="submit" value="로그인"/>
	  <input type="button" value="임시로그인" id="test"/>

	</form>
	
	</div>
</div>


</body>
</html>