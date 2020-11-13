<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dolbommon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css"/>
<%
String manager = (String)session.getAttribute("managerStatus");
if(manager!="Y"){
	
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%} %>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script src="<%=request.getContextPath() %>/css/jquery.bxslider.js"></script>

</head>
<style>
   body{
      background-color:white; 
      cursor:pointer;
      font-family:"Noto Sans KR";
      text-decoration:none;
      font-weight:bold;
      
     
      }
   #slider{ 
   		margin: 0 auto;
   		width:100%;
   		max-width:980px;
   		
   	}
   ul{margin:0;padding:0px;list-style-type:none;}

     /*메뉴*/
    #menu>ul, #menu>ul>li{
       
       float:left;
    }
    #menu a:link, #menu a:visited {
       font-size:18px;
       text-decoration:none;
       color:black;
       font-weight:bold;
    }
    #menu a:hover{
       text-decoration:none;
       color: blue;
    }

    #menu ul{
       width:100%;
    
       height:72px;
       background-color:white;
       border-bottom : 1px solid gray;
    }
    #menu li{
       height:72px;
       line-height:72px;
       padding: 0 35px 0 40px;
       
    }
    .footer {
         width:100%;
         height:150px;
        
         bottom:0;
         background:#5eaeff;
        text-align: center;
        color: white;
   }
   .logo{
      width:180px;
      height:62px;
   }
   
</style>

<body>

<nav class="navbar navbar-light" id="menu" style="background-color: rgb(255,222,89)" overflow:auto;">
   <ul>
      <li><img src="<%=request.getContextPath()%>/img/DOL01.PNG" class="logo" alt="Logo" margin-right="50px" src="#"><li>
      <li><a href="/dbmon/freeBoard">자유게시판</a></li>
      <li><a href="#">공지</a></li>
      <li><a href="#">고객센터</a></li>
      <li><a href="#">돌봄몬찾기</a></li>
      <li><a href="#">일자리찾기</a></li>
      <li><a href="#">My Menu</a></li>
   </ul>
</nav>
<div id="slider">
<%@ include file="/WEB-INF/views/bxslider.jsp" %>
</div>
<h1>
	<a href="/dbmon/join">회원가입</a>
</h1>

<h1><a href="/dbmon/login">로그인</a></h1>


<a href="teacherList">선생님 페이지</a>
  

 <!--  <sitemesh:write property='body'/>-->
         <footer class="footer">
              <div>돌봄몬</div>
                 <div>
                 @ 2020 Dolbommon
                       
              
                 </div>
              <p>Copyright © 2020 Dolbommon.co.,Ltd. All rights reserved.</p>
             <address>Contact Dolbommon for more information. 02-1234-5678</address>

              
            
         </footer>

</body>

</html>

