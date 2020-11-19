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
	/* ================ 초기화 =============== */
	*{margin:0; padding:0;}	
	.container{width:600px;}
	.container div{width:100%; overflow:hidden; height:auto;}
	/* ================ 초기화 =============== */
	
	/* ================ 헤더 =================== */
	#header1{text-align:center; height:30px; margin-top:80px;}
	#header1>span{border:1px solid gray; color:gray; border-radius:15px; line-height:30px; padding:5px; font-size:12px;}
	
	#header2{text-align:center; font-size:1.5em; margin-top:5px; }
	/* ================ 헤더 =================== */
	
	/* ============== 특이사항 입력 =============== */
	#textareaDiv{margin-top:30px;}
	#textareaDiv>textarea{width:100%; height:150px; padding:10px 20px; overflow:hidden; resize:none; }
	
	#warningMsg{margin:10px 0px; text-align:center;}
	#warningMsg>span{color:gray; font-size:12px}

	input[type=submit]{width:100%; height:40px;}
	/* ============== 특이사항 입력 =============== */
</style>
<script>
	$(function(){
		$("#textareaDiv>textarea").keyup(function(){
			if($("#textareaDiv>textarea").val()==""){
				$("input[type=submit]").val("나중에 입력할게요.");
			}else{
				$("input[type=submit]").val("다음");
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div id="header1"><span>선택작성 항목</span></div>
		<div id="header2">돌봄몬이 알아야 할 내용이 있나요?</div>
		<form action="<%=request.getContextPath()%>/regForm">
			<div id="textareaDiv"><textarea name="content" placeholder="아이의  성별, 성격, 특이사항 등을 적어주세요."></textarea></div>
			<div id="warningMsg"><span>신청서 내용에 연락처, 이메일, 카카오ID 등을 작성할 경우 회원 자격을 영구적으로 잃게 됩니다.</span></div>
			<input type="submit" value="나중에 입력할게요."/>
		</form>
	</div>
</body>
</html>