<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증글 보기</title>
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
			<b>인증 게시글 보기</b>
		</div>
		<table class="table">
			<tbody>
				<tr>
					<th scope="col">글제목</th>
					<td>인증글제목</td>
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
					<th scope="col">조회수</th>
					<td>20</td>
				</tr>
				<tr>
					<th scope="col">글내용</th>
					<td>
					<br/>
					인증글내용인증글내용인증글내용인증글내용인증글내용인증글내용<br/>
					인증글내용인증글내용인증글내용<br/>
					인증글내용인증글내용인증글내용<br/>
					<br/>
					</td>
				</tr>
				<tr>
					<th scope="col">첨부파일</th>
					<td>
					<a href="#" download><img src="<%=request.getContextPath()%>/img/disk.png"/></a>
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