<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>

<style>
	.container{width:600px; text-align:center; padding:0;}
	h3{display:inline-block; margin-top:100px;}
	h3>span{color:lightblue; font-size:17px; line-height:33px;}
 	#imgDiv{margin:20px 0;text-align:center;padding-left:40px;}
 	#plusBtn{position:relative; right:45px; top:40px; width:40px;height:40px;}
 	p{display:inline-block; width:40%; overflow:hidden; height:auto; font-size:15px;}
 	.container>input{width:70%; height:40px; border:1px solid #CCC; border-radius:10px;}
 	input[type=submit]{margin:20px 0; background-color:orange; color:#EFEFEF}
 	input[type=file]{display:none;}
 	#profileImg{width:120px;height:120px;}
</style>
<script>
$(function(){
	$("#plusBtn").click(function(e){
		$("#pic2").click();
	});
	
	
	$("#imgDiv").change(function(){
		var url = "/dbmon/profileImageOk11";
		var formData = new FormData($("#uploadFrm")[0]);
		$.ajax({
			url:url,
			data:formData,
			type:'POST',
			processData:false, //필수
			contentType: false, //필수
			success:function(result){
				console.log("성공");
				console.log("결과"+result);
				$("#profileImg").attr("src", "<%=request.getContextPath()%>/upload/"+result);
				$("#pictext").val(result);
			}, error:function(error){
				console.log("사진 ajax 실패");
			}
		
		});
	});
	
	$("#uploadFrm").submit(function(){
		var pic = $("#pic2").val();
		if(pic==null || pic==""){
			alert("이미지를 설정해주세요");
			return false;
		}
		return true;
	});
	
	
});

	function laterUpload(){
		location.href = "<%=request.getContextPath()%>/dbm/introduce/np";
	}

</script>

</head>
<body>
	<form id="uploadFrm" name="uploadFrm" method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/dbm/profileImageOk2">
		<div class="container">
			<h3>내 프로필 사진<span>(선택사항)</span></h3>
			<input type="hidden" name="pic" id="pictext" />
			<div id="imgDiv">
				<img id="profileImg" src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/join/sitter-join-student.svg"/>
				<img id="plusBtn" style="cursor:pointer;" src="https://s3.ap-northeast-2.amazonaws.com/momsitter-service/momsitter-app/static/public/profile/profile-add-bt.svg" />
				<input id="pic2" type="file" name="pic2" accept="image/*,video/*"/>
			</div>
			<p>내 사진을 올리면 부모회원의 선택을 <span>5배 더 많이</span> 받을 수 있습니다.</p>		
			<input id="uploadSubmit" type="submit" value="지금 올리기"  />
			<input id="later" type="button" value="나중에 하기" onclick="laterUpload();"/>
		</div>
	</form>
</body>
</html>