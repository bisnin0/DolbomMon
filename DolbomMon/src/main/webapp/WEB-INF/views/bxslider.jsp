<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<style>
	#bxslider img{height: 500px; text-align:center; width:100%;}
</style>
<script>
$(function(){
	$("#bxslider").bxSlider({
		mode :'horizontal'
		,slideWidth:800
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
		<li><a href="#"><img src="img/act01.png" /></a></li>
		<li><a href="#"><img src="img/act02.PNG" /></a></li>
		<li><a href="#"><img src="img/act03.png" /></a></li>
		<li><a href="#"><img src="img/act04.PNG" /></a></li>
		<li><a href="#"><img src="img/act01.png" /></a></li>
		<li><a href="#"><img src="img/act02.PNG" /></a></li>
		<li><a href="#"><img src="img/act03.png" /></a></li>
	</ul>
</div>
