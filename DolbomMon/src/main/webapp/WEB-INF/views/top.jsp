<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
   <script type="text/javascript">
         $(function(){
	     $("ul.sub").hide();
		 $("ul.menu li").hover(function(){
		    $("ul:not(:animated)",this).slideDown("fast");
			},
			function(){
			   $("ul",this).slideUp("fast");
			});
/* 		 $(function(){
				$(".menu>li").hover(function(){
					$(this).children("ul").css("display","block");
				}, function(){
					$(this).children("ul").css("display","none");
				
				}); */
		 
      });	
   </script>
 
   <style type="text/css">
      *{
		 margin: 0 auto;
		 padding: 0px;
		 list-style-type: none;
	 	 cursor:pointer;
     	 font-family:"Noto Sans KR";
     	
		 }
     
      html,
      body {
        width: 100%;
        height: 100%;
        
      }
      #container {
        width: 100%;
      }
	  #menu{
	  	width: -webkit-calc(100%);
	  	overflow:hidden;
	  	display:block;
	  	
	  }
	
      ul.menu li{ 
	     float: left;
		 width: 179px;
		 height: 48px;
		 background-color: white;
		 border-bottom:1px solid #f6a21c;
		 
		 position: relative;
		 z-index:1000;
		
		 }
      ul.menu li a{
	     display: block;
		 width: 100%;
		 height: 100%;
		 line-height: 48px;
		 text-indent: 30px;
		 font-weight:bold;
		 color: #f6a21c;
		 text-decoration: none;
		 font-family:"Noto Sans KR";
		 }
	  ul.menu li {
		width: calc(100%/6);
		}
	  ul.menu ul.sub li {width: 100%}
      ul.menu li a:hover{
	     background-color: #ffefd5;
	     opacity:20;
		 }
      ul.menu li ul.sub{
	     position: absolute;
		 }
      ul.menu{
	     zoom: 1;
		 }
      ul.menu:after{
	     height: 0;
		 visibility: hidden;
		 content: ".";
		 display: block;
		 clear: both;
		 }
		.logo{
		 
	      width:180px;
	      height:80px;
	   }
	   a.btn{
	   		float:right;
	   		margin-right:180px;
	   		
	   }
   </style>
</head>
<body>
 <div id="container">
 <header>
 <img src="<%=request.getContextPath()%>/img/DOL03.PNG" 
        class="logo" alt="Logo" src="home" style="margin-left:10px;" 
        Onclick="location.href='/dbmon'"/>
 <a class="btn">	
	<input type="button" value="가입하기" class="btn btn-outline-warning" style="color:ff6400" Onclick="location.href='/dbmon/join'"/>
	<input type="button" value="로그인" class="btn btn-outline-warning" style="color:ff6400" Onclick="location.href='/dbmon/login'"/>  			
</a> 				
</header>
  
  
   <ul class="menu">
       
       <li><a href="#">고객센터</a>
	     <ul class="sub">
		    <li><a href="/dbmon/brandIntro">회사소개</a></li>
			<li><a href="#">신고하기</a></li>
			<li><a href="#">서브메뉴A</a></li>
		 </ul>
		 </li>
	    <li><a href="/dbmon/noticeBoard">공지사항</a>
	    <ul class="sub">
		    <li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
			<li><a href="#">서브메뉴B</a></li>
		</ul>
		</li>
		<li><a href="/dbmon/freeBoard">자유게시판</a>

		</li>
		<li><a href="#">돌봄몬찾기</a>
		</li>
		<li><a href="#">일자리찾기</a>
	    
		</li>
		<li><a href="#">My Menu</a>
	    <ul class="sub">
		    <li><a href="/dbmon/join">결제조회</a></li>
			<li><a href="/dbmon/login">서브메뉴</a></li>
			<li><a href="teacherList">선생님페이지</a></li>
			<li><a href="#">부모님페이지</a></li>
		</ul>
   </ul>
   </div>
</body>
</html>