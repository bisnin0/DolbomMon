<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dolbommon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<%
String manager = (String)session.getAttribute("managerStatus");
if(manager!="Y"){
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%} %>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script src="css/jquery.bxslider.js"></script>
<link rel="stylesheet" href="css/jquery.bxslider.css" type="text/css"/>
</head>
<script>

</script>
<style type="text/css">
      *{
      margin: 0px;
      padding: 0px;
      list-style-type: none;
      cursor:pointer;
      font-family:"Noto Sans KR";
      
       }
   body{
      background-color:white; 
      cursor:pointer;
      font-family:"Noto Sans KR,sans-serif!important;";
      text-decoration:none;
      font-weight:bold;
      text-align: center;   
      
     
      }
   #slider{ 
         margin: 0 auto;
         width:100%;
         max-width:980px;
      }
    #list{
       text-align:center;
       margin:0 auto;
       
       }
    #listitem{
       
       position:relative;
       left:calc(10%);
       width:10%;
       
    }
   
    #list img{
       background-color:orange;
       font-family:"Noto Sans KR,sans-serif!important;";
    }
      li.list-group-item {
          background-color: orange;
          font-size:12px;
          font-weight:bold;
          margin:10px;
   }
    



</style>

<body>
<!-- -------------------상단메뉴------------- -->
<div id="top">
<jsp:include page="top.jsp"/>
</div>


<!-- -------------------bx슬라이더------------- -->
<div id="slider">
<%@ include file="/WEB-INF/views/bxslider.jsp" %>
</div>

 <!--================================================== -->
  <!-- Wrap the rest of the page in another container to center all the content. -->

  <div id="list" style="max-width: 1000px; margin: auto;">
  <ul id ="listitem" class="list-group list-group-horizontal-sm">
     <li class="list-group-item" style="border-radius:50%"><img src="img/a.png"  width="56" height="56"/><br/>등하원</li>
     <li class="list-group-item" style="border-radius:50%"><img src="img/b.png"  width="56" height="56"/><br/>실내놀이</li>
     <li class="list-group-item" style="border-radius:50%"><img src="img/c.png"  width="56" height="56"/><br/>야외활동</li>
     <li class="list-group-item" style="border-radius:50%"><img src="img/d.png"  width="56" height="56"/><br/>학습지도</li>
     <li class="list-group-item" style="border-radius:50%"><img src="img/f.png"  width="56" height="56"/><br/>영어놀이</li>
     <li class="list-group-item" style="border-radius:50%"><img src="img/g.png"  width="56" height="56"/><br/>가사돌봄</li>
  </ul>
  
  <!-- START THE FEATURETTES -->

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading">DOLBOMMON GUIDE<br/>Step 01.<br/><br/>
        <span class="text-muted">Join our membership!</span></h2><br/>
        <p class="lead">가장 빨리, 원하는 조건의 <br/>아이 돌보미를 구할 수 있는 <br/>
                 돌봄몬을 이용하기 위해<br/> 빠르고 간편한 회원가입을 진행해주세요.
        </p>
      </div>
      <div class="col-md-5">
        <img src="img/guide1.PNG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500"  focusable="false" role="img" /><rect width="100%" height="100%"/>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 order-md-2">
        <h2 class="featurette-heading">Step 02.<br/><br/>
        <span class="text-muted">Fill out an application form.<br/><br/>
      </span></h2>
         <p class="lead"> 
            부모님과 아이가 누구인지, 어떤 도움을 받고 싶은지, <br/>언제 활동하기 원하는지를 신청서에<br/> 상세하게 알려주세요. <br/>
            신청서 작성이 완료되면 <br/>시터님을 직접 찾을 수 있습니다.<br/>
         Tip.자기소개를 상세할수록, 내 후기가 많을수록, <br/>돌봄 기간이 짧을수록 시터님을 더 빨리 찾을 수 있습니다!
         </p>
     
      </div>
      <div class="col-md-5 order-md-1">
        <img src="img/guide2.PNG" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
      </div>
    </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7">
        <h2 class="featurette-heading"><br/>Step 03.<br/><br/>
        <span class="text-muted">Have an interview</span></h2>
        <p class="lead">
      먼저, 내가 직접 지역, 요일, 시간 등 <br/>다양하게 검색해서 마음에 쏙 드는 시터님을 <br/>찾아보세요.<br/>
      연락해보고 싶은 시터님이 있다면, <br/>인터뷰를 신청해보세요.<br/>
      내가 신청한 시터님이 3시간 안에 <br/>수락 또는 조율 응답을 하는 경우, <br/>시터님의 연락처가 부모님에게 공개됩니다. <br/>
      (마이페이지 > 구직현황에서 확인할 수 있습니다.)<br/>
      Tip.<br/>
      완료된 인증 수, 채용횟수, 후기 수가 많을수록 <br/>성실한 시터님일 확률이 높습니다.
        </p>
      </div>
      <div class="col-md-5">
       <img src="img/guide03.png" class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="500" height="500" xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMidYMid slice" focusable="false" role="img" aria-label="Placeholder: 500x500"><title>Placeholder</title><rect width="100%" height="100%" fill="#eee"/><text x="50%" y="50%" fill="#aaa" dy=".3em"></text>
      </div>
    </div>

    <hr class="featurette-divider">

    <!-- /END THE FEATURETTES -->

  </div><!-- /.container -->
    



</body>

</html>

<!-- ------------------footer------------- -->

<jsp:include page="footer.jsp"/>
