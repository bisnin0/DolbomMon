<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
<link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

<style>


	.container{width:1100px;font-family: 'Jua', sans-serif;}



	img{ height:110px; width:110px;}

	
	<!-- 액션 캡슐 버튼 -->
	#actBox{
	width: 100%; 
	white-space: nowrap; 
  	display: inline-block; 
  	vertical-align: top;
  	text-align:center;
  	font-family: 'Jua', sans-serif;
  	
  	}


	 input[type=text]{
	  width:100%;
	 }
	 
	#map{
	width:100%;
	height:500px;
	border-bottom-left-radius:20px;
	border-bottom-right-radius:20px;
	
	}
	
	.card>.profilepic {
	width:99%; 
	height:300px;
	border-top-left-radius:20px; 
	border-top-right-radius:20px;
	cursor:pointer;
	}
	
	.card{
	margin: 20px 17px; 
	width:30%; 
	height: 500px;
	border:1px orange solid; 
	border-radius:20px; 
	float:left; 
	display:block;
	font-family: 'Jua', sans-serif;
	cursor:pointer;
	}
	.iconColor i{
	color:orange;
	}

	#orderDropdown {
	border:none;
	
	}
	.emptyHeart{
	cursor:pointer;
	height:30px;
	width:30px;
	float:right;
	}
	.loc{
	white-space:nowrap;
	text-overflow:ellipsis;
	overflow:hidden;
	}
	
</style>

<script>
var tabType=1;
var count = 12;
var gender = 'all';
var activity_type;
var care_type;
var order;
var value;

	$(function(){
		

	    //countTest
	    $(document).on("click", "#countTest", function(){
	    	count= count+6;
	    	if(tabType==1){
	    		testAjax(gender)
	    	}else if(tabType==2){
	    		dropdownAjax(care_type)
	    	}else if(tabType==3){
	    		actBoxAjax(activity_type)
	    	}else if(tabType==4){
	    		orderDropdownAjax(order)
	    	}
	    });
	    //프로필 들어가기
	    $(document).on("click", ".card", function(){
	    	//console.log($(this).parent().attr('id'));
	    	location.href="teacherView?userid="+$(this).attr('id');

	    });
	    /*
		$(document).on("click", ".card-title>b", function(){
			location.href="teacherView?userid="+$(this).parent().parent().parent('div').attr('id');
		})
	   */
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
	    	value = $(this).val().toLowerCase();
	    	//$(".loc").filter(function(){
	    	//	$(this).parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value)>-1);
	    			//		console.log($(this).parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value)>-1));
				    //		console.log($(this).text().toLowerCase().indexOf(value)>-1);
			//	    console.log($(this));
	    	//});
	    	//console.log(value)
	    	searchWord(value)
	    });
		
		function searchWord(value){
	    	$(".loc").filter(function(){
	    		$(this).parent().parent().parent().toggle($(this).text().toLowerCase().indexOf(value)>-1);
	    		console.log(value);
	    	});
		}
		
		//스크롤
		$(window).scroll(function(){
			
			
			var scrolltop = $(document).scrollTop();//스크롤 위치
			var height = $(document).height(); //문서길이
			var height_win = $(window).height(); //보여지는 창의 길이
			
			if(Math.round($(window).scrollTop()) == $(document).height() - $(window).height()){
				for(i=0; i<15; i++){
					$("#cardBox").append();
				}
			}
			
		});
	    
		//========================ajax=========for selectbox=================
		

		$(document).on("change", "#dropdownCT", function(){
			count=12;
			tabType=2;
			care_type = $(this).val();
			if(care_type=='all'){
				gender='all';
				tabType=1;
			}
			dropdownAjax(care_type)

   	 	});//ajax
		function dropdownAjax(care_type){
   	 		
			console.log("케어타입="+care_type);
			var url = "/dbmon/searchCare";

			var params =	{
					care_type:care_type,
					count:count, 
			} 
			

			console.log("파라미터="+params);
			$.ajax({
				url:url,
				data:params,
				type:'GET',
				success:function(result){
					
				//	$("#Tcnt").text(result.length);

						var $result = $(result);
					var tag = "";
					
					$result.each(function(idx, vo){
					
						tag += '<div class="card" data-aos="fade-up" id="'+vo.userid+'" >';
						tag += '<img class="profilepic" src=';
						if(vo.pic==null){
							tag +='"img/profilepic.png"';
						} else {
							tag +='"upload/' +vo.pic+ '"';
						}
						tag += '/><br/>';
						tag += '<div class="card-body">';
							tag += '<h5 class="card-title"><b>' + vo.username.substring(0,1)+'O'+vo.username.substring(2)+'</b>';
							
							tag += '<span class="ml-2" style="font-size:0.7em">';
							if(vo.last_edit>525600){
								tag += Math.round(vo.last_edit/525600)+'년';
							} else if(vo.last_edit>43200){
								tag += Math.round(vo.last_edit/43200) +'달';
							} else if(vo.last_edit>1440){
								tag += Math.round(vo.last_edit/1440) +'일';
							} else if(vo.last_edit>60){
								tag += Math.round(vo.last_edit/60) +'시간';
							} else {
								tag += Math.round(vo.last_edit) +'분';
							}
							tag += ' 전</span>';
							tag += '<span class="emptyHeart">';
							tag += '<input type="hidden" value="'+ vo.userid +'" />';
							tag += '<i class="fab fa-gratipay" style=';
							if(vo.userid!=vo.cardid){
								tag += '"color:gray"';
							} else if(vo.userid == vo.cardid){
								tag += '"color:orange"';
							}
							tag += '></i>';
							tag += '</span>';
							tag += '</h5>';
										
							tag += '<span class="iconColor">';
							tag += '<h6 class="loc"><i class="fas fa-map-marker-alt"></i>'+ vo.area1 +'</h6>';
							tag += '<h6><i class="fas fa-coins mr-1"></i>희망시급 : '+ vo.desired_wage +'원 | <i class="fas fa-hands-helping"></i>협의유무: '+ vo.discussion +'</h6>';
							tag += '<h6><i class="fas fa-child"></i>'+ vo.birth +'세 ';
							if(vo.gender == 'F'){
								tag += '여자';
								}
							else if (vo.gender == 'M'){
								tag+= '남자';
								}
							tag += '</h6></span>';
							
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
		
		//========================ajax=========for buttons=================
		$("#link_button").unbind('click');
	    $(document).on("click", ".actBtnClass", function(){
	    	count=12;
	    	tabType=3;
	    	activity_type = $(this).parent().text().trim();
	    	
	    	actBoxAjax(activity_type);
	    });//ajax
			function actBoxAjax(activity_type){
				console.log(activity_type);
		    	var url = "/dbmon/searchAct";
				var params ={
						activity_type:activity_type,
						count:count, 
				} 
				console.log("파람="+params[0] + "파람="+params[1]);
				$.ajax({
					url:url,
					data:params,
					type:'GET',
					success:function(result){
						console.log("갯수="+result.length);
						//$("#Tcnt").text(result.length);
						var $result = $(result);
						var tag = "";
						
						$result.each(function(idx, vo){
							
							tag += '<div class="card" data-aos="fade-up" id="'+vo.userid+'" >';
							tag += '<img class="profilepic" src=';
							if(vo.pic==null){
								tag +='"img/profilepic.png"';
							} else {
								tag +='"upload/' +vo.pic+ '"';
							}
							tag += '/><br/>';
							tag += '<div class="card-body">';
								tag += '<h5 class="card-title"><b>' + vo.username.substring(0,1)+'O'+vo.username.substring(2)+'</b>';
								
								tag += '<span class="ml-2" style="font-size:0.7em">';
								if(vo.last_edit>525600){
									tag += Math.round(vo.last_edit/525600)+'년';
								} else if(vo.last_edit>43200){
									tag += Math.round(vo.last_edit/43200) +'달';
								} else if(vo.last_edit>1440){
									tag += Math.round(vo.last_edit/1440) +'일';
								} else if(vo.last_edit>60){
									tag += Math.round(vo.last_edit/60) +'시간';
								} else {
									tag += Math.round(vo.last_edit) +'분';
								}
								tag += ' 전</span>';
								tag += '<span class="emptyHeart">';
								tag += '<input type="hidden" value="'+ vo.userid +'" />';
								tag += '<i class="fab fa-gratipay" style=';
								if(vo.userid!=vo.cardid){
									tag += '"color:gray"';
								} else if(vo.userid == vo.cardid){
									tag += '"color:orange"';
								}
								tag += '></i>';
								tag += '</span>';
								tag += '</h5>';
											
								tag += '<span class="iconColor">';
								tag += '<h6 class="loc"><i class="fas fa-map-marker-alt"></i>'+ vo.area1 +'</h6>';
								tag += '<h6><i class="fas fa-coins mr-1"></i>희망시급 : '+ vo.desired_wage +'원 | <i class="fas fa-hands-helping"></i>협의유무: '+ vo.discussion +'</h6>';
								tag += '<h6><i class="fas fa-child"></i>'+ vo.birth +'세 ';
								if(vo.gender == 'F'){
									tag += '여자';
									}
								else if (vo.gender == 'M'){
									tag+= '남자';
									}
								tag += '</h6></span>';
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
	    
	    
	//====================최신순 필터=========================
		
		$(document).on("change", "#orderDropdown", function(){
				count=12;
				tabType=4;
				order = $(this).val();
				orderDropdownAjax(order)
   	 	});//ajax 
   	 	function orderDropdownAjax(order){
   	 	console.log("정렬="+order);
		
		var url = "/dbmon/filterOrder";
		var params = {
				order:order,
				count:count, 
		}
		console.log("파라미터="+params);
		$.ajax({
			url:url,
			data:params,
			type:'GET',
			success:function(result){
				
					var $result = $(result);
				var tag = "";
										
				$result.each(function(idx, vo){
				
					tag += '<div class="card" data-aos="fade-up" id="'+vo.userid+'" >';
					tag += '<img class="profilepic" src=';
					if(vo.pic==null){
						tag +='"img/profilepic.png"';
					} else {
						tag +='"upload/' +vo.pic+ '"';
					}
					tag += '/><br/>';
					tag += '<div class="card-body">';
						tag += '<h5 class="card-title"><b>' + vo.username.substring(0,1)+'O'+vo.username.substring(2)+'</b>';
						
						tag += '<span class="ml-2" style="font-size:0.7em">';
						if(vo.last_edit>525600){
							tag += Math.round(vo.last_edit/525600)+'년';
						} 
						if(vo.last_edit>43200){
							tag += Math.round(vo.last_edit/43200) +'달';
						} else if(vo.last_edit>1440){
							tag += Math.round(vo.last_edit/1440) +'일';
						} else if(vo.last_edit>60){
							tag += Math.round(vo.last_edit/60) +'시간';
						} else {
							tag += Math.round(vo.last_edit) +'분';
						}
						tag += ' 전</span>';
						tag += '<span class="emptyHeart">';
						tag += '<input type="hidden" value="'+ vo.userid +'" />';
						tag += '<i class="fab fa-gratipay" style=';
						if(vo.userid!=vo.cardid){
							tag += '"color:gray"';
						} else if(vo.userid == vo.cardid){
							tag += '"color:orange"';
						}
						tag += '></i>';
						tag += '</span>';
						tag += '</h5>';
									
						tag += '<span class="iconColor">';
						tag += '<h6 class="loc"><i class="fas fa-map-marker-alt"></i>'+ vo.area1 +'</h6>';
						tag += '<h6><i class="fas fa-coins mr-1"></i>희망시급 : '+ vo.desired_wage +'원 | <i class="fas fa-hands-helping"></i>협의유무: '+ vo.discussion +'</h6>';
						tag += '<h6><i class="fas fa-child"></i>'+ vo.birth +'세 ';
						if(vo.gender == 'F'){
							tag += '여자';
							}
						else if (vo.gender == 'M'){
							tag+= '남자';
							}
						tag += '</h6></span>';
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

	    $(document).on("click", "#genderBox>button", function(){
	    	count=12;
	    	tabType=1;
	    	gender = $(this).val();
	    	testAjax(gender)
	    });//ajax
		
	    //추가버튼 테스트
    	function testAjax(gender){
	    	console.log(gender);
	    	var url = "/dbmon/filterOrder";
			var params = {
					order:gender,
					count:count, 
			}
			console.log("파람="+params);
			$.ajax({
				url:url,
				data:params,
				type:'GET',
				success:function(result){
					//$("#Tcnt").text(result.length);

					var $result = $(result);
					var tag = "";
					
					$result.each(function(idx, vo){
					
						tag += '<div class="card" data-aos="fade-up"  id="'+vo.userid+'" >';
						tag += '<img class="profilepic" src=';
						if(vo.pic==null){
							tag +='"img/profilepic.png"';
						} else {
							tag +='"upload/' +vo.pic+ '"';
						}
						tag += '/><br/>';
						tag += '<div class="card-body">';
							tag += '<h5 class="card-title"><b>' + vo.username.substring(0,1)+'O'+vo.username.substring(2)+'</b>';
							
							tag += '<span class="ml-2" style="font-size:0.7em">';
							if(vo.last_edit>525600){
								tag += Math.round(vo.last_edit/525600)+'년';
							} else if(vo.last_edit>43200){
								tag += Math.round(vo.last_edit/43200) +'달';
							} else if(vo.last_edit>1440){
								tag += Math.round(vo.last_edit/1440) +'일';
							} else if(vo.last_edit>60){
								tag += Math.round(vo.last_edit/60) +'시간';
							} else {
								tag += Math.round(vo.last_edit) +'분';
							}
							tag += ' 전</span>';
							tag += '<span class="emptyHeart">';
							tag += '<input type="hidden" value="'+ vo.userid +'" />';
							tag += '<i class="fab fa-gratipay" style=';
							if(vo.userid!=vo.cardid){
								tag += '"color:gray"';
							} else if(vo.userid == vo.cardid){
								tag += '"color:orange"';
							}
							tag += '></i>';
							tag += '</span>';
							tag += '</h5>';
							
							tag += '<span class="iconColor">';
							tag += '<h6 class="loc"><i class="fas fa-map-marker-alt"></i>'+ vo.area1 +'</h6>';
							tag += '<h6><i class="fas fa-coins mr-1"></i>희망시급 : '+ vo.desired_wage +'원 | <i class="fas fa-hands-helping"></i>협의유무: '+ vo.discussion +'</h6>';
							tag += '<h6><i class="fas fa-child"></i>'+ vo.birth +'세 ';
							if(vo.gender == 'F'){
								tag += '여자';
								}
							else if (vo.gender == 'M'){
								tag+= '남자';
								}
							tag += '</h6></span>';
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
	    if(${activity_type=='등하원 돕기'}){
	    	activity_type='등하원돕기'
	    	actBoxAjax(activity_type);
	    }else if(${activity_type=='실내놀이'}){
	    	activity_type='실내놀이'
		    actBoxAjax(activity_type);
	    }else if(${activity_type=='야외활동'}){
	    	activity_type='야외활동'
			    actBoxAjax(activity_type);
		}else if(${activity_type=='학습지도'}){
	    	activity_type='학습지도'
			    actBoxAjax(activity_type);
		}else if(${activity_type=='영어놀이'}){
	    	activity_type='영어놀이'
			    actBoxAjax(activity_type);
		}else if(${activity_type=='가사돌봄'}){
	    	activity_type='간단청소'
			    actBoxAjax(activity_type);
		}else{
	    	testAjax(gender);
	    }
    	// 
	});//제이쿼리
	</script>
 <script>	
	//========================찜기능=================
   
    $(function(){	    
	    //좋아요 찜기능
	  
	    $(document).on("click", ".emptyHeart", function(event){
	    	event.stopPropagation();
	    	var cardid = $(this).children("input").val();
	    	console.log($(this).children("i").css("color"));
	    	if($(this).children("i").css("color")=="rgb(128, 128, 128)"){
		    	$(this).children("i").css("color","orange");
		    	console.log("카드 아이디="+cardid);
		    	var url = "/dbmon/insertHeartT";
				var params = "cardid="+cardid;
				console.log("파람="+params);
				$.ajax({
					url:url,
					data:params,
					type:'GET',
					success:function(result){
						console.log(result);
						//var $result = $(result);
						if(result=="1"){
							console.log("성공");
								
						}else if(result=="0"){
							console.log("insert문 실패");
						}
					}, error:function(){
						console.log("스트링 받기 에러");
						}
					
		   
		    });//$.ajax
	    	}else if($(this).children("i").css("color")=="rgb(255, 165, 0)"){
	    		$(this).children("i").css("color","gray");
	    		var url = "/dbmon/deleteHeartT";
	    		var params = "cardid="+cardid;
	    		$.ajax({
	    			url:url,
	    			data:params,
	    			type:'GET',
	    			success:function(result){
	    				
	    				if(result=="1"){
	    					console.log("성공");
	    				}else if(result=="0"){
	    					console.log("delete문 실패");
	    				}
	    			},error:function(){
	    				console.log("스트링 받기 에러");
	    			}
	    		});//$.ajax
	    		
	    	}//elseif
	    });//ajax
	
	   
		
	});//제이쿼리
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
		    })();
		  }
</script>
</head>
<body onload="mapResize()">
<!-- -------------------상단메뉴------------- -->
<div id="top">
<%@include file="/WEB-INF/views/top.jsp"%>
<br/>
</div>
<div class="container">

<!-- ---------------------필터들------ -->

<div>
	<button id="mapBtn" class="btn btn-warning btn-lg btn-block">가까운 돌봄몬 찾기
	
	
	</button>
	<div id="map">
	</div>
</div>
<input type="text" class="form-control border-warning mt-2" id="locFilter" placeholder="#돌봄 지역을 입력해주세요">


<form class="form-inline">
  
  <select id="dropdownCT" class="custom-select border-warning mt-2 mb-2" style="width:100%;">
    <option selected>돌봄 유형을 선택하시면, 맞춤 돌봄몬을 보여드려요</option>
    
    <optgroup label="2~10세 정기 돌봄"></optgroup>
    <option value="등하원">주5일등하원</option>
    <option value="놀이/학습">놀이/학습</option>
    
    
    <optgroup label="신생아/영아 정기 돌봄"></optgroup>
    <option value="신생아/영아 풀타임">풀타임</option>
    <option value="신생아/영아 보조">보조</option>
    
    <optgroup label="긴급/단기 돌봄"></optgroup>
    <option value="긴급/단기">긴급/단기</option>
    
    <option value="all">모든 돌봄 유형 보기</option>
    
	</select>
 </form>
 
 
 
 
 <!-- -------------성별------------------- -->
 <div id="genderBox" class="row" style= "width:100%; margin:0 0 10px 0">
	 <button class="btn btn-outline-warning col-4 rounded pt-1 pb-1 px-2" id="all" value="all" >전체 보기</button>
	 <button class="btn btn-outline-warning col-4 rounded pt-1 pb-1 px-2" id="F" value="F">여자 돌봄몬</button>
	 <button class="btn btn-outline-warning col-4 rounded pt-1 pb-1 px-2" id="M" value="M">남자 돌본몬</button>
 </div>
<!-- ----------------활동--------------- -->
  


   <div id="actBox" class="btn-group btn-group-toggle" data-toggle="buttons">
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options"  data-toggle="button" autocomplete="off"  id="act1"  class="actBtnClass"/>실내놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>등하원돕기
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>책읽기
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>야외활동
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>한글놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>영어놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>학습지도
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>체육놀이
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>간단청소
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>밥챙겨주기
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>간단설거지
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1 mr-2" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>장기입주
	  </label>
	  <label class="btn btn-outline-warning btn-sm rounded-pill pb-1" style="padding:13px; padding-top:7px; color: black;">
	  	<input type="radio" name="options" data-toggle="button" autocomplete="off" id="act2" class="actBtnClass"/>단기입주
	  </label>
	
  </div>
 
<!-- -------------------------순서 정렬--------------------- -->

   <div class="d-inline-block m-2" style="width:100%;">
	<div class="float-left" > 총 <span id="Tcnt">${totalRecord}</span>명의 돌봄몬</div>
	
	<div id="orderFilter" class="float-right" style="cursor:pointer; height:20px; overflow:hidden;">
		<select id="orderDropdown">
			<option value="last_edit">최신 순</option>
			<option value="certi_cnt">인증 수 순</option>
			<option value="wage_low">시급 낮은 순</option>
			<option value="wage_high">시급 높은 순</option>
		</select>
	</div>
	</div>

<!-- ----------------------------카드 디자인------------------------------ -->

	<div id="cardBox"  class="d-inline-block" style="width:100%; min-height:700px;">


	</div>
	<div><button style="position:relative; width:250px; left:38%; font-size:2em; margin-top: 50px; margin-bottom: 50px;" class="btn btn-warning" id="countTest">더보기</button></div>


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
        content: '<div style="padding:5px;">${vo.username.substring(0,1)}O${vo.username.substring(2)}<br/><a href="teacherView?userid=${vo.userid}">프로필보기</a></div>', 
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




</div>

<script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 2000
    });
</script>

</body>
<div id="momomo" style="width:100%;">
<jsp:include page="../footer.jsp"/><!-- container -->
</div>
</html>

