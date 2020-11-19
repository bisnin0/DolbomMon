<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 보기</title>
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
</style>
</head>
<body>
	<div class="container">
		<div id="top">
			<b>신고게시글 보기</b>
		</div>
		<table class="table">
			<tbody>
				<tr>
					<th scope="col">글제목</th>
					<td>신고글제목</td>
				</tr>
				<tr>
					<th scope="col">작성자</th>
					<td>홍길동</td>
				</tr>
				<tr>
					<th scope="col">등록일</th>
					<td>11-16 15:35</td>
				</tr>
				<tr>
					<th scope="col">신고사유</th>
					<td>신고사유를 적어주세요</td>
				</tr>
				<tr>
					<th scope="col">신고내용</th>
					<td>
					신고내용입니다신고신고 신고 신고<br/>
					신고내용입니다신고신고 신고 신고<br/>
					신고내용입니다신고신고 신고 신고<br/>
					신고내용입니다신고신고 신고 신고<br/>
					신고내용입니다신고신고 신고 신고<br/>
					신고내용입니다신고신고 신고 신고<br/>
					신고내용입니다신고신고 신고 신고<br/>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<th scope="col">이전글</th>
					<td><a href="#">이전글 이전글 이전글</a></td>	
				</tr>
				<tr>
					<th scope="col">다음글</th>
					<td><a href="#">다음글 다음글 다음글</a></td>	
				</tr>
			</tfoot>
		</table>
		<div>
			<a class="btn btn-warning" href="#" role="button">삭제</a>
			<a class="btn btn-warning" href="#" role="button">목록</a>
		</div>
	</div>
</body>
</html>