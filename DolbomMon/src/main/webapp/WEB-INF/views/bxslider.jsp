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
<script src="css/jquery.bxslider.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<style>
   *{
        margin:0;
        padding:0;
       }
   #bxslider img{
      height: 500px; 
      text-align:center; width:100%;
      -moz-box-shadow: none;
      -webkit-box-shadow: none;
      box-shadow: none;
       border: 0;
        outline:0;
      border-right:0px; border-top:0px; boder-left:0px; boder-bottom:0px;
   }
  

 .bx-wrapper img{
  -moz-box-shadow: none;
  -webkit-box-shadow: none;
  box-shadow: none;
  border: 0;
  outline:0;
}
 




</style>
<script>
$(function(){
   $("#bxslider").bxSlider({
      mode :'horizontal'
      ,slideWidth:1200
      ,pager:false
      ,speed:1000 // 변환 속도
      ,auto:true // 자동 시작(true,false)
      ,randomStart:true //시작슬라이드 랜덤
      ,caption:true //title속성의 값을 설명으로 표시한다.(true,false)
      ,infiniteLoop:false//반복여부
      ,hideControlOnEnd: true//처음과 마지막에 컨트롤러 표시 여부 설정(true, false)
   //easing
      ,useCSS: true//easing 사용 여부 설정(true(easing사용안함), false(easing사용));
      
   
   });
});
</script>
</head>
<body>
<div>
   <ul id="bxslider">
      <li><a href="#"><img src="img/ca01.png" /></a></li>
      <li><a href="#"><img src="img/ca02.jpg" /></a></li>
      <li><a href="#"><img src="img/ca03.png" /></a></li>
      <li><a href="#"><img src="img/DOL02.PNG" /></a></li>
      <li><a href="#"><img src="img/ca05.png" /></a></li>
      <li><a href="#"><img src="img/22.jpg" /></a></li>
      <li><a href="#"><img src="img/3.jpg" /></a></li>
   </ul>
</div>
</body>
</html>