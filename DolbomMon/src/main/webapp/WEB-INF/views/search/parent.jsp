<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>
		
	.container{
		width:1100px;
		font-family: 'Jua', sans-serif;
	}
	
	img{ height:110px; width:110px;}

	.review_rate {
	    display: flex;
	    font-size: 12px;
	    font-weight: 500;
	    text-align: left;
	    color: white;
	}
	#map{
		width: 100%;
		height: 500px;
		border-bottom-left-radius: 20px;
		border-bottom-right-radius: 20px;
	}
	
	<!-- -->
	
	.imgBox{
		float:left;
		padding: 5px;
		height: 150px;
		position: absolute;
		top: 30px;
	}
	.offerBox{
		float:right;
		width: 310px;
		padding: 3px;
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}
	.offerTitle{
		font-size: 1.1em;
	}
	.card {
	width:44.5%;
	display:block;
	float:left;
	margin:20px 20px;
	border:1px orange solid; 
	border-radius:20px; 
	}
	.card-body{
		white-space: nowrap;
		overflow:hidden;
		text-overflow:ellipsis;
	}

	#btnBox{
		margin-top:0;
		width: 100%;
		white-space: nowrap;
		display: inline-block;
		vertical-align: top;
		text-align:center;
		margin-left:5px;
	}
	.modalHidden{
		width: 100%;
		height: 100%;
		color: black;
		position: absolute;
		text-align: center;
		line-height: 280px;
		font-size: 1.8em;
		color: white;
		z-index: 100;
		background-color: rgb(100,100,100);
		border:1px orange solid; 
		border-radius:20px; 
	}

	.card-footer{
	border-bottom-radius:20px;
	}
</style>
<script>
var tabType=1;
var count = 12;
var activity_type;
var care_type = 'all';
var order;
var value;


$(function(){
	
    //countTest
    $(document).on("click", "#countTest", function(){
    	count= count+6;
    	if(tabType==1){
    		dropdownAjax(care_type)
    	}else if(tabType==2){
    		dropdownAjax(care_type)
    	}else if(tabType==3){
    		actBoxAjax(activity_type)
    	}else if(tabType==4){
    		orderDropdownAjax(order)
    	}
    });
	
    $(document).on("click", ".locBtn", function(){
    	//console.log($(this).parent().attr('id'));
    	location.href="parentView?no="+$(this).attr('id');

    });
	
	//지도 토글
    $(document).on("click", "#mapBtn", function(){
			$("#map").toggle();
			AOS.init({
			    duration: 1200
			  });
			  onElementHeightChange(document.body, function(){
			    AOS.refresh();
			  });
			
	});
	
  	//검색창	
    $(document).on("keyup", "#locFilter", function(){
    	
    	var value = $(this).val().toLowerCase();
    	console.log(value)
    	$(".loc").filter(function(){
    		$(this).parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value)>-1);	   
    		AOS.init({
			    duration: 1200
			  });
			  onElementHeightChange(document.body, function(){
			    AOS.refresh();
			  });
    	});
    });
	
	
	//필터
	$(document).on("click", ".actBtnClass", function(){
    	activity_type = $(this).parent().text();
    	console.log("돌봄유형 =>" + activity_type.trim()+"dsf");
    	actBoxAjax(activity_type.trim());
	});//ajax
	
	function actBoxAjax(activity_type){
		    var url = "/dbmon/careAct";
			var params = {
					activity_type:activity_type,
					count:count 
			} 
			console.log("파람="+params);
			$.ajax({
				url: url,
				data: params,
				type: 'GET',
				success: function(result){
		            console.log("갯수="+result.length);
		        //    $("#Tcnt").text(result.length);
		            var $result = $(result);
		            var tag = "";
		               
		            $result.each(function(idx, vo){
		               tag += '<div class="card" data-aos="fade-up" >';
		               if(vo.status=="P"){
		                  tag += '<div class="modalHidden"><div class="offerConclude">구인이 종료된 공고입니다</div></div>';
		               }
		               tag += '<div class="card-body">';
		               tag += '<div class="imgBox"><img src=';
		               if(vo.pic==null){
		                  tag +='"img/profilepic.png"';
		               } else {
		                  tag +='"upload/' +vo.pic+ '"';
		               }
		               tag += 'class="rounded-circle"></div>';
		               tag += '<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 48px;"><span>';
		               tag += vo.tcnt+'명 지원</div>';
		               tag += '<div class="offerBox">';
		               tag += '<span class="card-title offerTitle" style="line-height: 2em;"><b>'+vo.title+'</b></span>';
		               tag += '<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. '+vo.job_board_no +' | '+ vo.userid+'</span><br/>';
		               var cb = vo.child_birth;
						
						////////////////////자녀 정보 /////////////////////
						var cbArr = cb.split(",");
						for(var i=0; i<cbArr.length;i++){
							console.log("cbArr => " + cbArr[i]);
							var childYMD = cbArr[i].split("-");
							var child_birth = childYMD[0] + "," + childYMD[1] + "," +childYMD[2];
							console.log("child_birth => " + child_birth);
							var childInfo = getAge(child_birth);
							
							tag += '<div style="float:left; margin-right:5px;"><span style="color:orange;">'+childInfo+'</span></div>';
						}
		               tag += ' | ';
		               tag += '<span class="ml-2" style="font-size:0.7em">';
		               if(vo.writedate>525600){
		                  tag += Math.round(vo.writedate/525600)+'년';
		               } else if(vo.writedate>43200){
		                  tag += Math.round(vo.writedate/43200) +'달';
		               } else if(vo.writedate>1440){
		                  tag += Math.round(vo.writedate/1440) +'일';
		               } else if(vo.writedate>60){
		                  tag += Math.round(vo.writedate/60) +'시간';
		               } else {
		                  tag += Math.round(vo.writedate) +'분';
		               }
		               tag += '</span><br/>';
		               tag += '<span class="loc"><i class="fas fa-map-marker-alt"></i>'+vo.care_addr+'</span><br/>';
		               var startDate = vo.start_date;
		               console.log("start_date => " + startDate);
		               if(startDate!=null){
		                	tag += '<span><b>'+startDate+'</b> 시작</span><br/>';
		               }else{
		            	   tag += '<span>특정일 시작</span><br/>';
		               }
		               tag += '<span style="color: orange;">희망시급 '+vo.wish_wage+'원';
		               if(vo.consultation=="Y"){
		                  tag += ' | <b>협의가능</b></span></p>';
		               }else{
		                  tag += '</span></p>';
		               }
		               tag += '</div></div>';
		               tag += '<div class="card-footer btn locBtn" style="width: 100%;"  id="'+vo.job_board_no+'" >자세히 보기</div>';   
		               tag += '</div>';
		               tag += '</div>';
		            });
		            tag += "";
		            $("#cardBox").html(tag);   
		         }, error: function(){
					console.log("리스트 받기 에러");
				}
			});		
	}
	    
	//select
	$(document).on("change", "#selectType", function(){
		count=12;
		tabType=2;
		care_type = $(this).val().trim();
		console.log("test"+care_type);
		dropdownAjax(care_type)
	});//ajax
	function dropdownAjax(care_type){
		console.log("케어타입="+care_type);
		var url2 = "/dbmon/careSelect";
		var params2 = {
				care_type:care_type,
				count:count 
		} 
		console.log("파라미터="+params2);
		$.ajax({
			url:url2,
			data:params2,
			type:'GET',
			success:function(result){
	        //    $("#Tcnt").text(result.length);

	             var $result = $(result);
	            var tag = "";
	               
	            $result.each(function(idx, vo){
	               tag += '<div class="card" data-aos="fade-up"  id="'+vo.job_board_no+'" >';
	               if(vo.status=="P"){
	                  tag += '<div class="modalHidden"><div class="offerConclude">구인이 종료된 공고입니다</div></div>';
	               }
	               tag += '<div class="card-body">';
	               tag += '<div class="imgBox"><img src=';
	               if(vo.pic==null){
	                  tag +='"img/profilepic.png"';
	               } else {
	                  tag +='"upload/' +vo.pic+ '"';
	               }
	               tag += 'class="rounded-circle"></div>';
	               tag += '<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 48px;"><span>';
	               tag += vo.tcnt+'명 지원</div>';
	               tag += '<div class="offerBox">';
	               tag += '<span class="card-title offerTitle" style="line-height: 2em;"><b>'+vo.title+'</b></span>';
	               tag += '<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. '+vo.job_board_no +' | '+ vo.userid+'</span><br/>';
	               var cb = vo.child_birth;
					
					////////////////////자녀 정보 /////////////////////
					var cbArr = cb.split(",");
					for(var i=0; i<cbArr.length;i++){
						console.log("cbArr => " + cbArr[i]);
						var childYMD = cbArr[i].split("-");
						var child_birth = childYMD[0] + "," + childYMD[1] + "," +childYMD[2];
						console.log("child_birth => " + child_birth);
						var childInfo = getAge(child_birth);
						
						tag += '<div style="float:left; margin-right:5px;"><b style="color:orange;">'+childInfo+'</b></div>';
					}
	               tag += ' | ';
	               if(vo.writedate>525600){
	                  tag += Math.round(vo.writedate/525600)+'년 전';
	               } else if(vo.writedate>43200){
	                  tag += Math.round(vo.writedate/43200) +'달 전';
	               } else if(vo.writedate>1440){
	                  tag += Math.round(vo.writedate/1440) +'일 전';
	               } else if(vo.writedate>60){
	                  tag += Math.round(vo.writedate/60) +'시간 전';
	               } else {
	                  tag += Math.round(vo.writedate) +'분 전';
	               }
	               tag += '<span class="ml-2" style="font-size:0.7em">';
	               if(vo.writedate>525600){
	                  tag += Math.round(vo.writedate/525600)+'년';
	               } else if(vo.writedate>43200){
	                  tag += Math.round(vo.writedate/43200) +'달';
	               } else if(vo.writedate>1440){
	                  tag += Math.round(vo.writedate/1440) +'일';
	               } else if(vo.writedate>60){
	                  tag += Math.round(vo.writedate/60) +'시간';
	               } else {
	                  tag += Math.round(vo.writedate) +'분';
	               }
	               tag += '</span><br/>';
	               tag += '<span class="loc"><i class="fas fa-map-marker-alt"></i>'+vo.care_addr+'</span><br/>';
	               var startDate = vo.start_date;
	               console.log("start_date => " + startDate);
	               if(startDate!=null){
	                	tag += '<span><b>'+startDate+'</b> 시작</span><br/>';
	               }else{
	            	   tag += '<span>특정일 시작</span><br/>';
	               }
	               tag += '<span style="color: orange;">희망시급 '+vo.wish_wage+'원';
	               if(vo.consultation=="Y"){
	                  tag += ' | <b>협의가능</b></span></p>';
	               }else{
	                  tag += '</span></p>';
	               }
	               tag += '</div></div>';
	               tag += '<div class="card-footer btn locBtn" style="width: 100%;"  id="'+vo.job_board_no+'" >자세히 보기</div>';   
	               tag += '</div>';
	               tag += '</div>';
	            });
	               tag += "";
	               $("#cardBox").html(tag);   
	         }, error: function(){
				console.log("리스트 받기 에러");
			}
		});		
	}
	
	
	//====================정렬 필터=========================
	
	$(document).on("change", "#selectArray", function(){
		count=12;
		tabType=4;
		order = $(this).val();
		orderDropdownAjax(order)
	 });//ajax
	 
	 function orderDropdownAjax(order){
					
			var url = "/dbmon/filterArray";
			var params = {
					order:order,
					count:count 
			}
				
			console.log("파라미터="+params);
			$.ajax({
				url: url,
				data: params,
				type: 'GET',
				success: function(result){
		               
		            var $result = $(result);
		            var tag = "";
		                                 
		            $result.each(function(idx, vo){
		               tag += '<div class="card" data-aos="fade-up"  id="'+vo.job_board_no+'" >';
		               if(vo.status=="P"){
		                  tag += '<div class="modalHidden"><div class="offerConclude">구인이 종료된 공고입니다</div></div>';
		               }
		               tag += '<div class="card-body">';
		               tag += '<div class="imgBox"><img src=';
		               if(vo.pic==null){
		                  tag +='"img/profilepic.png"';
		               } else {
		                  tag +='"upload/' +vo.pic+ '"';
		               }
		               tag += 'class="rounded-circle"></div>';
		               tag += '<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 48px;"><span>';
		               tag += vo.tcnt+'명 지원</div>';
		               tag += '<div class="offerBox">';
		               tag += '<span class="card-title offerTitle" style="line-height: 2em;"><b>'+vo.title+'</b></span>';
		               tag += '<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. '+vo.job_board_no +' | '+ vo.userid+'</span><br/>';
		                var cb = vo.child_birth;
						
						////////////////////자녀 정보 /////////////////////
						var cbArr = cb.split(",");
						for(var i=0; i<cbArr.length;i++){
							console.log("cbArr => " + cbArr[i]);
							var childYMD = cbArr[i].split("-");
							var child_birth = childYMD[0] + "," + childYMD[1] + "," +childYMD[2];
							console.log("child_birth => " + child_birth);
							var childInfo = getAge(child_birth);
							
							tag += '<div style="float:left; margin-right:5px;"><b style="color:orange;">'+childInfo+'</b></div>';
						}
		               tag += ' | ';
		               tag += '<span class="ml-2" style="font-size:0.7em">';
		               if(vo.writedate>525600){
		                  tag += Math.round(vo.writedate/525600)+'년 전';
		               } else if(vo.writedate>43200){
		                  tag += Math.round(vo.writedate/43200) +'달 전';
		               } else if(vo.writedate>1440){
		                  tag += Math.round(vo.writedate/1440) +'일 전';
		               } else if(vo.writedate>60){
		                  tag += Math.round(vo.writedate/60) +'시간 전';
		               } else {
		                  tag += Math.round(vo.writedate) +'분 전';
		               }
		               tag += '</span><br/>';
		               tag += '<span class="loc"><i class="fas fa-map-marker-alt"></i>'+vo.care_addr+'</span><br/>';
		               var startDate = vo.start_date;
		               if(startDate!=null){
		                	tag += '<span><b>'+startDate+'</b> 시작</span><br/>';
		               }else{
		            	   tag += '<span>특정일 시작</span><br/>';
		               }
		               tag += '<span style="color: orange;">희망시급 '+vo.wish_wage+'원';
		               if(vo.consultation=="Y"){
		                  tag += ' | <b>협의가능</b></span></p>';
		               }else{
		                  tag += '</span></p>';
		               }
		               tag += '</div></div>';
		               tag += '<div class="card-footer btn locBtn" style="width: 100%;" id="'+vo.job_board_no+'" >자세히 보기</div>';   
		               tag += '</div>';
		               tag += '</div>';
		            });
		            tag += "";
		            $("#cardBox").html(tag);
		               
		         },
				error:function(error){
					console.log("리스트 받기 에러-->"+ error.responseText);
				}
			});
	 }
	 dropdownAjax(care_type);
});


function getAge(a){
	var today = new Date();
	var birthDay = new Date(a);
	var child_age1;
	var child_age2;
	var time = Math.floor((today - birthDay) / 86400000);
	var year = Math.floor(time/365)+1;
	var month = Math.ceil(time/30);
	if(month >= 96 && year < 14){
		console.log("초딩"+year+"세");
		child_age2 = "초등학생";
		child_age1 = year+"세";
		return child_age2 + child_age1;
	}else if(month<96 && month>=37){
		console.log("유아"+year+"세");
		child_age2 = "유아";
		child_age1 = year+"세";
		return child_age2 + child_age1;
	}else if(month<=36 && month>=7){
		console.log("영아"+month+"개월");
		child_age2 = "영아";
		child_age1 = month + "개월";
		return child_age2 + child_age1;
	}else{
		console.log("신생아"+month+"개월");
		child_age2 = "신생아";
		child_age1 = month + "개월";
		return child_age2 + child_age1;
	}
}

function mapResize(){
	$("#map").css("display","none");
	AOS.init({
	    duration: 1200
	  });
	  onElementHeightChange(document.body, function(){
	    AOS.refresh();
	  });
}

	function onElementHeightChange(elm, callback) {
	    var lastHeight = elm.clientHeight
	    var newHeight;
	    
	    (function run() {
	        newHeight = elm.clientHeight;      
	        if (lastHeight !== newHeight) callback();
	        lastHeight = newHeight;

	        if (elm.onElementHeightChangeTimer) {
	          clearTimeout(elm.onElementHeightChangeTimer); 
	        }

	        elm.onElementHeightChangeTimer = setTimeout(run, 200);
	    });
	  }
	
	
	
</script>






<body onload="mapResize()">
<!-- -------------------상단메뉴------------- -->
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
</div>
<!-- ------------------------------------------ -->
<div class="container" >
<div>
	<button type="button" id="mapBtn" class="btn btn-warning btn-lg btn-block" style="width: 100%; margin-bottom: -20px;">가까운 일자리 찾기</button><br/>
	<div id="map">
	</div>
</div>
<div id="filterbox">
	<input type="text" class="form-control border-warning mt-2" id="locFilter" placeholder="#돌봄 지역을 입력해주세요">
	<form class="form-inline">
	
	<select class="custom-select border-warning mt-2" id="selectType" style="width: 100%;">
	<option selected>돌봄 유형을 선택하시면, 맞춤 일자리를 보여드려요</option>
	<option value="정기돌봄">2~10세 정기 돌봄</option>
	<option value="신생아/영아">신생아/영아 정기 돌봄</option>
	<option value="긴급">긴급 돌봄</option>
	<option value="all">모든 돌봄 유형 보기</option>
	</select>
	</form>
</div>
	<div id="btnBox" class="btn-group btn-group-toggle" data-toggle="buttons">
	  
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options"  data-toggle="button" autocomplete="off"  id="act1"  class="actBtnClass"/>실내놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>등하원돕기
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>책읽기
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>야외활동
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>한글놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>영어놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>학습지도
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>체육놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>간단청소
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>밥챙겨주기
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>간단설거지
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>장기입주
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>단기입주
	  </label>
	
  </div>
 <!-- ------------------------------------ -->
	<div class="d-inline-block m-2" style="width:100%;">
		<div class="float-left" > 총 <span id="Tcnt">${totalRecords}</span>건의 일자리</div>
		
		<div id="orderFilter" class="float-right" style="cursor:pointer; height:20px; overflow:hidden; border:none;">
			<select id="selectArray" >
			    <option selected value="new">최신순</option>
			    <option value="wage_high">높은 시급순</option>
			    <option value="wage_low">낮은 시급순</option>
			</select>
		</div>
	</div>
	
<!-- ------------------------------------ -->
	<div id="cardBox" class="d-inline-block" style="width:100%; min-height:700px; margin-left:20px;">
		<c:forEach var="vo" items="${list2}">
			
				<div class="card" data-aos="fade-up">
					<c:if test="${vo.status=='P'}">
						<div class="modalHidden"><div class="offerConclude">구인이 종료된 공고입니다</div></div>
					</c:if>
					
					<div class="card-body">
						<div class="imgBox"><img src=<c:if test="${vo.pic==null}">"img/profilepic.png"</c:if><c:if test="${vo.pic!=null}">"upload/${vo.pic}"</c:if> class="rounded-circle"></div>
						<div class="badge badge-warning badge-pill ml-1" style="position: absolute; top: 170px; left: 48px;"><span>${vo.tcnt}</span>명 지원</div>
						<div class="offerBox">
							<span class="card-title offerTitle" style="line-height: 2em;"><b>제목 ${vo.title}</b></span>
							<p class="card-text" style="line-height: 1.8em;"><span style="color: gray;">no. ${vo.job_board_no} | ${vo.userid}</span><br/>
								<span><b>신생아 1명,2 유아 1명</b></span> | 
								<!-- 마지막 업데이트일 -->
								<span class="ml-2" style="font-size:0.7em">
										<fmt:parseNumber integerOnly="true" var="edit_year" value="${vo.writedate/525600}"/>
										<fmt:parseNumber integerOnly="true" var="edit_month" value="${vo.writedate/43200}"/>
										<fmt:parseNumber integerOnly="true" var="edit_day" value="${vo.writedate/1440}"/>
										<fmt:parseNumber integerOnly="true" var="edit_hour" value="${vo.writedate/60}"/>					
									<c:choose>
										<c:when test="${vo.writedate>525600}">${edit_year}년</c:when>
										<c:when test="${vo.writedate>43200}">${edit_month}달</c:when>
										<c:when test="${vo.writedate>1440}">${edit_day}일</c:when>
										<c:when test="${vo.writedate>60}">${edit_hour}시간</c:when>
										<c:otherwise>${vo.writedate}분</c:otherwise>
									</c:choose> 전
								</span><br/>
								<span class="loc"><i class="fas fa-map-marker-alt"></i>${vo.care_addr}</span><br/>
								<span><b>${vo.start_date}</b> 시작</span><br/>
								<span style="color: orange;">희망시급 ${vo.wish_wage}원
								<c:if test="${vo.consultation=='Y'}"> | <b>협의가능</b></c:if></span>
							</p>
						</div>
					</div>
					<div class="card-footer btn" style="width: 100%;" onclick="location.href='parentView?no=${vo.job_board_no}'">자세히 보기</div>
				</div>
			
		</c:forEach>
	</div>
	
	
	<div><button style="position:relative; width:250px; left:38%; font-size:2em; margin-top:50px; margin-bottom:50px;" class="btn btn-warning" id="countTest">더보기</button></div>
</div></div>
<!-- ================================지도======================================== -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d236a21d1724aae6ae65ed16423e6d4f"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
	    mapOption = { 
	        center: new kakao.maps.LatLng("${mvo.lat}", "${mvo.lng}"), // 지도의 중심좌표
	        level: 8 // 지도의 확대 레벨
	    };
	
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	 
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions = [
		<c:forEach var="vo" items="${hash}">
	    {
	        content: '<div style="padding:5px;">${vo.username.substring(0,1)}O${vo.username.substring(2)}<br/></div>', 
	        latlng: new kakao.maps.LatLng("${vo.lat}", "${vo.lng}")
	    },
	    </c:forEach>
	];
	
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
	    
	for (var i = 0; i < positions.length; i ++) {
	    
	    // 마커 이미지의 이미지 크기 입니다
	    var imageSize = new kakao.maps.Size(24, 35); 
	    
	    // 마커 이미지를 생성합니다    
	    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    
	    // 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: positions[i].latlng, // 마커를 표시할 위치
	        //title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image : markerImage // 마커 이미지 
	    });
	
	  //  var iwContent = '<div style="padding:5px;">Hello World! <br><a href="https://map.kakao.com/link/map/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">큰지도보기</a> <a href="https://map.kakao.com/link/to/Hello World!,33.450701,126.570667" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	
		// 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
		    content : positions[i].content 
		});
		  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	//infowindow.open(map, marker); 
	
	
	
	// 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
	// 이벤트 리스너로는 클로저를 만들어 등록합니다 
	// for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
	kakao.maps.event.addListener(marker, 'click', makeOverListener(map, marker, infowindow));
	kakao.maps.event.addListener(map, 'click', makeOutListener(infowindow));
	}//for문
	
	//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	function makeOverListener(map, marker, infowindow) {
		return function() {
		    infowindow.open(map, marker);
		};
	}
	
	//인포윈도우를 닫는 클로저를 만드는 함수입니다 
	function makeOutListener(infowindow) {
		return function() {
		    infowindow.close();
		};
	}

</script>


<script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 1000
    });
</script>
</body>
</html>
<jsp:include page="../footer.jsp"/>