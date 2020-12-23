<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
   <script type="text/javascript">
   
         $(function(){
	     $("ul.subMain").hide();
		 $("ul.mainTopmenu li").hover(function(){
		    $("ul:not(:animated)",this).slideDown("fast");
			},
			function(){
			   $("ul",this).slideUp("fast");
			});

		 //채팅창 오픈
			var popupWidth = 1060;
			var popupHeight = 596;
			var popupX = (window.screen.width / 2) - (popupWidth / 2);
			var popupY= (window.screen.height / 2) - (popupHeight / 2);
			$(document).on("click",".ccBtn",function(){
				console.log("test");
				var userid = $(this).attr('id');
				window.open('/dbmon/chat?userid='+userid, '', 'status=no, height=' + popupHeight + ', width=' + popupWidth + ', left='+ popupX + ', top='+ popupY);
			});
		 
      });	
   </script>

   
   <style type="text/css">
HTML CSSResult
EDIT ON
/* 폰트적용 */
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
@media screen and(min-width:768px){
	*, html, body, a{overflow:hidden;}
	#fixed-menu{
		overflow:hidden;
	}
	#topHeader{overflow:hidden;}
	#menu-button{
		overflow:hidden;
	}
	#topmenu-button{
		overflow:hidden;
	}
	.clearfix{
		overflow:hidden;
		
	}
	ul.mainTopmenu {
		overflow:hidden;
	}
	.subMain{
		overflow:hidden;
	}
	
	ul.mainTopmenu li a{
		overflow:hidden;
	}
}
/* ===================미디어 쿼리 end ===================*/
     #menu-button{
     	-webkit-padding-start:0px;
     	
     }
     #topmenu-button{
     	-webkit-padding-start:250px;
     	-webkit-tap-highlight-color: rgba(255, 255, 255, 0);
     }

      #fixed-menu {
        width: 100%;
        height:120px;
	 	position: fixed;
	  	top: 0px;
	  	left: 0px;
	 	z-index:10000;
	 	background-color:white;
	 	
      }
	  ul.mainTopmenu{
	  	height: 50px;
	  	background-color: white;
	  	
	  
	  
	  
	  }
      ul.mainTopmenu li{ 
	     float: left;
		 width: 263px;
		 height: 50px;
		 text-align:center;
		 position: relative;
		 z-index:1000;
		 list-style-type: none;
		 -webkit-padding-start:0px;
		 font-family: 'Noto Sans KR', sans-serif;
		 
		 }
      ul.mainTopmenu li a{
	     display: block;
		 width: 100%;		
		 height: 100%;
		 line-height: 50px;
		 font-weight:500;
		 font-size:16px;
		 overflow:hidden;
		 color:gray;
		 text-decoration: none;
		 text-align:center;
		 list-style-type: none;
		 font-family: font-family: 'Jua', sans-serif;
		 margin-left:0px;
		 
		 
		 
		 }
	  ul.mainTopmenu li {
		width: calc(80%/6);
		height:50px;
		line-height:50px;
		
		
		}
	  ul.mainTopmenu ul.subMain li {
	    width: 100%;
	    -webkit-padding-start:0px;
	    height:50px;
	    
	    }
	  
	  
      ul.mainTopmenu li a:hover{
	     opacity:50;
	     color: gray;
	     font-family: 'Jua', sans-serif; font-size:21px;
	     font-weight:500;
	    
		 }
      ul.mainTopmenu li ul.subMain{
	     position: absolute;
	     
		 }
      ul.mainTopmenu{
	     zoom: 1;
	     margin-bottom:0;
	     
		 }
      ul.mainTopmenu:after{
	     height: 0;
		 visibility: hidden;
		 content: ".";
		 display: block;
		 clear: both;
		 
		 }
		
	  .logo{
	      width:100px;
	      height:45px;
	      margin-top:15px; 
	   }
	   
	   header#topHeader{
	   		margin-left:50px;
	   		
	   		
	   }
	   a.ppp{
	   		float:right;
	   		margin-right:180px;
	   		
	   }
	   #fixtopLogo:after { clear:both;} 
	   .mainTopmenu>li *{
	   -webkit-padding-start:0px;
	    width:100%;
	   
	   }
	   .spread-underline {
		  text-decoration: none;
		  display: inline-block;
		  padding: 2px 0;
		  position: relative;
		}
		.spread-underline:after {    
		  background: none repeat scroll 0 0 transparent;
		  bottom: 0;
		  content: "";
		  display: block;
		  height: 2px;
		  left: 50%;
		  position: absolute;
		  
		  transition: width 0.3s ease 0s, left 0.3s ease 0s;
		  width: 0;
		}
		.spread-underline:hover:after { 
		  width: 100%; 
		  height:3px;
		  left: 0; 
		  
		}
		.ml-1, .mx-1 {
  		  margin-left: 100px;
		}
		.subMain{background-color:white;}
   </style>
</head>
<body>
<div style="height:130px;">
 <div id="fixed-menu" >
	 <div class="clearfix" id="topMenuMainItem" style="-webkit-padding-start:250px; width:1530px;">
	    <header id="topHeader">
	    <img src="<%=request.getContextPath()%>/img/mylogo.png" 
	           class="logo" alt="Logo" src="home" style="margin-top:20px; float:left;" 
	           Onclick="location.href='/dbmon'"/>
	
				<c:if test="${logStatus != null || logStatus=='Y'}">
	           <span style="float:right;" class="row">
	           <span id="groupchat1" class="col" style="width:70px; height:80px; margin-right:5px;">
	           <img class="btn ppp ccBtn" src="icon/chat6.png" style="height:55px; width:65px;margin-rignt:0px;">
	           <div class="badge badge-warning badge-pill ml-1" style="margin-right:0px;">채팅하기</div></img>
	           <a href="javascript:void(window.open('/dbmon/message','message','width=482,height=600,status=no,toolbar=no,resizable=yes,scrollbars=no, left=500, top=120'))">
	           </span>
	           <span style="float:right" class="row">
	           <span id="groupchat2" class="col" style="width:90px;height:80px; margin-left:5px;">
	           <img class="btn ppp" src="icon/chatbot5.PNG" style="height:55px; width:65px; margin-left:0px; "></img>
	           <div class="badge badge-warning badge-pill ml-1" style=" margin-left:2px;">쪽지</div></a>
	           </span>
	           </span>
	          <!-- <a href="/dbmon/temporaryLogin">
	           <button class="btn btn-info ppp">임시선생로그인</button></a>
	           <a href="/dbmon/temporaryLoginP">
	           <button class="btn btn-info ppp">임시부모로그인</button></a>--> 
	           </span> 
	           </c:if>
	       
		<a class="btn" style="float:right; margin-top:30px;"> 
		 	<c:if test="${logStatus == null || logStatus=='N'}">
			  
	         <input type="button" value="가입하기" class="btn btn-outline-#ff7942 ppp22" style="background-color:#ff7928; color:white; border-radius: 18px;" Onclick="location.href='/dbmon/join'"/>
	        </c:if>
	         <c:if test="${logStatus == null || logStatus=='N'}">
	          <input type="button" value="로그인" class="btn btn-outline-warning ppp22" style="color:#ff7928;  border-radius: 18px;" Onclick="location.href='/dbmon/login'"/> 
	          </c:if>
	    
	    
	         <c:if test="${logStatus != null || logStatus=='Y'}" ><span class="btn btn-outline-warning LogId" style="color:#ff7942; border-radius: 18px;">

	         ${username } 님 </span><input type="button" value="로그아웃" class="btn btn-outline-warning ppp" style="color:ff7942; border-radius: 18px; margin-left:5px;" Onclick="location.href='/dbmon/logout'"/>           

	         </c:if>
	         
	
	  		</a>             
	   </header>
	
	
	</div> 
	
	   <ul class="mainTopmenu" id="topmenu-button" style="min-width:1200px;">
	       
	       <li class="spread-underline"><a href="#">고객센터</a>
	
		        <ul class="subMain">
		          <li class="spread-underline"><a class="introcss11" href="/dbmon/brandIntro">회사소개</a></li>
		          <li class="spread-underline"><a href="/dbmon/#target2" class="scroll">실시간 후기</a></li>  
		          <li class="spread-underline"><a href="/dbmon/#target1" class="scroll">자주 묻는 질문</a></li>     
		       </ul>
	       </li>
	       <li  class="spread-underline"><a href="/dbmon/noticeBoard">공지사항</a>
	       <ul class="subMain">    
	       
	      </ul>
	      </li>
	      <li><a href="/dbmon/freeBoard" class="spread-underline">자유게시판</a>
	
	
	      </li>
	      <li><a href="/dbmon/parent_list" class="spread-underline" style="font-weight:bold; color:#ff7942;">#일자리찾기</a> <!-- 돌봄몬이 학부모구하는것 -->
	      </li>
	      <li><a href="/dbmon/sitter_list" class="spread-underline" style="font-weight:bold; color:#ff7942;">#돌봄몬찾기</a> <!-- 학부모가 돌봄몬구하는것 --> 
	       
	      </li>
	      <li><a href="#" class="spread-underline">My Menu</a>

	 

	      <ul class="subMain">
			<c:if test="${who =='T'}">
			<li><a href="teacherList" class="spread-underline">마이페이지</a></li>
			<li><a href="/dbmon/identityForm" class="spread-underline" >계정관리</a></li>
			</c:if>
			<c:if test="${who =='P'}">
	        <li><a href="mypage" class="spread-underline">마이페이지</a></li>
			<li><a href="dbmSearchWriteForm" class="spread-underline" >선생님 구하기</a></li>
	        <li><a href="/dbmon/identityForm" class="spread-underline" >계정관리</a></li>
	        </c:if>
	      </ul>
	 </ul>

 </div>
</div>