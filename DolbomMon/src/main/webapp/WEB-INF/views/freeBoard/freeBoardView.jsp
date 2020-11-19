<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 	보기</title>
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
<script>
	$(function(){
		$("#delBtn").click(function(){
			if(confirm("삭제하시겠습니까?")){
				location.href="/dbmon/freeBoardDel?no=${vo.no}";
			}		
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div id="top">
			<b>게시글 보기</b>
		</div>
		<table class="table">
			<tbody>
				<tr>
					<th scope="col">글제목</th>
					<td>글제목글제목글제목글제목글제목글제목</td>
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
					<br/>마스크 착용 의무화(10.13~), 집회금지 명령 지속
					
					대형학원, 뷔페 등 고위험시설 10종 집합제한으로 전환<br/>
					
					수도권 방역수칙 의무화 대상 시설 (16종)<br/>
					
					실내외 공공시설 개방, 인원 50%로 제한 운영<br/>
					
					사회적 거리두기 조정 방안(2020.10.12.~)<br/>
					
					방역수칙 위반 시 책임 강화…개정된 감염병예방법 시행<br/>
					
					(상세한 내용은 링크를 참조하세요!)<br/>
					
					자세한 사항은 아래의 링크 주소를 클릭해 주세요.<br/><br/>
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
			<a class="btn btn-warning" href="#" role="button" id="delBtn">삭제</a>
			<a class="btn btn-warning" href="#" role="button">수정</a>
			<a class="btn btn-warning" href="#" role="button">답변</a>
			<a class="btn btn-warning" href="#" role="button">목록</a>
		</div>
	</div>
</body>
</html>