<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dolbommon</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script src="css/jquery.bxslider.js"></script>
<link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css"/>

<!-- 	<link href="<%=request.getContextPath() %>/css/style.css" rel="stylesheet">
		<link href="<%=request.getContextPath() %>/css/demo.css" rel="stylesheet"> -->

<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">

</head>

<script>

   $(function() {
     AOS.init({
       duration: 1200
     });
     onElementHeightChange(document.body, function(){
       AOS.refresh();
     });
   });


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
   
   
   
   
   
   $(window).scroll(function() {  
        var position = $(window).scrollTop(); 
      if (position >= 700){
         $(".redution").delay(500).fadeOut(1000);
     	AOS.init({
		    duration: 1200
		  });
		  onElementHeightChange(document.body, function(){
		    AOS.refresh();
		  });
      }
   });        
   

	$(function() {
	  AOS.init({
	    duration: 1200
	  });
	  onElementHeightChange(document.body, function(){
	    AOS.refresh();
	  });
	});


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
	
	
	$(window).scroll(function() {  
        var position = $(window).scrollTop(); 
		if (position >= 700){
			$(".redution").delay(500).fadeOut(1000);
		}
	});        


	jQuery(document).ready(function($) {

	$(".scroll").click(function(event){            

	event.preventDefault();

	$('html,body').animate({scrollTop:$(this.hash).offset().top-280}, 500);

	});

	});

	


</script>

<style type="text/css">
@media (max-width:768px){
   #listitem{overflow:hidden;}
   *, html, body, ul, li{overflow:hidden;}
 }

*{
   margin: 0px;
   padding: 0px;
   list-style-type: none;
   cursor:pointer;
   font-family: 'Noto Sans KR', sans-serif;
		}
	
   
   body{
      background-color:white; 
      cursor:pointer;
      font-family: 'Poor Story', cursive;
      text-decoration:none;
      max-width: 100%;
      min-width:70%;
      text-align: center; 
      margin:0; padding:0;
      }
   html{
       margin:0; padding:0;
       width: 100%;  
       font-family: 'Noto Sans KR', sans-serif;
   }
        
     
      }
    #list{
       text-align:center;
       margin:0 auto;
       
       }
    #listitem{
       
       width:10%;
       
    }
   
    #list img{
       background-color:rgb(255, 121, 40);
       font-family: 'Noto Sans KR', sans-serif;
       
       
       
    }
      li.list-group-item {
          background-color:rgb(255, 121, 40);
          font-size:12px;
          font-weight:bold;
          margin:10px;
          color:white;
          max-width: 100%;
    }


   h3{
      margin-top:30px;margin-bottom:30px; max-width: 100%;
      font-family: 'Noto Sans KR', sans-serif;
   }
   #homeWrap_ALL{width:100%;}
   .lead{font-size:17px; font-family: 'Noto Sans KR', sans-serif; font-weight:bold; color:#6c757d;}
   .jb-text { 
      position: absolute; 
      top: 50%; width: 100%; 
      font-family: 'Noto Sans KR', sans-serif;
      }
   .jb-text p { 
      margin-top: -24px; 
      text-align: center; 
      font-size: 48px; color: #ffffff; 
      font-family: 'Noto Sans KR', sans-serif;

   }


  
	.service-req {
    height: 488px;
    background: url(img/qwq11.jpg) no-repeat 50% 50%;
    background-size: cover;
    }
	.phero{
	display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    color:#fff;
    padding:166px 0px 0px;
    font-weight:bold;
    font-family: 'Noto Sans KR', sans-serif;
	}
	

</style>

<body>
<div id="homeWrap_ALL" >

<!-- -------------------상단메뉴------------- -->
<div id="toptoptop131" style="height:130px; margin-bottom:0px;">
<%@include file="/WEB-INF/views/top2.jsp"%>
</div>
 <div class="redution">
<video class="redution" src='img/video.mp4' width='100%' muted="muted" autoplay loop>
</video>

<div class="jb-text">
      <p style="font-family: 'Jua', sans-serif; font-size:120px;">돌봄몬</p>
      
      
      <h1 style="color:white; font-family: 'Jua', sans-seri;">안심 돌봄 서비스</h1>
      <br/><br/><br/><br/>
      <h2 style="color:white; font-family: 'Jua', sans-seri;"">육아에 도움이 필요할 땐 언제 어디서나</h2>
      <h2 style="color:gold; font-family: 'Jua', sans-seri;"">돌봄몬이 해결하겠습니다.</h2>
   </div>


 </div>
<!-- -------------------bx슬라이더------------- -->
<div id="slider" >
<%@ include file="/WEB-INF/views/bxslider.jsp" %>
</div>

 <!--================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div id="list" class="block" style="width: 100%; margin:0 auto;" data-aos="fade-down">
  <ul id ="listitem" class="list-group list-group-horizontal-sm"  style="width:100%; max-width:1000px; margin:0 auto;">
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter_list?activity_type=등하원 돕기"><img src="img/a.png"  width="56" height="56"/></a><br/>등하원 돕기</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter_list?activity_type=실내놀이"><img src="img/b.png"  width="56" height="56"/></a><br/>실내놀이</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter_list?activity_type=야외활동"><img src="img/c.png"  width="56" height="56"/></a><br/>야외활동</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter_list?activity_type=학습지도"><img src="img/d.png"  width="56" height="56"/></a><br/>학습지도</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter_list?activity_type=영어놀이"><img src="img/f.png"  width="56" height="56"/></a><br/>영어놀이</li>
     <li class="list-group-item" style="border-radius:50%; border:none; width:15%; height:100px; margin:0 30px;"><a href="/dbmon/sitter_list?activity_type=가사돌봄"><img src="img/g.png"  width="56" height="56"/></a><br/>가사돌봄</li>
  </ul>
  <br/><br/><hr class="featurette-divider">
  
<!-- ----------- --> 

<div id="teacher_chart" data-aos="fade-up">
<%@ include file="/WEB-INF/views/teacher_chart.jsp" %> 
</div>

<div id="advertise" data-aos="fade-up">
<%@ include file="/WEB-INF/views/advertiseDolbom.jsp" %>
</div>
    <hr class="featurette-divider">
<div id="QnAView" data-aos="fade-up">
<%@ include file="/WEB-INF/views/QandAview.jsp" %>
</div>  
    
<div data-aos="fade-up">
<img src="<%=request.getContextPath() %>/img/ii1212.svg" 
	style="width:150px;height:150px;margin:20px 0; background-color:white;" />	
</div>
<span style="font-weight:bold; font-size: 50px;font-family: 'Noto Sans KR', sans-serif; color:gray;">DOLBOMMON GUIDE</span>
<br/><br/><br/><br/>
<div id="mainContents4" >
    <div class="row featurette" style="width:800px; margin:0 auto;"  data-aos="fade-up">
      <div class="col-md-7"><br/><br/>
        <h2 class="featurette-heading" style="color:#ff7928; font-family: 'Noto Sans KR', sans-serif;">Step 01.<br/><br/>
        <span class="text-muted">Join our membership!</span></h2><br/>
        <p class="lead">가장 빨리, 원하는 조건의 <br/>아이 돌보미를 구할 수 있는 <br/>
                 돌봄몬을 이용하기 위해<br/> 빠르고 간편한 회원가입을 진행해주세요.
        </p>
      </div>
      <div class="col-md-5">
        <img src="img/guide1.PNG" Onclick="location.href='/dbmon/join'"class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500px" height="400px"  focusable="false" role="img" /><rect width="100%" height="100%"/>
      </div>
    </div>

    <hr class="featurette-divider"><br/><br/>

    <div class="row featurette" style="width:800px; margin:0 auto;" data-aos="fade-up">
      <div class="col-md-7 order-md-2"><br/><br/>
        <h2 class="featurette-heading" style="color:#ff7928; font-family: 'Noto Sans KR', sans-serif;">Step 02.<br/><br/>
        <span class="text-muted">Fill out an application form.<br/><br/>
      </span></h2><br/>
         <p class="lead"> 
            부모님과 아이가 누구인지, 어떤 도움을 받고 싶은지, <br/>언제 활동하기 원하는지를 신청서에<br/> 상세하게 알려주세요. <br/>
         <span style="color:#ff7942;"><br/>
         Tip.자기소개가 상세할수록, 내 후기가 많을수록, <br/>돌봄 기간이 짧을수록 시터님을 더 빨리 찾을 수 있습니다!
      </span>    
         </p>
     
      </div>
      <div class="col-md-5 order-md-1">
        <img src="img/guide2.PNG" Onclick="location.href='/dbmon/dbmSearchWriteForm'" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="400" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette" style="width:800px; margin:0 auto;" data-aos="fade-up">
      <div class="col-md-7">
        <h2 class="featurette-heading" style="color:#ff7928; font-family: 'Noto Sans KR', sans-serif;"><br/>Step 03.<br/><br/>
        <span class="text-muted">Have an interview</span></h2><br/><br/>
        <p class="lead">
      먼저, 내가 직접 지역, 요일, 시간 등 다양하게 검색해서  <br/>
      연락해보고 싶은 시터님이 있다면, 
      <br/>인터뷰를 신청해보세요.<br/>
      (마이페이지 > 구직현황에서 확인할 수 있습니다.)<br/><br/>
      <span style="color:#ff7942">Tip. 완료된 인증 수, 채용횟수, 후기 수가 많을수록 <br/>성실한 시터님일 확률이 높습니다.</span>
        </p>
      </div>
      <div class="col-md-5">
       <img src="img/guide03.png" Onclick="location.href='/dbmon/join'" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="400" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
      </div>
    </div>
</div> <!-- Maincontents4 -->
    

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
   
</div><!-- </homeWrap_ALL> -->
 
 <div class="service-req" style="margin-bottom:0;">
 <h2 class="phero">지금 바로 돌봄몬 만나기</h2> 
 <div class="btn1234123" >
 <a href="/dbmon/join" class="btn-act1234"
		style="background: #ff7942; color: #fff; 
		border-radius:100px; height: 110px;
		text-align: center; -webkit-box-direction: normal;
		word-break: break-all; padding: 0 55px;
	    font-size: 25px; font-family:Noto Sans KR,sans-serif!important;
	    line-height: 100px;">돌봄서비스 신청</a>
 </div></div>
<script>
    AOS.init({
        easing: 'ease-out-back',
        duration: 2000
    });
 
</script>

</body>

</html>

<!-- ------------------footer------------- -->

<jsp:include page="footer.jsp"/>