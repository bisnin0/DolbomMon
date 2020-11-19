<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>DolbomMon</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" type="text/css" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/74c16632e0.js" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>
	$(function(){
		$(".main-menu").hover(function(){
			$("#mainPage").css("left","250");
		},function(){
			$("#mainPage").css("left","100");
		});
		
	});
 
    function memberPage(url){
        var ajaxOption = {
                url : url,
                async : true,
                type : "POST",
                dataType : "html",
                cache : false
        };
        
        $.ajax(ajaxOption).done(function(data){
            $('#mainPage').children().remove();
            $('#mainPage').html(data);
        });
        
    }
    function logOut(){
		location.href="/dbmon/managerLogout";
    } 
    
	function openNewWindow() { 
		window.open("/dbmon/messagetest","","toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, width=482, height=600"); 
		}


</script>
<style>
	body, div{
		margin:0;
		padding:0;
	}
	#topBar{
		height:100px;
		background-color:lightblue;
		font-size:2em;
		line-height:2em;
		text-align:center;
	}
	#mainPage{
		position:absolute;
		left:60px;
		width: -webkit-calc(100% - 60px);
		height: -webkit-calc(100% - 100px);
		
	}
	/*
	button{
		margin-top:15px;
	}
	*/
	

	.fa {
		position: relative;
		display: table-cell;
		width: 60px;
		height: 36px;
		text-align: center;
		vertical-align: middle;
		font-size:30px;
	}
	.main-menu:hover,nav.main-menu.expanded {
		width:250px;
		overflow:visible;
	}
	
	.main-menu {
		background:#212121;
		border-right:1px solid #e5e5e5;
		position:absolute;
		top:0;
		bottom:0;
		height:100%;
		left:0;
		width:60px;
		overflow:hidden;
		-webkit-transition:width .05s linear;
		transition:width .05s linear;
		-webkit-transform:translateZ(0) scale(1,1);
		z-index:1000;	
	}
	
	.main-menu>ul {
		margin:7px 0;
	}
	
	.main-menu li {
		position:relative;
		display:block;
		width:250px;
		margin:10px 0px;
	}
	#top-ul>li{
		top:100px;
	}
	
	.main-menu li>a {
		position:relative;
		display:table;
		border-collapse:collapse;
		border-spacing:0;
		color:#999;
		 font-family: arial;
		font-size: 14px;
		text-decoration:none;
		-webkit-transform:translateZ(0) scale(1,1);
		-webkit-transition:all .1s linear;
		transition:all .1s linear;
	}
	
	.main-menu .nav-icon {
		position:relative;
		display:table-cell;
		width:60px;
		height:36px;
		text-align:center;
		vertical-align:middle;
		font-size:18px;
	}
	
	.main-menu .nav-text {
		position:relative;
		display:table-cell;
		vertical-align:middle;
		width:190px;
		font-family: 'Noto Sans KR', sans-serif;
	}
	
	.main-menu>ul.logout {
		position:absolute;
		left:0;
		bottom:0;
	}
	.nav-text {
		font-size:1.2em;
	}
	
	.no-touch .scrollable.hover {
		overflow-y:hidden;
	}
	
	.no-touch .scrollable.hover:hover {
		overflow-y:auto;
		overflow:visible;
	}
	
	a:hover,a:focus {
		text-decoration:none;
	}
	
	nav {
		-webkit-user-select:none;
		-moz-user-select:none;
		-ms-user-select:none;
		-o-user-select:none;
		user-select:none;
	}
	
	nav ul,nav li {
		outline:0;
		margin:0;
		padding:0;
	}
	.main-menu li:hover>a,nav.main-menu li.active>a,.dropdown-menu>li>a:hover,.dropdown-menu>li>a:focus,.dropdown-menu>.active>a,.dropdown-menu>.active>a:hover,.dropdown-menu>.active>a:focus,.no-touch .dashboard-page nav.dashboard-menu ul li:hover a,.dashboard-page nav.dashboard-menu ul li.active a {
		color:#fff;
		background-color:#5fa2db;
	}
	.area {
		float: left;
		background: #e2e2e2;
		width: 100%;
		height: 100%;
	}
	#nav-text {
		font-family: 'Noto Sans KR', sans-serif;
		font-style: normal;
		font-weight: 300;
	}

	
</style>

</head>
<body>
<div class="area"></div><nav class="main-menu">
            <ul id="top-ul">
                <li style="">
                    <a href="javascript:memberPage('/dbmon/');">
                        <i class="fa fa-home fa-2x"></i>
                        <span class="nav-text">
                            돌봄몬 메인
                        </span>
                    </a>
                  
                </li>
                <li class="has-subnav">
                    <a href="#">
                        <i class="fa fa-laptop fa-2x"></i>
                        <span class="nav-text">
                            이용자 현황
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="javascript:memberPage('/dbmon/memberManage');">
                       <i class="fa fa-list fa-2x"></i>
                        <span class="nav-text">
                            회원 관리
                        </span>
                    </a>
                    
                </li>
                <li class="has-subnav">
                    <a href="javascript:memberPage('/dbmon/managerManage');">
                       <i class="fa fa-folder-open fa-2x"></i>
                        <span class="nav-text">
                            매니저 관리
                        </span>
                    </a>
                   
                </li>
                <li>
                    <a href="javascript:memberPage('/dbmon/accountManage');">
                        <i class="fa fa-bar-chart-o fa-2x"></i>
                        <span class="nav-text">
                            회계 관리
                        </span>
                    </a>
                </li>
    	<!-- 	<li>
                    <a href="#">
                        <i class="fa fa-font fa-2x"></i>
                        <span class="nav-text">
                           추가버튼
                        </span>
                    </a>
                </li>
                <li>
                   <a href="#">
                       <i class="fa fa-table fa-2x"></i>
                        <span class="nav-text">
                            추가버튼
                        </span>
                    </a>
                </li>
                <li>
                   <a href="#">
                        <i class="fa fa-map-marker fa-2x"></i>
                        <span class="nav-text">
                            추가버튼
                        </span>
                    </a>
                </li>
 		-->           
                <li>
                    <a href="#">
                       <i class="fa fa-info fa-2x"></i>
                        <span class="nav-text">
                            신고처리
                        </span>
                    </a>
                </li>
            </ul>

            <ul class="logout">
                <li>
                   <a href="javascript:logOut()">
                         <i class="fa fa-power-off fa-2x"></i>
                        <span class="nav-text">
                            Logout
                        </span>
                    </a>
                </li>  
            </ul>
        </nav>




<!-- ============================= -->
<div id="topBar" id="topBar"><a href="javascript:openNewWindow()"><button class="btn btn-primary">쪽지</button></a></div><!-- 돌봄몬 사이트 네비게이션 위치 -->
<div id="mainPage"></div>
</body>
</html>