<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 글쓰기</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<style>
	.container{
		width: 900px;	
	}
	#top{
		margin: 15px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	#content{
		height: 300px;
	}
	#post{
		width: 80px;
		display: block;
		margin: 0 auto;
	}
</style>
</head>
<body>
<div class="container">
<div id="top">
<b>공지사항 글쓰기</b>
</div>
	<form method="post" action="#">
		<div class="form-group">
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary" type="button">말머리</button>
				</div>
				<select class="custom-select" id="inputGroupSelect03" aria-label="Example select with button addon">
					<option selected>선택하세요</option>
					<option value="1">공지사항</option>
					<option value="2">말머리를</option>
					<option value="3">넣어주세요</option>
					<option value="3">블라블라</option>
				</select>
			</div>
	 		<label for="title">제목</label>
			<input type="text" class="form-control" id="title" placeholder="제목을 입력하세요"><br/>
			<div>
			<label for="content">글내용</label><br/>
				<textarea class="form-control" id="content" placeholder="글내용을 입력하세요"></textarea>
			</div>
			<br/>
			<div class="input-group mb-3">
				<div class="input-group-prepend">
					<button class="btn btn-outline-secondary" type="button" id="inputGroupFileAddon03">Upload</button>
				</div>
				<div class="custom-file">
					<input type="file" class="custom-file-input" id="inputGroupFile03" aria-describedby="inputGroupFileAddon03">
					<label class="custom-file-label" for="inputGroupFile03">파일을 선택하세요</label>
				</div>
			</div>			
			<!-- <input type="submit" id="post" class="btn btn-warning" value="등록"/> -->
		 	<input type="submit" class="btn btn-warning btn-lg btn-block" value="등록"/>
		</div>
	</form>
</div>
</body>
</html>