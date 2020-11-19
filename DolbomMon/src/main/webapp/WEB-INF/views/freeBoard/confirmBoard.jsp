<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증게시판</title>
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
	
	.subject{
		width: 400px;
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
	
	}
	a:link, a:visited, a:hover{
	 	color: black;
	 }
	body{
	 	font-size: 0.9em;
	 }
	
</style>
</head>
<body>
<div class="container">
<div id="top">
<b>인증게시판</b>
</div>
<div id="board">
<br/>
	<table class="table table-hover">
		<colgroup>
			<col style="width: 10%;">
			<col>
			<col style="width: 15%;">
			<col style="width: 15%;">
			<col style="width: 10%;">
		</colgroup>
		<thead>
			<tr>
				<th scope="col">글번호</th>
				<th scope="col">글제목</th>
				<th scope="col">작성자</th>
				<th scope="col">등록일</th>
				<th scope="col">첨부파일</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<!-- 글제목 script로 글자수 제한하기 -->
				<td class="subject"><a href="confirmBoardView">글제목입니다1111111글제목입니다1111111</a></td>
				<td>홍길동</td>
				<td>13:11</td>
			</tr>
			<tr>
				<th scope="row">2</th>
				<td class="subject"><a href="#">글제목입니다2222222</a></td>
				<td>정길동</td>
				<td>11-11 15:11</td>
				<td><a href="#" download><img src="<%=request.getContextPath()%>/img/disk.png"/></a></td>
			</tr>
			<tr>
				<th scope="row">3</th>
				<td class="subject"><a href="#">글제목입니다3333333</a></td>
				<td>정길동</td>
				<td>11-10 13:51</td>
				<td><a href="#" download><img src="<%=request.getContextPath()%>/img/disk.png"/></a></td>
			</tr>
			<tr>
				<th scope="row">4</th>
				<td class="subject"><a href="#">글제목입니다4444444</a></td>
				<td>정길동</td>
				<td>11-10 13:51</td>
				<td><a href="#" download><img src="<%=request.getContextPath()%>/img/disk.png"/></a></td>
			</tr>
			<tr>
				<th scope="row">5</th>
				<td class="subject"><a href="#">글제목입니다5555555</a></td>
				<td>정길동</td>
				<td>11-10 13:51</td>
				<td><a href="#" download><img src="<%=request.getContextPath()%>/img/disk.png"/></a></td>
			</tr>
		</tbody>
	</table>
	<br/>
	<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item disabled">
				<a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
			</li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">4</a></li>
			<li class="page-item"><a class="page-link" href="#">5</a></li>
			<li class="page-item">
				<a class="page-link" href="#">Next</a>
			</li>
		</ul>
	</nav>
	<br/>
	<div class="input-group mb-3">
		<input type="text" class="form-control" placeholder="검색어를 입력하세요"/>
		<div class="input-group-append">
			<button class="btn btn-warning" type="button" id="button-addon2">검색</button>
		</div>
	</div>
</div>
</div>
</body>
</html>