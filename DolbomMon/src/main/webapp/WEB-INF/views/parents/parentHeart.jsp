<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<style>
	.container{width:800px;}
	img{ height:90px; width:90px;}
	
	h1{text-align:center;}
	i{color:orange;}
	#title{
		margin: 15px;
		margin-top: 40px;
		padding: 15px;
		text-align: center;
		font-size: 30px;
	}
	#titlefont{
		font-size: 25px;
		font-weight: 700;
		vertical-align: bottom;
		text-align:center;
	}
	#likeFilter, #likeDropdown {
	border:none;
	}
	.trash {
	cursor:pointer;
	}
	
	#likeBox {
	display: inline-block;
	width:100%;
	min-height:300px;
	}
	#allActive, #onlyActive{
	cursor:pointer;
	}
</style>
<script>
$(function(){
	$(document).on("click", ".trash", function(){
		var cardid = $(this).parent().parent().attr("id");
		$(this).parent().parent().hide();
		console.log(cardid);
		var url = "/dbmon/deleteHeartT";
		var params = "cardid="+cardid;
		
		$.ajax({
			url:url,
			data:params,
			type:'GET',
			success:function(result){
				
				if(result=="1"){
					console.log("성공");
					
					
				}else if(result="0"){
					console.log("실패");
				}
				
			}, error:function(){
				console.log("AJAX 받기 에러");
			}
		})
		
	});//trash삭제
	
	//프로필 들어가기
    $(document).on("click", ".list-group-horizontal", function(){
    	location.href="teacherView?userid="+$(this).parent().parent().attr('id');
    			//+"nowPage="+$(this).attr('id');
    });
	
	//신청하기&협의하기
    var popupWidth = 1060;
	var popupHeight = 596;
	var popupX = (window.screen.width / 2) - (popupWidth / 2);
	var popupY= (window.screen.height / 2) - (popupHeight / 2);
	$(document).on("click", ".shinchung", function(event){
		 event.stopPropagation();
		console.log('test');
		popupWidth = 1060;
		popupHeight = 1600;
		var userid = $(this).attr('id');
		console.log(userid);
		window.open('/dbmon/contractOpenT?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
	})
	$(document).on("click",".cBtn",function(event){
		event.stopPropagation();
		popupWidth = 1060;
		popupHeight = 596;
		var userid = $(this).attr('id');
		window.open('/dbmon/chat?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
	});
	
	//필터
	$(document).on("change", "#likeDropdown", function(){
		var order = $(this).val();
		console.log("정렬="+order);
		var url = "/dbmon/likeOrder";
		var params = "order="+order;
		console.log("파람="+params);
		
		$.ajax({
			url:url,
			data:params,
			type:'GET',
			success:function(result){
				console.log("리턴="+result);
				var $result = $(result);
				var tag = "";
				
				$result.each(function(idx, vo){
					console.log("액티브"+vo);
					if(vo.active=="Y"){
						tag += '<ul class="list-group" id="'+vo.userid+'">';
						tag += '<li class="list-group-item">';
						tag += '<ul class="list-group list-group-horizontal" style="cursor:pointer"  id="'+vo.nowPage +'">';
						tag += '<li class="list-group-item border-0 col-2">';
						tag += '<img src=';
						if(vo.pic==null){
							tag += '"img/profilepic.png"';
						}else if (vo.pic!=null){
							tag += '"upload/'+vo.pic+'"';
						}		
						
						tag+= ' class="rounded-circle"/><br/>';
						tag+= '</li>';
						tag+= '<li class="list-group-item border-0 col-8">';
						tag+= '<h6><b>' +vo.username.substring(0,1)+ 'O' + vo.username.substring(2)+ '</b>';
						
						tag+= '<span class="ml-2" style="font-size:0.7em">';
								if(vo.last_edit>525600){
									tag+= Math.floor(vo.last_edit/525600) +'년';
								} else if(vo.last_edit>43200){
									tag+= Math.floor(vo.last_edit/43200) +'달';
								} else if(vo.last_edit>1440){
									tag+= Math.floor(vo.last_edit/1440) +'일';
								} else if(vo.last_edit>60){
									tag+= Math.floor(vo.last_edit/60) +'시간';
								} else {
									tag+= Math.floor(vo.last_edit) +'분';
								}
								
						tag+= ' 전</span></h6>';
								
									
						tag+= '<h6 class="loc"><i class="fas fa-map-marker-alt"></i>'+vo.area1+'</h6>';
						tag+= '<h6><i class="fas fa-coins mr-1"></i>희망시급 : '+vo.desired_wage + '원 | <i class="fas fa-hands-helping"></i>협의유무: '+ vo.discussion+ '</h6>';
						tag += '<h6><i class="fas fa-child"></i>'+ vo.birth +'세 | ';
						if(vo.gender == 'F'){
							tag += '<i class="fas fa-venus"></i>여자';
							}
						else if (vo.gender == 'M'){
							tag+= '<i class="fas fa-mars"></i>남자';
							}
						tag += '</h6>';
						
						tag+= '</li>';
						tag += '<li class="list-group-item border-0 col-2">';
						tag += '<button class="shinchung btn btn-warning mb-3"  id="'+vo.userid+'">신청</button>';
						tag += '<button class="cBtn btn btn-warning"  id="'+vo.userid+'">협의</button>';
						tag += '</li>';
						tag+= '</ul>';
							
						if(vo.identi_status =="Y" || vo.license_status =="Y" || vo.school_status== "Y" || vo.crime_status=="Y"){
							tag += '<hr/>';
						}
						if(vo.identi_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">등초본</div>';
						} 
						if(vo.license_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">선생님</div>';
						} 
						if(vo.school_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">학교</div>';
						} 
						if(vo.crime_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">성범죄안심</div>';
						}
						tag += '<span class="trash"><i class="far fa-trash-alt float-right"></i></span>';
						tag += '</li></ul><br/>';
						
					} else if(vo.active=="N") {
						
						tag += '<ul class="list-group" id="'+vo.userid+'">';
						tag += '<li class="list-group-item">';
						tag += '<ul class="list-group list-group-horizontal">';
						tag += '<li class="list-group-item border-0 col-2">';
						tag += '<img src="img/profilepic.png" alt="'+vo.userid+'" class="rounded-circle"/><br/>';
						tag += '</li>';
						tag += '<li class="list-group-item border-0 col-10" style="color:gray">';
						tag += '<h6><b>비공개</b>';
						tag += '</h6>';
						tag += '<h6 class="loc"><i class="fas fa-map-marker-alt" style="color:gray"></i>'+vo.area1+'</h6>';
						tag += '<h6><i class="fas fa-coins mr-1" style="color:gray"></i>희망시급 : '+vo.desired_wage+'원 | <i class="fas fa-hands-helping" style="color:gray"></i>협의유무: '+vo.discussion+'</h6>';
						tag += '<h6><i class="fas fa-child" style="color:gray"></i>'+vo.birth+'세 | <i class="fas fa-baby-carriage" style="color:gray"></i>돌봄가능아이 : '+vo.headcount+'명</h6>';
						tag += '</li>';
						tag += '</ul>';
						tag += '<span class="trash"><i class="far fa-trash-alt float-right" style="color:gray"></i></span>';
						tag += '</li>';
						tag += '</ul><br/>';
					}//else		
					
					
					

					
					
				});//result
				
				$("#likeBox").html(tag);
			}, error:function(error){
				console.log("ajax 받기 에러-->" + error.responseText);
			}
		})
		
	});//찜
	
	//=============================활성화만 ========================//
		$(document).on("click", "#activeBox>span", function(){
			
			var active= $(this).attr("id");
			console.log(active);
			var url = "/dbmon/selectActive";
			var params ="active="+active;
			if(active=="allActive"){
				$(this).children("i").css("color", "orange");
				$(this).next("span").children("i").css("color", "gray");
			} else if(active=="onlyActive"){
				$(this).children("i").css("color", "orange");
				$(this).prev("span").children("i").css("color", "gray");
			}
			
			
			$.ajax({
				url:url,
				data:params,
				type:'GET',
				success:function(result){
					console.log("리턴="+result);
					var $result = $(result);
					var tag = "";
					
					$result.each(function(idx, vo){
						
					console.log("액티브"+vo);
					if(vo.active=="Y"){	
						tag += '<ul class="list-group" id="'+vo.userid+'">';
						tag += '<li class="list-group-item">';
						tag += '<ul class="list-group list-group-horizontal" style="cursor:pointer"  id="'+vo.nowPage +'"> ';
						tag += '<li class="list-group-item border-0 col-2">';
						tag += '<img src=';
						if(vo.pic==null){
							tag += '"img/profilepic.png"';
						}else if (vo.pic!=null){
							tag += '"upload/'+vo.pic+'"';
						}		
						
						tag+= ' class="rounded-circle"/><br/>';
						
						tag+= '</li>';
						tag+= '<li class="list-group-item border-0 col-8">';
						tag+= '<h6><b>' +vo.username.substring(0,1)+ 'O' + vo.username.substring(2)+ '</b>';
						
						tag+= '<span class="ml-2" style="font-size:0.7em">';
								if(vo.last_edit>525600){
									tag+= Math.floor(vo.last_edit/525600) +'년';
								} else if(vo.last_edit>43200){
									tag+= Math.floor(vo.last_edit/43200) +'달';
								} else if(vo.last_edit>1440){
									tag+= Math.floor(vo.last_edit/1440) +'일';
								} else if(vo.last_edit>60){
									tag+= Math.floor(vo.last_edit/60) +'시간';
								} else {
									tag+= Math.floor(vo.last_edit) +'분';
								}
								
						tag+= ' 전</span></h6>';
								
									
						tag+= '<h6 class="loc"><i class="fas fa-map-marker-alt"></i>'+vo.area1+'</h6>';
						tag+= '<h6><i class="fas fa-coins mr-1"></i>희망시급 : '+vo.desired_wage + '원 | <i class="fas fa-hands-helping"></i>협의유무: '+ vo.discussion+ '</h6>';
						tag += '<h6><i class="fas fa-child"></i>'+ vo.birth +'세 | ';
						if(vo.gender == 'F'){
							tag += '<i class="fas fa-venus"></i>여자';
							}
						else if (vo.gender == 'M'){
							tag+= '<i class="fas fa-mars"></i>남자';
							}
						tag += '</h6>';
												tag+= '</li>';
						tag += '<li class="list-group-item border-0 col-2">';
						tag += '<button class="shinchung btn btn-warning mb-3"  id="'+vo.userid+'">신청</button>';
						tag += '<button class="cBtn btn btn-warning" id="'+vo.userid+'">협의</button>';
						tag += '</li>';
						tag+= '</ul>';
							
						if(vo.identi_status =="Y" || vo.license_status =="Y" || vo.school_status== "Y" || vo.crime_status=="Y"){
							tag += '<hr/>';
						}
						if(vo.identi_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">등초본</div>';
						} 
						if(vo.license_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">선생님</div>';
						}
						if(vo.school_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">학교</div>';
						}
						if(vo.crime_status == "Y"){
							tag += '<div class="badge badge-pill badge-warning align-top mr-1">성범죄안심</div>';
						}
						tag += '<span class="trash"><i class="far fa-trash-alt float-right"></i></span>';
						tag += '</li></ul><br/>';
								
						
					} else if(vo.active=="N") {
						
						tag += '<ul class="list-group" id="'+vo.userid+'">';
						tag += '<li class="list-group-item">';
						tag += '<ul class="list-group list-group-horizontal" style="cursor:pointer" onclick="location.href="teacherView?userid=${vo.userid}"" >';
						tag += '<li class="list-group-item border-0 col-2">';
						tag += '<img src="img/profilepic.png" alt="'+vo.userid+'" class="rounded-circle"/><br/>';						tag += '</li>';
						tag += '<li class="list-group-item border-0 col-10" style="color:gray">';
						tag += '<h6><b>비공개</b>';
						tag += '</h6>';
						tag += '<h6 class="loc"><i class="fas fa-map-marker-alt" style="color:gray"></i>'+vo.area1+'</h6>';
						tag += '<h6><i class="fas fa-coins mr-1" style="color:gray"></i>희망시급 : '+vo.desired_wage+'원 | <i class="fas fa-hands-helping" style="color:gray"></i>협의유무: '+vo.discussion+'</h6>';
						tag += '<h6><i class="fas fa-child" style="color:gray"></i>'+vo.birth+'세 | <i class="fas fa-baby-carriage" style="color:gray"></i>돌봄가능아이 : '+vo.headcount+'명</h6>';
						tag += '</li>';
						tag += '</ul>';
						tag += '<span class="trash"><i class="far fa-trash-alt float-right" style="color:gray"></i></span>';
						tag += '</li>';
						tag += '</ul><br/>';
					}//else		
					});//result
					
					$("#likeBox").html(tag);
				}, error:function(){
					console.log("ajax실패");
				}
				
			})
			
		});
	
	
	
});//제이쿼리
</script>
</head>
<body>
<div id="top">
   <%@include file="/WEB-INF/views/top.jsp"%>
</div>
	<div class="container">
	<div id="title">
   		<div id="titlefont">찜한 돌봄몬</div>
	</div>
	<div id="activeBox" class="mb-3"><span id="allActive"><i class="fas fa-circle" ></i>전체</span> <span id="onlyActive"><i class="fas fa-circle" style="color:gray;"></i>구인중 일자리만</span>
		<div id="likeFilter" class="float-right" style="cursor:pointer; height:20px; overflow:hidden;">
		<select id="likeDropdown">
			<option value="last_edit">업데이트 순</option>
			<option value="certi_cnt">인증 수 순</option>
			<option value="wage_low">시급 낮은 순</option>
			<option value="wage_high">시급 높은 순</option>
		</select>
	</div>
	</div>
	
	
	<div id="likeBox">
	<c:forEach var="vo" items="${list}">
		<c:if test="${vo.active == 'Y'}">
		<ul class="list-group" id="${vo.userid}">
			<li class="list-group-item" >
				<ul class="list-group list-group-horizontal" style="cursor:pointer" id="${hvo.nowPage}">
					<li class="list-group-item border-0 col-2">
						<img src=<c:if test="${vo.pic==null}">"img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">"upload/${vo.pic}"</c:if> alt="${vo.userid}" class="rounded-circle"/><br/>
					</li>
					<li class="list-group-item border-0 col-8">
						<h6><b>${vo.username.substring(0,1)}O${vo.username.substring(2)}</b>
						<span class="ml-2" style="font-size:0.7em">
								<fmt:parseNumber integerOnly="true" var="edit_year" value="${vo.last_edit/525600}"/>
								<fmt:parseNumber integerOnly="true" var="edit_month" value="${vo.last_edit/43200}"/>
								<fmt:parseNumber integerOnly="true" var="edit_day" value="${vo.last_edit/1440}"/>
								<fmt:parseNumber integerOnly="true" var="edit_hour" value="${vo.last_edit/60}"/>					
							<c:choose>
								<c:when test="${vo.last_edit>525600}">${vo.last_edit/525600}년</c:when>
								<c:when test="${vo.last_edit>43200}">${edit_month}달</c:when>
								<c:when test="${vo.last_edit>1440}">${edit_day}일</c:when>
								<c:when test="${vo.last_edit>60}">${edit_hour}시간</c:when>
								<c:otherwise>${vo.last_edit}분</c:otherwise>
							</c:choose> 전
						</span>
						</h6>
						<h6 class="loc"><i class="fas fa-map-marker-alt"></i>${vo.area1}</h6>
						<h6><i class="fas fa-coins mr-1"></i>희망시급 : ${vo.desired_wage}원 | <i class="fas fa-hands-helping"></i>협의유무: ${vo.discussion}</h6>
						<h6><i class="fas fa-child"></i>${vo.birth}세 | <c:if test="${vo.gender=='F'}"><i class="fas fa-venus"></i>여자</c:if>
						<c:if test="${vo.gender == 'M' }"><i class="fas fa-mars"></i>남자</c:if></h6>						
					</li>
					<li class="list-group-item border-0 col-2">
						<button class="shinchung btn btn-warning mb-3" id=${vo.userid}>신청</button>
						<button class="cBtn btn btn-warning" id="'+vo.userid+'">협의</button>
					</li>
				</ul>
		
			
	<!--스케쥴api가 완성되고 요일 데이터를 집어넣을 경우! 아니면 그냥 인증정보 표시
		<div class="float-left">
				단기 - 12 동안
		</div>
		<c:forEach var="day" items="월, 화, 수, 목, 금, 토, 일">
			<div class="badge badge-warning badge-round">${day}</div>
		</c:forEach>
		-->
				<c:if test="${vo.identi_status =='Y' || vo.license_status == 'Y' || vo.school_status == 'Y' || vo.crime_status == 'Y'}">
				<hr/>
				</c:if>
				<c:if test="${vo.identi_status == 'Y' }"><div class="badge badge-pill badge-warning align-top mr-1">등초본</div></c:if>
				<c:if test="${vo.license_status == 'Y'}"><div class="badge badge-pill badge-warning align-top mr-1">선생님</div></c:if>
				<c:if test="${vo.school_status == 'Y'}"><div class="badge badge-pill badge-warning align-top mr-1">학교</div></c:if>
				<c:if test="${vo.crime_status == 'Y'}"><div class="badge badge-pill badge-warning align-top mr-1">성범죄안심</div></c:if>
		
		<span class="trash"><i class="far fa-trash-alt float-right"></i></span>
		</li>
	</ul>
	<br/>
	</c:if>
	<!-- ---------------비활성화된 회원-------------- -->
	<c:if test="${vo.active == 'N'}">
		<ul class="list-group" id="${vo.userid}">
			<li class="list-group-item">
				<ul class="list-group list-group-horizontal" >
					<li class="list-group-item border-0 col-2">
						<img src="img/profilepic.png" alt="${vo.userid}" class="rounded-circle"/><br/>
						<div class="badge badge-secondary badge-pill ml-3" > 비공개</div>
					</li>
					<li class="list-group-item border-0 col-10" style="color:gray">
						<h6><b>비공개</b>
						</h6>
						<h6 class="loc"><i class="fas fa-map-marker-alt" style="color:gray"></i>${vo.area1}</h6>
						<h6><i class="fas fa-coins mr-1" style="color:gray"></i>희망시급 : ${vo.desired_wage}원 | <i class="fas fa-hands-helping" style="color:gray"></i>협의유무: ${vo.discussion}</h6>
						<h6><i class="fas fa-child" style="color:gray"></i>${vo.birth}세 | <i class="fas fa-baby-carriage" style="color:gray"></i>돌봄가능아이 : ${vo.headcount}명</h6>
					</li>
				</ul>
		<span class="trash"><i class="far fa-trash-alt float-right" style="color:gray"></i></span>
		</li>
	</ul>
	<br/>
	</c:if>
	</c:forEach>
	
	</div><!-- likeBox -->
	
	
	
	<!------------------------------- 페이징 ------------------------>
	<nav id="heartPaging" aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<li class="page-item">
				<!-- 이전페이지 -->
				<c:if test="${vo.nowPage>1}">
				<a class="page-link" tabindex="-1" aria-disabled="true" href="/dbmon/parentHeart?nowPage=${vo.nowPage-1}" style="color:gray" aria-label="Previous">
				<span aria-hidden="true">&laquo;</span></a>
				</c:if>
			</li>
			<c:forEach var="p" begin="${vo.startPageNum}" end="${vo.startPageNum+ vo.onePageNumCount -1}">
				<c:if test="${p<=vo.totalPage}">
				<li	class="page-item">
					<a class="page-link" href="/dbmon/parentHeart?nowPage=${p}" style="color:gray"><span <c:if test="${p == vo.nowPage}" >style="color:orange;"</c:if> >${p}</span></a>
				</li>
				</c:if>
			</c:forEach>			
			<li class="page-item">
				<!-- 다음페이지 -->
				<c:if test="${vo.nowPage < vo.totalPage}">
				<a class="page-link" href="/dbmon/parentHeart?nowPage=${vo.nowPage+1}" style="color:gray"><span aria-hidden="true">&raquo;</span></a>
				</c:if>
			</li>
		</ul>
	</nav>	
	<br/>
	</div><!-- Container -->	
</body>
</html>
<jsp:include page="../footer.jsp"/>