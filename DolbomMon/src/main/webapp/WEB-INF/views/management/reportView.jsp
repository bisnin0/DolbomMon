<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device, initial-scale=1" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.css" type="text/css" />
<link rel="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap" type="text/css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="<%=request.getContextPath() %>/css/bootstrap.js"></script>
<script>
	$(function(){
		$(document).on("click",".btn-outline-info",function(){
			document.reportForm.submit();
		})
		$(document).on("click","#topBtn",function(){
			history.back();
		});
		
	});

</script>
<style>
	*, html{
		font-family: 'Noto Sans KR', sans-serif;
	}
	html {
	    color: #222;
	    font-weight: 100;
	    font-size: 1em;
	    line-height: 1.375;
	}

	body{
		margin:0;
	}

	.CHMRN {
	    max-width: 600px;
	    margin: 20px auto;
	}
	.topDiv{
		color: rgba(0, 0, 0, 0.87);
	    background-color: white;
	    transition: all 450ms cubic-bezier(0.23, 1, 0.32, 1) 0ms;
	    box-sizing: border-box;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	    box-shadow: none;
	    border-radius: 0px;
	    position: relative;
	    z-index: 1100;
	    width: 100%;
	    display: flex;
	    padding-left: 24px;
	    padding-right: 24px;
	}
	#topBtn{
	    border: 10px;
	    box-sizing: border-box;
	    display: inline-block;
	    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
	    cursor: pointer;
	    text-decoration: none;
	    margin: 0px;
	    padding: 12px;
	    outline: none;
	    font-size: 0px;
	    font-weight: inherit;
	    position: relative;
	    z-index: 1;
	    overflow: visible;
	    width: 48px;
	    height: 48px;
	    background: none;	
    }
    #topBtn img{
	    display: inline-block;
	    color: rgba(0, 0, 0, 0.87);
	    fill: black;
	    height: 24px;
	    width: 24px;
	    user-select: none;
    }
    .topDiv2{
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    margin: 0px;
	    padding-top: 0px;
	    letter-spacing: 0px;
	    font-size: 24px;
	    font-weight: 600;
	    color: rgb(255, 255, 255);
	    height: 64px;
	    line-height: 64px;
	    flex: 1 1 0%;
    }
    .topDiv2>span{
    	color: black;
	    font-size: 20px;
	    vertical-align: top;
	    text-align: center;
	    position: absolute;
	    width: 200px;
	    left: calc(50% - 100px);
    }
    .topDiv3>button{
	    padding: 5px 15px;
	    margin-top: 5px;
	    font-size: 0.9em;
	    font-weight: 600;
    }
    #nameSpan{
	   	font-size: 15px;
	    color: #585858;
	    display: inline-block;
	    margin-left: 5px;
	    font-weight: 600;
    }
	.middleDiv{
		font-size: 16px;
	    line-height: 1.25;
	    text-align: left;
	    color: #3d3d3d;
	}
	@keyframes click-wave {
	  0% {
	    height: 20px;
	    width: 20px;
	    opacity: 0.35;
	    position: relative;
	  }
	  100% {
	    height: 55px;
	    width: 55px;
	    margin-left: -20px;
	    margin-top: -20px;
	    opacity: 0;
	  }
	}

	.option-input {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  -ms-appearance: none;
	  -o-appearance: none;
	  appearance: none;
	  position: relative;
	  top: 5px;
	  right: 0;
	  bottom: 0;
	  left: 0;
	  height: 20px;
	  width: 20px;
	  transition: all 0.15s ease-out 0s;
	  background: #fff;
	  border: none;
	  color: orange;
	  cursor: pointer;
	  display: inline-block;
	  margin-right: 0.5rem;
	  margin-left: 0.5rem;
	  outline: none;
	  position: relative;
	  z-index: 1000;
	  border:2px solid gray;
	}
	.option-input:hover {
	  background: lightblue;
	}
	.option-input:checked {
	  background: #fff;
	}
	.option-input:checked::before {
	  height: 20px;
	  width: 20px;
	  position: absolute;
	  left: -2px;
	  top: -2px;
	  content: '✔';
	  display: inline-block;
	  font-size: 16.66667px;
	  text-align: center;
	  line-height: 20px;
	}
	.option-input:checked::after {
	  -webkit-animation: click-wave 0.65s;
	  -moz-animation: click-wave 0.65s;
	  animation: click-wave 0.65s;
	  background: #40e0d0;
	  content: '';
	  display: block;
	  position: relative;
	  z-index: 100;
	}
	.option-input.radio {
	  border-radius: 50%;
	}
	.option-input.radio::after {
	  border-radius: 50%;
	}
	.shingo_reason{
	  display: -webkit-box;
	  display: -moz-box;
	  display: -ms-flexbox;
	  display: box;
	}
	.shingo_reason label{
		margin-bottom:1px;
		font-size:14px;
		font-weight:600;
	}
	.middleDiv2 textarea{
		width: 100%;
	    height: 250px;
	    padding: 20px;
	    background-color: #f5f5f5;
	    resize: none;
	    border: none;
	    font-weight: 400;
	    font-size: 13px;
	    line-height: 1.54;
	    text-align: left;
	    color: #585858;
	}
	.bottomDiv{
		font-size: 12px;
	    color: #3d3d3d;
	    margin: 20px 20px;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/top.jsp"%>
<div class="CHMRN">
	<div class="topDiv">
		<div style="margin-top:8px; margin-right:8px; margin-left:-16px;">
			<button tabindex="0" type="button" id="topBtn">
				<div>
					<img src="icon/X_icon.png">
				</div>
			</button>
		</div>
		<div class="topDiv2">
			<span>신고하기</span>
		</div>
		<div style="margin-top:8px; margin-right:-16px; margin-left:auto;" class="topDiv3">
			<button class="btn btn-outline-info">제출</button>
		</div>
	</div>
	<form name="reportForm" method="post" action="/dbmon/reportInsert">
	<div style="padding:0px 20px;">
		<div style="text-align:center; margin:20px 0;">
			<img src="icon/m-general.png" style="border-radius:60px; margin-bottom:10px; height:60px; width:60px;"><br/>
			<span style="font-size:14px; color:#585858;">no.${vo.no}</span>
			<span id="nameSpan">${firstName}○${lastName}</span>
		</div>
		<input type="hidden" name="shingo_id" value="${vo.userid }"/>
		<div class="middleDiv">
			<span style="font-weight:900; margin:15px 0;">신고 유형을 선택해주세요.</span>
			<div class="shingo_reason" style="margin-top:5px;">
			  <label>
			  	<input type="radio" class="option-input radio" name="shingo_reason" value="허위정보를 기재하였습니다." checked />
			  	허위정보를 기재하였습니다.
			  </label><br/>
			  <label>
			  	<input type="radio" class="option-input radio" name="shingo_reason" value="부적절한 사진입니다."  />
			  	부적절한 사진입니다.
			  </label><br/>
			  <label>
			    <input type="radio" class="option-input radio" name="shingo_reason" value="부적절한 내용입니다."  />
			    부적절한 내용입니다.
			  </label><br/>
			  <label>
			    <input type="radio" class="option-input radio" name="shingo_reason" value="규정을 위반하였습니다." checked />
			    규정을 위반하였습니다.
			  </label><br/>
			  <label>
			    <input type="radio" class="option-input radio" name="shingo_reason" value="돌봄몬 회원 자격이 없습니다."  />
			    돌봄몬 회원 자격이 없습니다.
			  </label><br/>
			  <label>
			    <input type="radio" class="option-input radio" name="shingo_reason" value="기타"  />
			    기타
			  </label>
			</div>
			<div style="margin-top:40px">
				<div style="font-weight:900; margin:15px 0;"><span>신고 내용을 입력해주세요.</span></div>
			</div>
		</div>
	</div>
		<div class="middleDiv2">
			<textarea name="shingo_detail" placeholder="예). 부적절한 사진이 올라가 있습니다. &#13;&#10;&#13;&#10;게시글일 경우 URL을 포함하여 신고해 주시기 바랍니다."></textarea>
		</div>	
	</form>	
		<p class="bottomDiv">
			* 이 회원이 신고대상에 해당하는지 다시 한번 확인하여 주시기 바랍니다. <br/><br/>
			* 신고 내용이 등록되면, 돌봄몬팀이 조사에 들어갈 것입니다. <br/><br/>
			* 신고자와 신고 내용은 외부에 공개되지 않습니다. <br/><br/>
			* 신고된 회원은 돌봄몬 약관에 따라 이용 제재 등 불이익을 받을 수 있습니다. <br/><br/>
		</p>
	

</div>
</body>
</html>
	<jsp:include page="../footer.jsp"/>